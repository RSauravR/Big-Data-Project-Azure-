# End-to-End Azure Data Pipeline with Medallion Layers

A modern, production-scale data engineering pipeline using the Medallion Architecture (**Bronze, Silver, Gold**) on Azure. This project demonstrates secure, scalable ingestion, transformation, and enrichment from diverse sources, preparing robust analytics-ready data for BI, reporting, and machine learning.

## Features

- **Multi-Source Ingestion**
  - Load CSV data into SQL DB and MongoDB (filess.io) with Python & pandas.
  - Store REST/HTTP datasets in a GitHub repo for remote ingestion.
- **Orchestrated Data Movement**
  - Use Azure Data Factory to automate extraction and load from all sources to the Bronze layer in Azure Data Lake Storage Gen2 (ADLS Gen2).
- **Medallion Layer Processing**
  - **Bronze Layer:** Store raw ingested files with clear provenance.
  - **Silver Layer:** Clean, validate, join, and enrich data using Azure Databricks (PySpark, Databricks SQL); includes enrichment from MongoDB tables.
  - **Gold Layer:** Final business-ready datasets modeled and maintained via Azure Synapse Analytics external tables.
- **Security & Scalability**
  - Secure access using Azure IAM roles, keys, and secrets.
  - Scale up/out via Databricks compute clusters.
- **Analytics & BI Ready**
  - Gold layer data accessible to analysts, scientists, and visualization tools (Power BI, Tableau, Fabric).

## Usage

1. **Prepare Source Data:**
    - Load CSVs into SQL DB and MongoDB (Python scripts provided).
    - Place REST datasets in the project GitHub repo.
2. **Ingest Data:**
    - Trigger Azure Data Factory pipelines to land all data in ADLS Gen2 (Bronze).
3. **Transform & Enrich:**
    - Use Databricks notebooks (PySpark + SQL) to process, clean, and enrich data into the Silver layer (Parquet format).
    - Integrate MongoDB enrichment tables as needed.
4. **Model Business Data:**
    - Use Synapse SQL scripts to further cleanse and build Gold layer external tables.
5. **Analyze & Visualize:**
    - Connect BI tools (Power BI, Tableau) to Gold layer for reporting and analytics.

## Technology Stack

- Python, pandas
- Azure Data Factory
- Azure Data Lake Storage Gen2 (Bronze / Silver / Gold)
- Azure Databricks (PySpark, SQL)
- MongoDB (enrichment)
- Azure Synapse Analytics
- Power BI / Tableau / Microsoft Fabric



