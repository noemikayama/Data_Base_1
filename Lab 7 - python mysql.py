import mysql.connector


mydb = mysql.connector.connect(
 host="localhost",
 user="root",
 password="Mali3696*",
 database = 'bd1'
)

cursor = mydb.cursor()

table_produtos = []
cursor.execute("SELECT nome, preco FROM produtos")
table_produtos = cursor.fetchall()


print("=" * 50)
print("|\t PRODUTO \t|", end= "")
print("\t PREÇO \t|")
print("="*50)

for i in range(len(table_produtos)):
    print(f"\t {table_produtos[i][0]} \t", end = "")
    print(f"\t {table_produtos[i][1]} \t")


