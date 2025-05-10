Designed and implemented an end-to-end Business Intelligence (BI) solution based on a simulated crime dataset (50,000+ records). This project involved building a robust ETL pipeline and data warehouse using the Microsoft BI stack.

🔹 Built a Star Schema data warehouse with dimension and fact tables to support analytical reporting

🔹 Developed ETL workflows in SSIS to extract, cleanse, transform, and load data from multiple sources (CSV & SQL)

🔹 Handled Slowly Changing Dimensions (SCD Type 2) to preserve historical changes (e.g., status updates)

🔹 Used Lookups for surrogate key resolution across dimension tables

🔹 Created and deployed a cube using SQL Server Analysis Services (SSAS) with hierarchies and measures

🔹 Connected the cube to Excel and Power BI to design OLAP reports and dashboards

  ▪ Demonstrated Slice, Dice, Drill-Down, Roll-Up, and Pivot operations
  
🔹 Extended the fact table for accumulating snapshot metrics using derived fields (e.g., transaction processing time)

🔹 Published and demonstrated interactive Power BI dashboards with,
matrix tables - Report 1, 
multiple slicers - Report 2,  
drill-down - Report 3, 
drill-through reports - Report 4

Tools: SSIS, SSAS, Power BI, SQL Server, Excel, Data Warehousing, OLAP, ETL

**Brief Description of My Data Generation Scripts**

*CrimeData Generator:*

Using Python and pandas, I generated a realistic crime dataset with fields like DateOfOccurrence, TimeOfOccurrence, AreaCode, CrimeCode, PremiseCode, WeaponCode, etc. The script ensured relationships with lookup tables, unique CrimeIDs, and timestamped rows to simulate real-world crime incidents for 50,000 records.

*crimefact_update:*

A second Python script was used to generate a supplementary dataset containing:

 CrimeID  accm_txn_complete_time
 
 1    2025-04-30 10:00
 
 2    2025-04-30 13:45
 
This CSV was used to simulate the “transaction complete time” for accumulating snapshot facts. I then updated the CrimeFact table using an SSIS package, calculating txn_process_time_hours as the difference between the completion time and create time.
