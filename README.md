# Queens Rolling Sales
Analyze property sales in Queens, NYC during 2022

## Description

New York's 5 boroughs include Manhattan, Queens, Brooklyn, Bronx, and Staten Island. With NYC growing in popularity and population size every year we know neighborhoods and prices must change along with this.

Villacres Consulting has been hired by the the City of New York to analyze property sales in Queens by neighborhood and property type. This includes Queens neighborhoods such as Bayside, Astoria, Long Island City, etc. and property types such as single family homes, condominiums, office buildings, etc. We will analyze this data to determine what neighborhoods are rising in popularity for commerical purposes and residential purposes. We will also analyze neighborhood and property prices to determine which neighborhoods provide the most bang for their buck.

As of now the project scope includes only Queens, NY, but the code can be configured for future use to include all 5 NYC boroughs. 

## Getting Started

### Dependencies 
* Postgres data warehouse to load raw data into warehouse

### How project was created:
* Postgres Data Warehouse Used
* ETL code written in Python
* Visualizations created in Tableau

### How to install:
1. Clone this project
2. Open ExtractQueens.ipynb and run code to import raw data into data warehouse
3. Open ETLQueens.ipynb and run code to clean, transform, and load cleaned data and tables into data warehouse
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
     * Fixed when changing property type

## Results
From Villacres Consulting's analysis, we have concluded that Queens most popular neighborhood's for residential properties are Flushing, Bayside, Richmond Hill, and Astoria. Properties in NYC range from an average of $1.3 million with the highest properties sold being single family homes, double family homes, and walk up apartment buildings. As of now Queens remains mostly a residential neighborhood, but neighborhoods like Long Island City increasing in office buildings this can soon change. Queens can soon become the next buzzing borough.
