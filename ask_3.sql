import mysql.connector 

server_connection = mysql.connector.connect(
  host ='localhost',
  password = 'WJ28@krhps',
  user = 'root'
)

my_cursor = server_connection.cursor()

my_cursor.execute("USE alx_book_store;")
  
my_cursor.execute("SHOW TABLES;")


tables = my_cursor.fetchall()

print("Tables in the 'alx_book_store' database:")

for table in tables:
    print(table[0]) 



my_cursor.close()
server_connection.close()
  
  

  