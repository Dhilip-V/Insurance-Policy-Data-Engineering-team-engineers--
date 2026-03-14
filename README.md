# Insurance-Policy-Data-Engineering-team-engineers--
MySQL Data Cleaning and Analysis Project.


Built a centralized data warehouse by combining customer, policy, and transaction data from different regions.
Created a data pipeline to load, clean, and standardize the data, and calculate late fees and policy installments.
Organized the data into fact and dimension tables for easy storage and querying.
Used SQL queries and dashboards to find insights like policy changes and region-wise policy amounts.


# MySQL Data Cleaning and Analysis Project

## Project Overview

This project demonstrates how to clean and analyze raw CSV datasets using MySQL.

Datasets used:

* Customer
* Policy
* Address
* Transactions

## Tools Used

* MySQL
* Excel
* GitHub

## Steps Performed

### 1. Data Import

Raw CSV files were imported into MySQL tables using `LOAD DATA INFILE`.

### 2. Data Cleaning

The following cleaning operations were performed:

* Removed duplicate records
* Handled NULL values
* Standardized date formats
* Fixed inconsistent text values

### 3. Data Analysis

Joined multiple tables to generate insights such as:

* Total policy amount by region
* Customer policy distribution
* Transaction summaries

## SQL Files

* `create_tables.sql` – table creation
* `import_data.sql` – CSV import
* `data_cleaning.sql` – cleaning queries
* `analysis_queries.sql` – analysis queries

## Author

Dhilip Kumar
