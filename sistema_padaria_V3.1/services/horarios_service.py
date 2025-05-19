from utils.colors import VERDE, RESET

def processa_turno(conn, id_telas, tipo_pao, turno, total_telas):
    cursor = conn.cursor()

    if total_telas == 0:
        return

    # Coleta data e semana da tabela telas
    cursor.execute("SELECT data, semana FROM telas WHERE id_telas = %s", (id_telas,))
    resultado = cursor.fetchone()
    if resultado:
        data, dia_semana = resultado
    else:
        data, dia_semana = None, None  # Apenas segurança

    if tipo_pao == 'grossa':
        acabou = input(f"Acabou o {tipo_pao} todo pela {turno}? (s/n): ").lower()
        if acabou == 's':
            horario = input(f"Que horas acabou o {tipo_pao} pela {turno}? (HH:MM:SS): ")
            quantidade_vendida = total_telas
        else:
            sobra = int(input("Quantas telas sobraram? "))
            horario = None
            quantidade_vendida = total_telas - sobra
    else:
        sobrou = input(f"Sobrou alguma tela de {tipo_pao} pela {turno}? (s/n): ").lower()
        if sobrou == 's':
            sobra = int(input("Quantas telas sobraram? "))
            horario = None
            quantidade_vendida = total_telas - sobra
        else:
            horario = input(f"Que horas acabou o {tipo_pao} pela {turno}? (HH:MM:SS): ")
            quantidade_vendida = total_telas

    # Insere na tabela horarios
    sql1 = """
        INSERT INTO horarios (id_telas, tipo_pao, turno, horario, quantidade_vendida)
        VALUES (%s, %s, %s, %s, %s)
    """
    valores1 = (id_telas, tipo_pao, turno, horario, quantidade_vendida)
    cursor.execute(sql1, valores1)

    # Define o nome da coluna correta para telas_vendidas3
    coluna = f"telas_{tipo_pao}_{turno}"

    # Atualiza ou insere na tabela telas_vendidas3
    colunas_validas = ['telas_grossa_manha', 'telas_grossa_tarde', 'telas_fina_manha', 'telas_fina_tarde']
    if coluna in colunas_validas:
        cursor.execute("SELECT COUNT(*) FROM telas_vendidas3 WHERE id_telas = %s", (id_telas,))
        existe = cursor.fetchone()[0]

        if existe:
            sql2 = f"UPDATE telas_vendidas3 SET {coluna} = %s WHERE id_telas = %s"
            cursor.execute(sql2, (quantidade_vendida, id_telas))
        else:
            sql3 = f"""
                INSERT INTO telas_vendidas3 (id_telas, {coluna}, data, semana)
                VALUES (%s, %s, %s, %s)
            """
            cursor.execute(sql3, (id_telas, quantidade_vendida, data, dia_semana))

    # Verificação especial para domingo: se só tem 2 registros de id_telas na tabela horarios, preencher tarde com 0
    cursor.execute("SELECT COUNT(*) FROM horarios WHERE id_telas = %s", (id_telas,))
    total_registros = cursor.fetchone()[0]

    if total_registros == 2:  # só manhã foi registrada
        sql_update = """
            UPDATE telas_vendidas3
            SET telas_grossa_tarde = COALESCE(telas_grossa_tarde, 0),
                telas_fina_tarde = COALESCE(telas_fina_tarde, 0)
            WHERE id_telas = %s
        """
        cursor.execute(sql_update, (id_telas,))

    conn.commit()
    print(f"✅ Dados inseridos: {tipo_pao} {turno} - Vendido: {quantidade_vendida}, Horário: {horario or '---'}")

def inserir_horarios_personalizado(conn, id_telas, telas_grossa_manha, telas_grossa_tarde, telas_fina_manha, telas_fina_tarde, domingo_ou_feriado):
    # Sempre processa o turno da manhã
    processa_turno(conn, id_telas, 'grossa', 'manha', telas_grossa_manha)
    processa_turno(conn, id_telas, 'fina', 'manha', telas_fina_manha)

    # Só processa tarde se não for domingo/feriado
    if not domingo_ou_feriado:
        processa_turno(conn, id_telas, 'grossa', 'tarde', telas_grossa_tarde)
        processa_turno(conn, id_telas, 'fina', 'tarde', telas_fina_tarde)

def inserir_horarios_separados(conn): 
    cursor = conn.cursor()
    data = input("Qual data você deseja registrar o horário? (AAAA-MM-DD): ")

    cursor.execute("SELECT id_telas, telas_grossa_manha, telas_grossa_tarde, telas_fina_manha, telas_fina_tarde FROM telas WHERE data = %s", (data,))
    resultado = cursor.fetchone()

    if resultado:
        id_telas, telas_grossa_manha, telas_grossa_tarde, telas_fina_manha, telas_fina_tarde = resultado
        print(f"Data encontrada: {data} (ID: {id_telas})")

        from datetime import datetime
        dia_da_semana = datetime.strptime(data, '%Y-%m-%d').weekday()

        if dia_da_semana == 6:
            print("É domingo, registrando apenas os turnos da manhã.")
            processa_turno(conn, id_telas, 'grossa', 'manha', telas_grossa_manha)
            processa_turno(conn, id_telas, 'fina', 'manha', telas_fina_manha)
        else:
            print("Registrando os turnos da manhã e tarde.")
            processa_turno(conn, id_telas, 'grossa', 'manha', telas_grossa_manha)
            processa_turno(conn, id_telas, 'fina', 'manha', telas_fina_manha)
            processa_turno(conn, id_telas, 'grossa', 'tarde', telas_grossa_tarde)
            processa_turno(conn, id_telas, 'fina', 'tarde', telas_fina_tarde)
    else:
        print(f"❌ Nenhuma data encontrada para {data}. Por favor, insira uma data válida que esteja presente na tabela 'telas'.")

def buscar_historico_por_data(conn):
    cursor = conn.cursor()
    data = input("Digite a data para buscar (AAAA-MM-DD): ")

    sql = """
        SELECT 
            t.data,
            t.semana,
            t.telas_grossa_manha,
            t.telas_grossa_tarde,
            t.telas_fina_manha,
            t.telas_fina_tarde,
            h.tipo_pao,
            h.turno,
            h.horario,
            h.quantidade_vendida
        FROM telas t
        LEFT JOIN horarios h ON t.id_telas = h.id_telas
        WHERE t.data = %s
    """

    cursor.execute(sql, (data,))
    resultados = cursor.fetchall()

    if resultados:
        print("-" * 40)
        print("-" * 40)
        print(f"\nResumo do dia {data}:\n")
        primeira_linha = resultados[0]
        print(f"Data: {primeira_linha[0]}")
        print(f"Semana: {primeira_linha[1]}")
        print(f"Telas Grossa (Manhã): {primeira_linha[2]}")
        print(f"Telas Grossa (Tarde): {primeira_linha[3]}")
        print(f"Telas Fina (Manhã): {primeira_linha[4]}")
        print(f"Telas Fina (Tarde): {primeira_linha[5]}")
        print("-" * 40)

        for row in resultados:
            tipo_pao = row[6]
            turno = row[7]
            horario = row[8]
            quantidade = row[9]

            print(f"Tipo de Pão: {tipo_pao} | Turno: {turno}")
            if horario:
                print(f"⏰ Horário: {horario} | Vendido: {quantidade}")
            else:
                print(f"Vendidos: {quantidade}")
            print("-" * 30)
    else:
        print("Nenhum dado encontrado para essa data.")