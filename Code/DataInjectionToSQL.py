import pandas as pd
import mysql.connector
from mysql.connector import Error

# Connection details
hostname = "6bnvj.h.filess.io"
database = "olistproject_slopelack"
port = "3307"
username = "olistproject_slopelack"
password = "697e5b0bf570cd87d28f4f9e093edba086909afe"

# CSV file path
csv_file_path = "olist_order_payments_dataset.csv"

# Table name where the data will be uploaded
table_name = "olist_order_payments"

try:
    # Step 1: Establish a connection to MySQL server
    connection = mysql.connector.connect(
        host=hostname,
        database=database,
        user=username,
        password=password,
        port=port
    )
    if connection.is_connected():
        print("Connected to MySQL Server successfully!")

        # Step 2: Create a cursor to execute SQL queries
        cursor = connection.cursor()
