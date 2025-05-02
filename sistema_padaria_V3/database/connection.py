import mysql.connector
from mysql.connector import Error

def conectar():
    try:
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='xxxxxx',
            database='padaria'
        )
        if conn.is_connected():
            print("Conexão bem-sucedida ao banco de dados")
            return conn
    except Error as e:
        print(f"Erro ao conectar: {e}")
        return None
