# Data Warehousing - Converting 3NF Schema to Star Schema
Project Name: Data Warehousing - Converting 3NF Schema to Star Schema

Description:

This project demonstrates the transformation of a normalized 3NF (Third Normal Form) database schema into a Star Schema for data warehousing purposes. The 3NF schema, which was initially designed for online transaction processing (OLTP), has been converted into a Star Schema suitable for online analytical processing (OLAP). The Star Schema is structured with fact and dimension tables for efficient data analysis and reporting.

Table Structure:

The Star Schema includes the following tables:

dimCustomer: Dimension table containing customer-related information.
dimMovie: Dimension table storing details about movies in the inventory.
dimStore: Dimension table with store-specific information.
dimDate: Dimension table for date-related information, enabling time-based analysis.
factSales: Fact table capturing sales transactions, including references to dimension keys and sales amounts.
Conversion Process:

The project involved the following conversion steps:

dimDate Creation: The "dimDate" dimension table was created by extracting date-related information from the payment table. It provides essential date attributes like year, quarter, month, day, and week, along with a flag indicating whether it's a weekend.

dimCustomer Creation: The "dimCustomer" dimension table was populated by joining customer, address, city, and country tables to gather customer-related information. It includes details such as first name, last name, email, address, and more.

dimStore Creation: The "dimStore" dimension table was populated by joining store, staff, address, city, and country tables to gather store-specific data. It contains information about the store's address, manager, and more.

dimMovie Creation: The "dimMovie" dimension table was created by extracting movie-related data from the film and language tables. It includes information about the movie's title, description, language, and more.

factSales Creation: The "factSales" fact table was created by joining payment, rental, and inventory tables to capture sales transactions. It includes references to dimension keys and sales amounts.

How to Use:

Ensure you have a PostgreSQL database environment ready, such as pgAdmin 4.
Run the provided SQL scripts in your database environment to create the necessary dimension and fact tables.
Execute the SQL statements for populating dimension tables, including "dimDate," "dimCustomer," "dimStore," and "dimMovie."
Populate the "factSales" table with data by executing the SQL statement for sales transactions.
Once the Star Schema is set up, you can use it for OLAP and data analysis, including generating reports and insights from the transformed data.
Contributors:

[Mihir Patel]
