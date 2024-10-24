import mysql.connector
from mysql.connector import Error

try:
    server_connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='WJ28@krhps',
        database='alx_book_store' 
    )
    
    my_cursor = server_connection.cursor()


    my_cursor.execute("""
        CREATE TABLE Authors (
            author_id INT AUTO_INCREMENT PRIMARY KEY,
            author_name VARCHAR(215) NOT NULL
        );
    """)

    my_cursor.execute("""
        CREATE TABLE Books (
            book_id INT AUTO_INCREMENT PRIMARY KEY,
            title VARCHAR(130) NOT NULL,
            author_id INT,
            price DOUBLE NOT NULL,
            publication_date DATE,
            FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        );
    """)

    my_cursor.execute("""
        CREATE TABLE Customers (
            customer_id INT AUTO_INCREMENT PRIMARY KEY,
            customer_name VARCHAR(215) NOT NULL,
            email VARCHAR(215) NOT NULL,
            address TEXT
        );
    """)

    my_cursor.execute("""
        CREATE TABLE Orders (
            order_id INT AUTO_INCREMENT PRIMARY KEY,
            customer_id INT,
            order_date DATE NOT NULL,
            FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        );
    """)

   
    my_cursor.execute("""
        CREATE TABLE Order_Details (
            order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
            order_id INT,
            book_id INT,
            quantity DOUBLE NOT NULL,
            FOREIGN KEY (order_id) REFERENCES Orders(order_id),
            FOREIGN KEY (book_id) REFERENCES Books(book_id)
        );
    """)

    server_connection.commit()

    
    my_cursor.close()
    server_connection.close()

except Error as e:
    print(f"Error: {e}")

else:
    print("Tables created successfully in the 'alx_book_store' database!")
