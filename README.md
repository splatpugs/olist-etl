
# Olist Azure ETL

This is a past project aimed at how Olist (an eCommerce platform in Brazil) can enhance financial access/banking services for small & medium business sellers transacting on their platform.

The pipeline extracts data via API, transforms it using Python, and then loads it into an SQL database. It is all fully deployed on Microsoft Azure to simulate working with large datasets on the cloud instead of a local machine, which is not ideal or scalable.



## Background

Based on research, a recent article released by PYMNTS [1] states that small and medium-sized businesses in Brazil are struggling to find access to financial services, which severely hinders their growth. 

With the rise of e-commerce platforms, such as Olist, most transactions are still happening offline, showing a disconnect between sellers & banks. Hence, this project aims to identify key areas which Olists can focus on for their sellers and how to better advise Olists on how to improve their service and value to them.
## Tech Stack

**Jupyter Notebooks:** 

- Used for initial data exploration, cleaning & transformation testing via Python.

**Python (Visual Studio Code):**

- Initial testing for loading local datasets onto Azure Data Lake Gen 2 Storage (ADLS). 

**SQL (SSMS):**

- SQL Server Management Studio was used to initialise the tables for Azure SQL Database, check for data integrity, and establish foreign key constraints.

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


## Findings

#### Payment Methods

![PM-IMG](https://raw.githubusercontent.com/splatpugs/olist-etl/refs/heads/main/Diagrams/paymentmethods.jpg)

Credit card payments dominated, reaching a total value of $12M in Brazil's currency. Boleto usage also emerged, reaching $2.9M from 2016 to 2018. Boleto is a popular payment method in Brazil, especially for customers without credit cards or uncomfortable using them online. It works like a cash voucher with a barcode. However, it is not a very practical approach in today’s context in terms of settling post-transaction issues, such as payment disputes, refunds, or, worst, delays for the sellers to collect their funds.

The map visualisation also provides an overview of seller locations by payment methods, allowing Olist to identify areas for optimizing infrastructure and enhancing in-house banking services, such as:

- To optimise their infrastructure geographically, such as setting up physical cash deposit offices.
- Introduce a new in-house banking service, such as cash deposit machines, so sellers or customers can deposit or retrieve funds.
- Funds will be shown on the Olist platform as part of the new e-payment product: Olist e-wallet. 

Within the scope of the data analysis on Olist, more can be found within the [documentation](https://github.com/splatpugs/olist-etl/blob/main/Olist_Documentation.pdf)


## Reflections

#### What's The Challenges Of This Project?

The project's timeline is two weeks as part of a learning process. Learning and linking Azure resources and services together was pretty straightforward, as it is a rinse-and-repeat process. However, the real challenge is trying to get the tool to work the way you want. 

One such example would be trying to use ADF's copy data to ingest data from the Kaggle API. Initially, it couldn't read the file (it was corrupted), and then it couldn't display the exact .csv file names and lots of time was spent on the project. In total, about >70 hours are spent learning and debugging the pipeline on Azure to ensure everything works the way we want.

#### How Much Time/Money Was Spent On This Project?

Over 80 hours, from drafting to finalising the documentation, transformation codes, ERD and BI visualisations. About a total of $70~$75 USD was spent on Azure services.

#### Are There Future Plans For The Project?

Yes! Definitely one of the goals/ideas I have moving forward is shifting the project to a local machine. The dataset is actually not large enough to be deployed on the cloud after proper data transformation. Hence, a local orchestrator will make sense in terms of minimising the cost of debugging and deploying on the cloud. 


## References

- [1] Pymnts, “Brazil’s Olist Expands Banking Services for Retailer Clients,” PYMNTS.com, May 29, 2024. https://www.pymnts.com/news/banking/2024/brazils-olist-expands-banking-services-for-retailer-clients/


## Other Similar Projects

⚡️ [Local ETL Pipeline - Netflix Data](https://github.com/splatpugs/jde-interim)
