from datetime import datetime
from database.connection import conectar
from services.horarios_service import inserir_horarios_personalizado
from utils.colors import VERDE, RESET

def inserir_telas(conn):
    cursor = conn.cursor()
    data_str = input("Digite a data (AAAA-MM-DD): ")

    try:
        data_obj = datetime.strptime(data_str, "%Y-%m-%d")
        semana_en = data_obj.strftime("%A")
        dias_semana_pt = {
            "Monday": "segunda-feira",
            "Tuesday": "terça-feira",
            "Wednesday": "quarta-feira",
            "Thursday": "quinta-feira",
            "Friday": "sexta-feira",
            "Saturday": "sábado",
            "Sunday": "domingo"
        }
        semana = dias_semana_pt[semana_en]
        domingo_ou_feriado = semana == "domingo"
    except ValueError:
        print("Data inválida. Use o formato AAAA-MM-DD.")
        return None

    telas_grossa_manha = int(input("Telas grossa manhã: "))
    telas_fina_manha = int(input("Telas fina manhã: "))

    if domingo_ou_feriado:
        telas_grossa_tarde = 0
        telas_fina_tarde = 0

        sql = """
            INSERT INTO telas (
                data, semana,
                telas_grossa_manha, telas_grossa_tarde,
                telas_fina_manha, telas_fina_tarde
            )
            VALUES (%s, %s, %s, %s, %s, %s)
        """
        valores = (data_str, semana, telas_grossa_manha, telas_grossa_tarde, telas_fina_manha, telas_fina_tarde)
    else:
        try:
            telas_grossa_tarde = int(input("Telas grossa tarde: ") or 0)
            telas_fina_tarde = int(input("Telas fina tarde: ") or 0)
        except ValueError:
            print("Valor inválido. Digite um número inteiro.")
            return None

        sql = """
            INSERT INTO telas (
                data, semana,
                telas_grossa_manha, telas_grossa_tarde,
                telas_fina_manha, telas_fina_tarde
            )
            VALUES (%s, %s, %s, %s, %s, %s)
        """
        valores = (data_str, semana, telas_grossa_manha, telas_grossa_tarde, telas_fina_manha, telas_fina_tarde)

    cursor.execute(sql, valores)
    conn.commit()
    id_telas = cursor.lastrowid
    print(f"Dados inseridos na tabela 'telas' para {semana.title()} ({data_str}).")

    resposta = input("Deseja inserir dados na tabela 'horarios'? (s/n): ").strip().lower()

    if resposta == 's':
        inserir_horarios_personalizado(conn, id_telas, telas_grossa_manha, telas_grossa_tarde, telas_fina_manha, telas_fina_tarde, domingo_ou_feriado)
        return id_telas, telas_grossa_manha, telas_grossa_tarde, telas_fina_manha, telas_fina_tarde, domingo_ou_feriado
    else:
        print("👋 Não inserindo dados na tabela 'horarios'. Encerrando o processo.")
        return None


def ver_e_alterar_telas_por_data(conn):
    cursor = conn.cursor()
    data_input = input("Digite a data que deseja consultar (formato: AAAA-MM-DD): ").strip()

    try:
        data_formatada = datetime.strptime(data_input, "%Y-%m-%d").date()
    except ValueError:
        print("Data inválida. Use o formato AAAA-MM-DD.")
        return

    cursor.execute("""
        SELECT id_telas, data, semana, telas_grossa_manha, telas_grossa_tarde, telas_fina_manha, telas_fina_tarde
        FROM telas
        WHERE data = %s
    """, (data_formatada,))

    registros = cursor.fetchall()

    if not registros:
        print("Nenhum dado encontrado para essa data.")
        return

    for r in registros:
        print(f"""
ID: {r[0]}
Data: {r[1]}
Semana: {r[2]}
Telas Grossa (Manhã): {r[3]}
Telas Grossa (Tarde): {r[4]}
Telas Fina (Manhã): {r[5]}
Telas Fina (Tarde): {r[6]}
        """)

        alterar = input("Deseja alterar este registro? (s/n): ").strip().lower()
        if alterar == 's':
            nova_grossa_manha = input(f"Novo valor para telas_grossa_manha (ou Enter para manter {r[3]}): ") or r[3]
            nova_grossa_tarde = input(f"Novo valor para telas_grossa_tarde (ou Enter para manter {r[4]}): ") or r[4]
            nova_fina_manha   = input(f"Novo valor para telas_fina_manha (ou Enter para manter {r[5]}): ") or r[5]
            nova_fina_tarde   = input(f"Novo valor para telas_fina_tarde (ou Enter para manter {r[6]}): ") or r[6]

            cursor.execute("""
                UPDATE telas SET
                    telas_grossa_manha = %s,
                    telas_grossa_tarde = %s,
                    telas_fina_manha = %s,
                    telas_fina_tarde = %s
                WHERE id_telas = %s
            """, (nova_grossa_manha, nova_grossa_tarde, nova_fina_manha, nova_fina_tarde, r[0]))

            conn.commit()
            print("Registro atualizado com sucesso.")
        else:
            print("Registro mantido.")

    cursor.close()
