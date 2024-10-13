
# Olist Azure ETL

This is a past project aimed at how Olist (an eCommerce platform in Brazil) can enhance financial access/banking services for small & medium business sellers transacting on their platform.

The pipeline extracts data via API, transform using Python and then loading it into SQL database. It is all fully deployed on Microsoft Azure. So as to simulate working with large datasets on the cloud instead of a local machine, as it is not ideal or scalable.



## Background

Based on research, a recent article released by PYMNTS [1], states that small and medium sized businesses in Brazil are struggling to find access to financial services, which severely hinders their growth. 

And with the rise of e-commerce platforms, such as Olist, most transactions are still happening offline, showing a disconnect between sellers & banks. Hence, the purpose of this project helps to identify key areas which Olist can focus on for their sellers, and how to better advice Olist on how to improve their service and value to them.
## Tech Stack

**Jupyter Notebooks:** 

- Used for intial data exploration, cleaning & transformation testing via Python.

**Python (Visual Studio Code):**

- Inital testing for loading local datasets onto Azure Data Lake Gen 2 Storage (ADLS). 

**SQL (SSMS):**

- SQL server management studio was used to initialise the tables for Azure SQL Database, check for data integrity and also establishing foreign key constraints.

**Microsoft Power BI:**

- Used to perform data analysis and provide insights on which sellers to target and how Olist can better their in-house banking products/services.

**Microsoft Azure:**

- Azure Data Lake Gen 2 (Storage)
- Azure Data Factory (Orchestrator)
- Azure Databricks (transform)
- Azure Data Flow (load into SQL DB)
- Azure SQL Database/server
- Azure Synapse Analytics (BI on cloud)

## Data Architecture Diagram

![DAD-OLIST](https://raw.githubusercontent.com/splatpugs/olist-etl/refs/heads/main/Diagrams/Olist_DataArchitectureDiagram.png)

The entire process is automated on Azure via Azure Data Factory (ADF)’s trigger automation. Data is ingested from Kaggle API, cleaned & transformed using Azure Databricks & loaded into Azure SQL Database. The datasets are further analysed using SQL or Power BI for visualisations.
## Findings

#### Payment Methods

More can be found within the [documentation]()


## Reflections

#### What's The Challenges Of This Project?

X

#### How Much Time/Money Was Spent On This Project?

Y

#### Are There Future Plans For The Project?

Yes! Z


## References

- [1] Pymnts, “Brazil’s Olist Expands Banking Services for Retailer Clients,” PYMNTS.com, May 29, 2024. https://www.pymnts.com/news/banking/2024/brazils-olist-expands-banking-services-for-retailer-clients/


## Other Simlar Projects

⚡️ [Local ETL Pipeline - Netflix Data](https://github.com/splatpugs/jde-interim)
