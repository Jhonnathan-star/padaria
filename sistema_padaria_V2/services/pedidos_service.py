from datetime import datetime, timedelta
from utils.calculos import calcular_pacotes
from utils.colors import VERDE, RESET

def inserir_pedidos_manual(conn):
    cursor = conn.cursor()

    print("\nInserindo previsão manual de pedidos...\n")
    
    data_str = input("Digite a data da previsão (formato: AAAA-MM-DD): ").strip()
    try:
        data = datetime.strptime(data_str, "%Y-%m-%d").date()
    except ValueError:
        print("Data inválida. Use o formato AAAA-MM-DD.")
        return

    tipo_pao_grossa = input("Qual tipo de grossa? (G3 ou G4): ").strip().upper()
    tipo_pao_fina = input("Qual tipo de fina? (F3 ou F4): ").strip().upper()

    # Quantidade de telas
    try:
        qtde_telas_grossa = int(input(f"Quantas telas de Grossa {tipo_pao_grossa}? "))
        qtde_telas_fina = int(input(f"Quantas telas de Fina {tipo_pao_fina}? "))
    except ValueError:
        print("Digite apenas números inteiros para as quantidades.")
        return

    # Cálculo de pacotes
    pacotes_grossa = calcular_pacotes(qtde_telas_grossa, tipo_pao_grossa)
    pacotes_fina = calcular_pacotes(qtde_telas_fina, tipo_pao_fina)

    # Dividindo igualmente em 2 dias
    dias = [data, data + timedelta(days=1)]
    pacotes_g_por_dia = pacotes_grossa // 2
    pacotes_f_por_dia = pacotes_fina // 2

    print("\nPrevisão por dia:")
    print("-" * 40)
    for dia in dias:
        print(f"{dia}: Grossa: {pacotes_g_por_dia} pct | Fina: {pacotes_f_por_dia} pct")

    print("-" * 40)
    print(f"Total de pacotes de {tipo_pao_grossa} (grossa): {pacotes_grossa} pct")
    print(f"Total de pacotes de {tipo_pao_fina} (fina): {pacotes_fina} pct")

    # Valor total com base na fórmula correta
    valor_total = (pacotes_grossa + pacotes_fina) * 64

    # Confirmação antes de inserir no banco
    inserir = input("\nDeseja inserir esses dados na tabela 'pedidos'? (s/n): ").strip().lower()
    if inserir == 's':
        insert_query = """
            INSERT INTO pedidos (`Data`, `Grossa (PCT)`, `Fina (PCT)`, `Valor R$`)
            VALUES (%s, %s, %s, %s)
        """
        cursor.execute(insert_query, (str(data), pacotes_grossa, pacotes_fina, valor_total))
        conn.commit()
        print(f"Dados inseridos na tabela 'pedidos'. Valor total: R$ {valor_total:.2f}")
    else:
        print("Inserção cancelada pelo usuário.")

def inserir_pedidos_automatizado(conn):
    cursor = conn.cursor(dictionary=True)

    tipo_pao_grossa = input("Qual tipo de grossa? (G3 ou G4): ").strip().upper()
    tipo_pao_fina = input("Qual tipo de fina? (F3 ou F4): ").strip().upper()
    data_inicio = input("Data início (AAAA-MM-DD): ").strip()
    data_fim = input("Data fim (AAAA-MM-DD): ").strip()

    try:
        dt_inicio = datetime.strptime(data_inicio, "%Y-%m-%d").date()
        dt_fim = datetime.strptime(data_fim, "%Y-%m-%d").date()
    except ValueError:
        print("Datas inválidas.")
        return

    dias = (dt_fim - dt_inicio).days + 1
    total_grossa = 0
    total_fina = 0

    print("\nPrevisão por dia:")
    print("-" * 40)

    for i in range(dias):
        data_atual = dt_inicio + timedelta(days=i)

        # Consultar dados da tabela 'telas'
        query = """
            SELECT telas_grossa_manha, telas_grossa_tarde, telas_fina_manha, telas_fina_tarde
            FROM telas
            WHERE data = %s
        """
        cursor.execute(query, (str(data_atual),))
        resultado = cursor.fetchone()

        if resultado:
            # Garantir que valores None sejam tratados como 0
            telas_grossa_manha = resultado['telas_grossa_manha'] or 0
            telas_grossa_tarde = resultado['telas_grossa_tarde'] or 0
            telas_fina_manha = resultado['telas_fina_manha'] or 0
            telas_fina_tarde = resultado['telas_fina_tarde'] or 0

            # Calcular pacotes
            pacotes_grossa = calcular_pacotes(telas_grossa_manha, tipo_pao_grossa) + calcular_pacotes(telas_grossa_tarde, tipo_pao_grossa)
            pacotes_fina = calcular_pacotes(telas_fina_manha, tipo_pao_fina) + calcular_pacotes(telas_fina_tarde, tipo_pao_fina)

            print(f"{data_atual}: Grossa: {pacotes_grossa} pct | Fina: {pacotes_fina} pct")

            total_grossa += pacotes_grossa
            total_fina += pacotes_fina

    print("-" * 40)
    print(f"Total de pacotes de {tipo_pao_grossa} (grossa): {total_grossa} pct")
    print(f"Total de pacotes de {tipo_pao_fina} (fina): {total_fina} pct")

    valor_total = (total_grossa + total_fina) * 64

    # Perguntar ao usuário se deseja inserir no banco
    inserir = input("\nDeseja inserir esses dados na tabela 'pedidos'? (s/n): ").strip().lower()
    if inserir == 's':
        insert_query = """
            INSERT INTO pedidos (`Data`, `Grossa (PCT)`, `Fina (PCT)`, `Valor R$`)
            VALUES (%s, %s, %s, %s)
        """
        cursor.execute(insert_query, (str(dt_inicio), total_grossa, total_fina, valor_total))
        conn.commit()
        print(f"Dados inseridos na tabela 'pedidos'. Valor total: R$ {valor_total:.2f}")

    cursor.close()