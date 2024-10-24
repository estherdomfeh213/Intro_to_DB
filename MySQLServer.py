import mysql.connector 

try:
  server_connection = mysql.connector.connect(
    host ='localhost',
    password= 'WJ28@krhps',
    user = 'root'
  )
  my_cursor = server_connection.cursor()
  
  my_cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
  my_cursor.close()
  server_connection.close()
  
except(  Exception, mysql.connector.Error ) as e:
  print(e)
  
else: 
  print("Database 'alx_book_store' created successfully!")
  
