import pandas as pd
from datetime import datetime, timedelta
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
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

    # Função auxiliar para montar dataset para cada tipo de tela/turno
    def treinar_modelo(coluna, df):
        X = df[['dia_semana']]
        y = df[coluna]
        pipeline = Pipeline(steps=[
            ('onehot', ColumnTransformer([('cat', OneHotEncoder(), ['dia_semana'])])),
            ('regressor', LinearRegression())
        ])
        pipeline.fit(X, y)
        return pipeline

    modelos = {
        'telas_grossa_manha': treinar_modelo('telas_grossa_manha', df),
        'telas_grossa_tarde': treinar_modelo('telas_grossa_tarde', df),
        'telas_fina_manha': treinar_modelo('telas_fina_manha', df),
        'telas_fina_tarde': treinar_modelo('telas_fina_tarde', df),
    }

    # Obter a última data registrada
    ultima_data = df['data'].max()

    # Gerar previsões para os próximos 7 dias
    previsoes = []
    for i in range(1, 8):
        data_futura = ultima_data + timedelta(days=i)
        dia = data_futura.day_name()

        previsao_dia = {
            'data': data_futura.strftime('%Y-%m-%d'),
            'semana': dia,
            'telas_grossa_manha': round(modelos['telas_grossa_manha'].predict(pd.DataFrame([[dia]], columns=['dia_semana']))[0]),
            'telas_grossa_tarde': round(modelos['telas_grossa_tarde'].predict(pd.DataFrame([[dia]], columns=['dia_semana']))[0]) if dia != 'Sunday' else 0,
            'telas_fina_manha': round(modelos['telas_fina_manha'].predict(pd.DataFrame([[dia]], columns=['dia_semana']))[0]),
            'telas_fina_tarde': round(modelos['telas_fina_tarde'].predict(pd.DataFrame([[dia]], columns=['dia_semana']))[0]) if dia != 'Sunday' else 0,
        }

        previsoes.append(previsao_dia)

    # Mostrar previsões
    print(f"\n{VERDE}Previsões para a próxima semana:{RESET}\n")
    for p in previsoes:
        print(f"{p['semana']} ({p['data']}):")
        print(f"   Grossa Manhã: {p['telas_grossa_manha']}")
        print(f"   Fina Manhã: {p['telas_fina_manha']}")
        print(f"   Grossa Tarde: {p['telas_grossa_tarde']}")
        print(f"   Fina Tarde: {p['telas_fina_tarde']}")
        print()

    # Pergunta se deseja inserir previsões no banco
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

            # Verificar se a data está na lista de previsões geradas
            previsao_encontrada = None
            for p in previsoes:
                if p['data'] == data_alterar:
                    previsao_encontrada = p
                    break

            if previsao_encontrada:
                print(f"Previsão encontrada para {data_alterar}:")
                print(f"   Semana: {previsao_encontrada['semana']}, Grossa Manhã: {previsao_encontrada['telas_grossa_manha']}, "
                      f"Grossa Tarde: {previsao_encontrada['telas_grossa_tarde']}, Fina Manhã: {previsao_encontrada['telas_fina_manha']}, "
                      f"Fina Tarde: {previsao_encontrada['telas_fina_tarde']}")

                turno = input("Qual turno deseja alterar? (Grossa Manhã/Grossa Tarde/Fina Manhã/Fina Tarde): ")
                novo_valor = int(input(f"Digite o novo valor para {turno}: "))

                # Atualizar o valor na previsão
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

                # Atualizar o modelo com os dados alterados
                df_alterado = pd.DataFrame(previsoes)
                modelos = {
                    'telas_grossa_manha': treinar_modelo('telas_grossa_manha', df_alterado),
                    'telas_grossa_tarde': treinar_modelo('telas_grossa_tarde', df_alterado),
                    'telas_fina_manha': treinar_modelo('telas_fina_manha', df_alterado),
                    'telas_fina_tarde': treinar_modelo('telas_fina_tarde', df_alterado),
                }

            else:
                print(f"{VERDE}Nenhuma previsão encontrada para a data {data_alterar}.{RESET}")

            # Perguntar se o usuário quer continuar alterando
            continuar = input("Deseja continuar alterando outras previsões? (sim/não): ")
            if continuar.lower() == 'não':
                break
        
        # Perguntar novamente se deseja inserir as previsões no banco
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



