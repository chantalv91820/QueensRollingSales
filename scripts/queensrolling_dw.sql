#Script to create DW 

CREATE SCHEMA INSTANCE;

CREATE TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_date ( 
	date_id BIGINT NOT NULL  ,
	sale_date DATE  ,
	month_number INT  
 );

ALTER TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_date ADD PRIMARY KEY ( date_id )  NOT ENFORCED;

CREATE TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_location ( 
	location_id BIGINT NOT NULL  ,
	address VARCHAR  ,
	zip_code INT  ,
	block INT  ,
	lot INT  
 );

ALTER TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_location ADD PRIMARY KEY ( location_id )  NOT ENFORCED;

CREATE TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_neighborhoods ( 
	neighborhood_id BIGINT NOT NULL  ,
	neighborhood_name VARCHAR(30)  ,
	avg_price DECIMAL(2,2)  ,
	max_price DECIMAL(2,2)  ,
	min_price DECIMAL(2,2)  ,
	number_of_sales INT  
 );

ALTER TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_neighborhoods ADD PRIMARY KEY ( neighborhood_id )  NOT ENFORCED;

CREATE TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_property_type ( 
	property_type_id BIGINT NOT NULL  ,
	building_class VARCHAR  ,
	tax_class VARCHAR  
 );

ALTER TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_property_type ADD PRIMARY KEY ( property_type_id )  NOT ENFORCED;

CREATE TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_year_built ( 
	year_id INT NOT NULL  ,
	year INT  
 );

ALTER TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_year_built ADD PRIMARY KEY ( year_id )  NOT ENFORCED;

CREATE TABLE QueensRollingSales_DW_LGL.INSTANCE.facts_properties ( 
	fact_id BIGINT NOT NULL  ,
	property_id INT NOT NULL  ,
	sale_price DECIMAL(2,2)  ,
	total_units INT  ,
	land_sq_feet INT  ,
	gross_sq_feet INT  ,
	residential_units INT  ,
	commercial_units INT  ,
	price_per_sqft DECIMAL(2,2)  ,
	mean_per_sqft DECIMAL(2,2)  ,
	square_differences_mean DECIMAL(2,2)  ,
	variance_per_sqft DECIMAL(2,2)  
 );

ALTER TABLE QueensRollingSales_DW_LGL.INSTANCE.facts_properties ADD PRIMARY KEY ( fact_id, property_id )  NOT ENFORCED;
