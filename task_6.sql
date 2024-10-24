import mysql.connector

try:
    -- Connect to the MySQL server
    server_connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='WJ28@krhps'
    )

    --Create a cursor to interact with the database
    my_cursor = server_connection.cursor()

    -- Use the specified database
    my_cursor.execute("USE alx_book_store;")

    --Insert a single row into the customers table
    my_cursor.execute("""
        INSERT INTO customer (customer_id, customer_name, email, address) VALUES 
        (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness Ave.'),
        (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness Ave.'),
        (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness Ave.');
""")

    -- Commit the transaction
    server_connection.commit()

    -- Close the cursor and connection
    my_cursor.close()
    server_connection.close()

    print("Data inserted successfully.")

except mysql.connector.Error as e:
    print(f"Error: {e}")
