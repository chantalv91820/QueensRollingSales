#Script to create DW 

CREATE SCHEMA INSTANCE;

CREATE TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_borough ( 
	borough_id int64 NOT NULL  ,
	borough_name int64  
 );

ALTER TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_borough ADD PRIMARY KEY ( borough_id )  NOT ENFORCED;

CREATE TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_date ( 
	date_id int64 NOT NULL  ,
	dateIsoformat datetime  ,
	month_number int64  ,
	month_name string  ,
	day_name string  ,
	day_number int64  ,
	weekofMonth int64  ,
	weekofYear int64  
 );

ALTER TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_date ADD PRIMARY KEY ( date_id )  NOT ENFORCED;

CREATE TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_location ( 
	location_id int64 NOT NULL  ,
	address string  ,
	zip_code int64  ,
	block int64  ,
	lot int64  
 );

ALTER TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_location ADD PRIMARY KEY ( location_id )  NOT ENFORCED;

CREATE TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_neighborhoods ( 
	neighborhood_id int64 NOT NULL  ,
	neighborhood_name string  ,
	avg_price numeric  ,
	max_price numeric  ,
	min_price numeric  ,
	number_sales int64  
 );

ALTER TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_neighborhoods ADD PRIMARY KEY ( neighborhood_id )  NOT ENFORCED;

CREATE TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_property_type ( 
	property_type_id int64 NOT NULL  ,
	building_class string  ,
	tax_class string  
 );

ALTER TABLE QueensRollingSales_DW_LGL.INSTANCE.dim_property_type ADD PRIMARY KEY ( property_type_id )  NOT ENFORCED;

CREATE TABLE QueensRollingSales_DW_LGL.INSTANCE.facts_properties ( 
	fact_id int64 NOT NULL  ,
	property_id int64 NOT NULL  ,
	sale_price numeric  ,
	total_units int64  ,
	land_sq_feet int64  ,
	gross_sq_feet int64  ,
	residential_units int64  ,
	commercial_units int64  ,
	price_per_sqft numeric  ,
	mean_per_sqft numeric  ,
	square_differences_mean numeric  ,
	variance_per_sqft numeric  ,
	year_built int64  ,
	neighborhood_id int64  ,
	property_type_id int64  ,
	borough_id int64  ,
	sale_date date  ,
	year_sold date  ,
	location_id int64  
 );

ALTER TABLE QueensRollingSales_DW_LGL.INSTANCE.facts_properties ADD PRIMARY KEY ( fact_id, property_id )  NOT ENFORCED;

