#script to create DW

CREATE SCHEMA IF NOT EXISTS "queensrollingsales";

CREATE  TABLE "queensrollingsales".dim_businessclass ( 
	buildingclass_id     bigint  NOT NULL  ,
	CONSTRAINT pk_dim_property_type PRIMARY KEY ( buildingclass_id )
 );

CREATE  TABLE "queensrollingsales".dim_date ( 
	date_id              bigint  NOT NULL  ,
	dateisoformat        DATETIME    ,
	month_number         integer    ,
	month_name           varchar(25)    ,
	day_name             varchar(15)    ,
	day_number           integer    ,
	weekofmonth          integer    ,
	weekofyear           integer    ,
	CONSTRAINT pk_dim_date PRIMARY KEY ( date_id )
 );

CREATE  TABLE "queensrollingsales".dim_location ( 
	location_id          bigint  NOT NULL  ,
	address              varchar(75)    ,
	zip_code             integer    ,
	block                integer    ,
	lot                  integer    ,
	CONSTRAINT pk_dim_location PRIMARY KEY ( location_id )
 );

CREATE  TABLE "queensrollingsales".dim_neighborhoods ( 
	neighborhood_id      bigint  NOT NULL  ,
	neighborhood_name    varchar(30)    ,
	avg_price            numeric(2,2)    ,
	max_price            numeric(2,2)    ,
	min_price            numeric(2,2)    ,
	number_sales         integer    ,
	CONSTRAINT pk_fact_neighborhoods PRIMARY KEY ( neighborhood_id )
 );

CREATE  TABLE "queensrollingsales".dim_taxclass ( 
	taxclass_id          bigint  NOT NULL  ,
	CONSTRAINT pk_dim_taxclass PRIMARY KEY ( taxclass_id )
 );

CREATE  TABLE "queensrollingsales".facts_properties ( 
	fact_id              bigint  NOT NULL  ,
	property_id          integer  NOT NULL  ,
	sale_price           numeric(2,2)    ,
	total_units          integer    ,
	land_sq_feet         integer    ,
	gross_sq_feet        integer    ,
	residential_units    integer    ,
	commercial_units     integer    ,
	price_per_sqft       numeric(2,2)    ,
	mean_per_sqft        numeric(2,2)    ,
	square_differences_mean numeric(2,2)    ,
	variance_per_sqft    numeric(2,2)    ,
	year_built           integer    ,
	sale_date            date    ,
	year_sold            date    ,
	neighborhood_id      integer    ,
	location_id          integer    ,
	taxclass_id          bigint    ,
	businessclass_id     integer    ,
	CONSTRAINT pk_facts_properties PRIMARY KEY ( fact_id, property_id )
 );

CREATE UNIQUE INDEX unq_property_id ON "queensrollingsales".facts_properties ( property_id );

CREATE UNIQUE INDEX unq_neighborhood_id ON "queensrollingsales".facts_properties ( neighborhood_id );

CREATE UNIQUE INDEX unq_taxclass_id ON "queensrollingsales".facts_properties ( taxclass_id );

CREATE UNIQUE INDEX unq_businessclass_id ON "queensrollingsales".facts_properties ( businessclass_id );

CREATE UNIQUE INDEX unq_location_id ON "queensrollingsales".facts_properties ( location_id );

CREATE UNIQUE INDEX unq_sale_date ON "queensrollingsales".facts_properties ( sale_date );

CREATE UNIQUE INDEX unq_year_sold ON "queensrollingsales".facts_properties ( year_sold );
