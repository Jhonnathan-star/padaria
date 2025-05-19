import pandas as pd
from datetime import timedelta
from sklearn.neural_network import MLPRegressor
from sklearn.model_selection import GridSearchCV
from sklearn.preprocessing import OneHotEncoder, StandardScaler
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.metrics import mean_absolute_error, r2_score
from utils.colors import VERDE, RESET

def criar_predicao_semana(conn):
    cursor = conn.cursor(dictionary=True)

    # Buscar dados históricos da tabela "telas"
    cursor.execute("""
        SELECT data, semana, telas_grossa_manha, telas_grossa_tarde, telas_fina_manha, telas_fina_tarde
        FROM telas_vendidas3
        WHERE telas_grossa_manha IS NOT NULL
    """)
    dados = cursor.fetchall()
    cursor.close()

    df = pd.DataFrame(dados)
    df['data'] = pd.to_datetime(df['data'])
    df['dia_semana'] = df['data'].dt.day_name()

    # Criar proxy de clima: diferença entre manhã e tarde
    df['impacto_clima_grossa'] = df['telas_grossa_manha'] - df['telas_grossa_tarde']
    df['impacto_clima_fina'] = df['telas_fina_manha'] - df['telas_fina_tarde']

    # Função para treinar o modelo com validação cruzada e otimização de hiperparâmetros
    def treinar_modelo(coluna, impacto_clima):
        X = df[['dia_semana', impacto_clima]]
        y = df[coluna]

        preprocessor = ColumnTransformer(transformers=[
            ('cat', OneHotEncoder(drop='first'), ['dia_semana']),
            ('num', StandardScaler(), [impacto_clima])
        ])

        pipeline = Pipeline(steps=[
            ('preprocessor', preprocessor),
            ('regressor', GridSearchCV(
                estimator=MLPRegressor(max_iter=1000, random_state=42),
                param_grid={
                    'hidden_layer_sizes': [(50,), (100,), (50, 50)],
                    'alpha': [0.0001, 0.001]
                },
                scoring='r2',
                cv=5
            ))
        ])

        pipeline.fit(X, y)
        y_pred = pipeline.predict(X)
        r2 = r2_score(y, y_pred)
        mae = mean_absolute_error(y, y_pred)

        print(f"{coluna}: R² = {r2:.3f}, MAE = {mae:.2f}")
        return pipeline

    print(f"{VERDE}\nTreinando modelos de regressão MLP para contagem:{RESET}")
    modelos = {
        'telas_grossa_manha': treinar_modelo('telas_grossa_manha', 'impacto_clima_grossa'),
        'telas_grossa_tarde': treinar_modelo('telas_grossa_tarde', 'impacto_clima_grossa'),
        'telas_fina_manha': treinar_modelo('telas_fina_manha', 'impacto_clima_fina'),
        'telas_fina_tarde': treinar_modelo('telas_fina_tarde', 'impacto_clima_fina'),
    }

    ultima_data = df['data'].max()

    previsoes = []
    for i in range(1, 8):
        data_futura = ultima_data + timedelta(days=i)
        dia = data_futura.day_name()

        # Estimar impacto_clima como a média histórica
        impacto_clima_grossa = df['impacto_clima_grossa'].mean()
        impacto_clima_fina = df['impacto_clima_fina'].mean()

        previsao_dia = {
            'data': data_futura.strftime('%Y-%m-%d'),
            'semana': dia,
            'telas_grossa_manha': round(modelos['telas_grossa_manha'].predict(pd.DataFrame([[dia, impacto_clima_grossa]], columns=['dia_semana', 'impacto_clima_grossa']))[0]),
            'telas_grossa_tarde': round(modelos['telas_grossa_tarde'].predict(pd.DataFrame([[dia, impacto_clima_grossa]], columns=['dia_semana', 'impacto_clima_grossa']))[0]) if dia != 'Sunday' else 0,
            'telas_fina_manha': round(modelos['telas_fina_manha'].predict(pd.DataFrame([[dia, impacto_clima_fina]], columns=['dia_semana', 'impacto_clima_fina']))[0]),
            'telas_fina_tarde': round(modelos['telas_fina_tarde'].predict(pd.DataFrame([[dia, impacto_clima_fina]], columns=['dia_semana', 'impacto_clima_fina']))[0]) if dia != 'Sunday' else 0,
        }

        previsoes.append(previsao_dia)

    print(f"\n{VERDE}Previsões para a próxima semana:{RESET}\n")
    for p in previsoes:
        print(f"{p['semana']} ({p['data']}):")
        print(f"   Grossa Manhã: {p['telas_grossa_manha']}")
        print(f"   Fina Manhã: {p['telas_fina_manha']}")
        print(f"   Grossa Tarde: {p['telas_grossa_tarde']}")
        print(f"   Fina Tarde: {p['telas_fina_tarde']}")
        print()

    inserir_no_banco = input("Deseja inserir as previsões no banco de dados? (sim/não): ")

    if inserir_no_banco.lower() == 'sim':
        cursor = conn.cursor()
        for p in previsoes:
            query = """
                INSERT INTO telas (data, semana, telas_grossa_manha, telas_grossa_tarde, telas_fina_manha, telas_fina_tarde)
                VALUES (%s, %s, %s, %s, %s, %s)
            """
            cursor.execute(query, (
                p['data'], p['semana'], p['telas_grossa_manha'], p['telas_grossa_tarde'], 
                p['telas_fina_manha'], p['telas_fina_tarde']
            ))
        conn.commit()
        cursor.close()
        print(f"{VERDE}Dados inseridos com sucesso no banco de dados.{RESET}")

    else:
        data_anterior = None
        while True:
            alterar = input("Deseja alterar alguma previsão existente? (sim/não): ")

            if alterar.lower() == 'não':
                break

            if data_anterior:
                continuar_na_mesma_data = input(f"Você já alterou previsões para a data {data_anterior}. Deseja continuar alterando essa data? (sim/não): ")
                if continuar_na_mesma_data.lower() == 'não':
                    data_anterior = None

            if not data_anterior:
                data_alterar = input("Digite a data (YYYY-MM-DD) da previsão a ser alterada: ")

            previsao_encontrada = next((p for p in previsoes if p['data'] == data_alterar), None)

            if previsao_encontrada:
                print(f"Previsão encontrada para {data_alterar}:")
                print(f"   Semana: {previsao_encontrada['semana']}, Grossa Manhã: {previsao_encontrada['telas_grossa_manha']}, "
                      f"Grossa Tarde: {previsao_encontrada['telas_grossa_tarde']}, Fina Manhã: {previsao_encontrada['telas_fina_manha']}, "
                      f"Fina Tarde: {previsao_encontrada['telas_fina_tarde']}")

                turno = input("Qual turno deseja alterar? (Grossa Manhã/Grossa Tarde/Fina Manhã/Fina Tarde): ")
                novo_valor = int(input(f"Digite o novo valor para {turno}: "))

                if turno == "Grossa Manhã":
                    previsao_encontrada['telas_grossa_manha'] = novo_valor
                elif turno == "Grossa Tarde":
                    previsao_encontrada['telas_grossa_tarde'] = novo_valor
                elif turno == "Fina Manhã":
                    previsao_encontrada['telas_fina_manha'] = novo_valor
                elif turno == "Fina Tarde":
                    previsao_encontrada['telas_fina_tarde'] = novo_valor

                print(f"{VERDE}Previsão para {turno} em {data_alterar} atualizada com sucesso.{RESET}")
                data_anterior = data_alterar

            else:
                print(f"{VERDE}Nenhuma previsão encontrada para a data {data_alterar}.{RESET}")

            continuar = input("Deseja continuar alterando outras previsões? (sim/não): ")
            if continuar.lower() == 'não':
                break

        inserir_no_banco = input("Deseja inserir as previsões no banco de dados agora? (sim/não): ")
        if inserir_no_banco.lower() == 'sim':
            cursor = conn.cursor()
            for p in previsoes:
                query = """
                    INSERT INTO telas (data, semana, telas_grossa_manha, telas_grossa_tarde, telas_fina_manha, telas_fina_tarde)
                    VALUES (%s, %s, %s, %s, %s, %s)
                """
                cursor.execute(query, (
                    p['data'], p['semana'], p['telas_grossa_manha'], p['telas_grossa_tarde'], 
                    p['telas_fina_manha'], p['telas_fina_tarde']
                ))
            conn.commit()
            cursor.close()
            print(f"{VERDE}Dados inseridos com sucesso no banco de dados.{RESET}")

    conn.close()

