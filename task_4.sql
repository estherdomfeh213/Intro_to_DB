 import mysql.connector

try:
    server_connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='WJ28@krhps'
    )

    
    my_cursor = server_connection.cursor()

    
    my_cursor.execute("USE alx_book_store;")

   
    my_cursor.execute("""
        SELECT 
            COLUMN_NAME AS 'Column Name',
            DATA_TYPE AS 'Data Type',
            CHARACTER_MAXIMUM_LENGTH AS 'Max Length',
            IS_NULLABLE AS 'Is Nullable',
            COLUMN_DEFAULT AS 'Default Value'
        FROM 
            INFORMATION_SCHEMA.COLUMNS 
        WHERE 
            TABLE_NAME = 'Books' 
            AND TABLE_SCHEMA = 'alx_book_store';
    """)

    -- Fetch the results
    columns = my_cursor.fetchall()

    -- Print the results
    print("Full description of the 'books' table:")
    for column in columns:
        print(column)

    -- Close the cursor and connection
    my_cursor.close()
    server_connection.close()

except mysql.connector.Error as e:
    print(f"Error: {e}")
