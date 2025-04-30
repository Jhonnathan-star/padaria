import pandas as pd
from datetime import datetime, timedelta
from sklearn.ensemble import RandomForestRegressor
from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from utils.colors import VERDE, RESET

def criar_predicao_semana(conn):
    cursor = conn.cursor(dictionary=True)

    # Buscar dados históricos com JOIN
    cursor.execute("""
        SELECT h.tipo_pao, h.turno, h.quantidade_vendida, t.data, h.horario
        FROM horarios h
        JOIN telas t ON h.id_telas = t.id_telas
        WHERE h.quantidade_vendida IS NOT NULL
    """)
    dados = cursor.fetchall()
    cursor.close()

    if not dados:
        print("Nenhum dado encontrado para treinar o modelo.")
        return

    df = pd.DataFrame(dados)
    df['data'] = pd.to_datetime(df['data'])
    df['tipo_pao'] = df['tipo_pao'].str.lower().str.strip()
    df['turno'] = df['turno'].str.lower().str.strip().replace('manhã', 'manha')
    df['dia_semana'] = df['data'].dt.day_name()

    # Converter horário para decimal
    df['horario'] = pd.to_datetime(df['horario'], format='%H:%M', errors='coerce')
    df['horario'] = df['horario'].dt.hour + df['horario'].dt.minute / 60
    df['horario'] = df['horario'].fillna(-1)

    X = df[['tipo_pao', 'turno', 'dia_semana', 'horario']]
    y = df['quantidade_vendida']

    preprocessador = ColumnTransformer(transformers=[
        ('cat', OneHotEncoder(handle_unknown='ignore'), ['tipo_pao', 'turno', 'dia_semana'])
    ])

    modelo = Pipeline(steps=[
        ('preprocessador', preprocessador),
        ('regressor', RandomForestRegressor(n_estimators=100, random_state=42))
    ])

    modelo.fit(X, y)

    # Buscar todas as datas já previstas
    cursor = conn.cursor()
    cursor.execute("SELECT data FROM telas")
    datas_existentes = set(row[0].strftime('%Y-%m-%d') for row in cursor.fetchall())
    cursor.close()

    # Calcular a partir da maior data registrada
    if datas_existentes:
        ultima_data = max(datetime.strptime(d, '%Y-%m-%d') for d in datas_existentes)
    else:
        ultima_data = datetime.today()

    previsoes = []
    turnos = ['manha', 'tarde']
    tipos = ['grossa', 'fina']

    for i in range(1, 8):  # próximos 7 dias
        data_futura = ultima_data + timedelta(days=i)
        data_formatada = data_futura.strftime('%Y-%m-%d')
        dia_semana = pd.Timestamp(data_futura).day_name()

        if data_formatada in datas_existentes:
            continue  # pula se já tem no banco

        previsao_dia = {
            'data': data_formatada,
            'semana': dia_semana,
            'telas_grossa_manha': None,
            'telas_grossa_tarde': None,
            'telas_fina_manha': None,
            'telas_fina_tarde': None
        }

        for tipo in tipos:
            for turno in turnos:
                if dia_semana == 'Sunday' and turno == 'tarde':
                    continue  # sem tarde no domingo
                hora = 11.0 if turno == 'manha' else 19.5
                entrada = pd.DataFrame([[tipo, turno, dia_semana, hora]],
                                       columns=['tipo_pao', 'turno', 'dia_semana', 'horario'])
                try:
                    pred = modelo.predict(entrada)[0]
                    chave = f'telas_{tipo}_{turno}'
                    previsao_dia[chave] = round(pred)
                except:
                    pass

        previsoes.append(previsao_dia)

    # Exibir previsões
    if previsoes:
        print(f"\n{VERDE}Previsões para a próxima semana (sem repetir datas):{RESET}\n")
        for p in previsoes:
            print(f"{p['semana']} ({p['data']}):")
            print(f"   Grossa Manhã: {p['telas_grossa_manha']}")
            print(f"   Fina Manhã: {p['telas_fina_manha']}")
            if p['semana'] != 'Sunday':
                print(f"   Grossa Tarde: {p['telas_grossa_tarde']}")
                print(f"   Fina Tarde: {p['telas_fina_tarde']}")
            print()
    else:
        print("Nenhuma previsão nova gerada. Todas as datas já existem na tabela.")

    # Inserção no banco
    if previsoes:
        inserir_no_banco = input("Deseja inserir as previsões no banco de dados? (sim/não): ")
        if inserir_no_banco.lower() == 'sim':
            cursor = conn.cursor()
            for p in previsoes:
                query = """
                    INSERT INTO telas (data, semana, telas_grossa_manha, telas_grossa_tarde, telas_fina_manha, telas_fina_tarde)
                    VALUES (%s, %s, %s, %s, %s, %s)
                """
                cursor.execute(query, (
                    p['data'], p['semana'],
                    p['telas_grossa_manha'],
                    p['telas_grossa_tarde'] if p['semana'] != 'Sunday' else None,
                    p['telas_fina_manha'],
                    p['telas_fina_tarde'] if p['semana'] != 'Sunday' else None
                ))
            conn.commit()
            cursor.close()
            print(f"\n{VERDE}Previsões inseridas com sucesso no banco de dados!{RESET}")
    conn.close()

