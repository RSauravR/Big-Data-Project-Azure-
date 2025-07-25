-- To check are we able to access the data in the Silver layer data as OPENROWSET
SELECT 
    *
FROM
    OPENROWSET(
        BULK 'https://olistdatastorageaccounts.dfs.core.windows.net/olistdata/silver/',
        FORMAT = 'PARQUET'
    ) AS result1


-- Create View for Gold Layer
CREATE VIEW gold.final2
AS
SELECT 
    *
FROM
    OPENROWSET(
        BULK 'https://<storage_account_name>.dfs.core.windows.net/olistdata/silver/',
        FORMAT = 'PARQUET'
    ) AS result2
WHERE order_status = 'delivered'

SELECT * FROM  gold.final2


-- SQL to Gold Layer
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '<YourStrongPasswordHere>';

CREATE DATABASE SCOPED CREDENTIAL sauravradmin WITH IDENTITY = 'Managed Identity';

CREATE EXTERNAL FILE FORMAT extfileformat WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

CREATE EXTERNAL DATA SOURCE goldlayer WITH (
    LOCATION = 'https://<storage_account_name>.dfs.core.windows.net/olistdata/gold/',
    CREDENTIAL = sauravradmin
);

CREATE EXTERNAL TABLE gold.lasttable WITH (
        LOCATION = 'lastserving',
        DATA_SOURCE = goldlayer,
        FILE_FORMAT = extfileformat
) AS
SELECT * FROM gold.final2;