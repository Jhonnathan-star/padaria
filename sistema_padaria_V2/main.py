import os
from database.connection import conectar
from services.telas_service import inserir_telas, ver_e_alterar_telas_por_data
from services.horarios_service import inserir_horarios_separados, buscar_historico_por_data
from services.pedidos_service import inserir_pedidos_automatizado, inserir_pedidos_manual
from services.predicao_service import criar_predicao_semana
from utils.colors import VERDE, RESET

def main():
    os.system('cls' if os.name == 'nt' else 'clear')
    print(f"{VERDE}====== SISTEMA DE PADARIA ======{RESET}")
    print("Opção de inserção de dados:")
    print(f"{VERDE}--{RESET}")
    print("1. Inserir dados de telas (opcion: horarios)")
    print("2. Inserir dados somente de horarios")
    print("3. Criar predição da semana")
    print("4. Ver ou alterar dados das telas")
    print("5. Buscar relatório por data")
    print("6. Fazer previsão do pedido (automatizada)")
    print("7. Fazer pevisão em pedidos (manualmente)")
    print("8. Sair")

    opcao = input("\nEscolha uma opção (1-8): ")

    conn = conectar()
    if not conn:
        return

    try:
        if opcao == '1':
            inserir_telas(conn)
        elif opcao == '2':
            inserir_horarios_separados(conn)
        elif opcao == '3':
            criar_predicao_semana(conn)
        elif opcao == '4':
            ver_e_alterar_telas_por_data(conn)
        elif opcao == '5':
            buscar_historico_por_data(conn)
        elif opcao == '6':
            inserir_pedidos_automatizado(conn)
        elif opcao == '7':
            inserir_pedidos_manual(conn)
        elif opcao == '8':
            print("Encerrando o sistema.")
            return
        else:
            print("Opção inválida. Tente novamente.")
    finally:
        conn.close()
        print("Conexão fechada.")

if __name__ == "__main__":
    main()