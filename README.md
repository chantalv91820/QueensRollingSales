# Queens Rolling Sales
Analyze property sales in Queens, NYC for 2022

## Description
This project analyzes property sales in Queens by neighborhood and property type. This includes Queens neighborhoods such as Bayside, Astoria, Long Island City, etc. and property types suchas single family homes, condominiums, office buildings, etc. We will analyze this data to determine what neighborhoods are rising in popularity for commerical purposes and residential purposes, and their prices.

## Getting Started

### Dependencies 
* Postgres data warehouse to load raw data into warehouse

### How project was created:
* Postgres Data Warehouse Used
* ETL code written in Python
* Visualizations created in Tableau

### How to install:
1. Clone this project
2. Open ExtractQueens.ipynb and run code to import data into data warehouse
3. Open ETLQueens.ipynb and run code to clean, transform, and load data into data warehouse
4. Open QueensRolling_dw.sql to create data warehouse schema
5. Open Tableau link to view sample visualizations

## Tableau Analysis:
* KPI's
    * Includes minimum, maximum, and average price per neighborhood and property type
* Total Properties Sold
    * Represents most sold property types per neighborhood and their percent of the whole
* Average Property Price per Month
    * Represents the average price of property types in each neighborhood per month
* Price per Square Feet
    * Represents the price per square foot in each neighborhood and it's changes each month
* Highest to Lowest Sales
    * Represents the neighborhoods in Queens with the highest sales during the year
  
  Tableau Link: https://public.tableau.com/app/profile/chantal.villacres/viz/QueensRedo/FinalDashboard?publish=yes
  
## Help
### Common problems or issues:
* Outlier properties included in dataset affecting "Minimum Price" seen in KPI's

## Thank you!
