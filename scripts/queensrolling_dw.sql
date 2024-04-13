CREATE SCHEMA IF NOT EXISTS "instance";

CREATE  TABLE "instance".dim_date ( 
	date_id              BIGINT  NOT NULL  ,
	sale_date            DATE    ,
	month_number         INT    ,
	CONSTRAINT pk_dim_date PRIMARY KEY ( date_id )
 );

CREATE  TABLE "instance".dim_location ( 
	location_id          BIGINT  NOT NULL  ,
	address              VARCHAR    ,
	zip_code             INT    ,
	block                INT    ,
	lot                  INT    ,
	CONSTRAINT pk_dim_location PRIMARY KEY ( location_id )
 );

CREATE UNIQUE INDEX unq_address ON "instance".dim_location ( address );

CREATE  TABLE "instance".dim_neighborhoods ( 
	neighborhood_id      BIGINT  NOT NULL  ,
	neighborhood_name    VARCHAR(30)    ,
	avg_price            DECIMAL(2,2)    ,
	max_price            DECIMAL(2,2)    ,
	min_price            DECIMAL(2,2)    ,
	number_of_sales      INT    ,
	CONSTRAINT pk_fact_neighborhoods PRIMARY KEY ( neighborhood_id )
 );

CREATE  TABLE "instance".dim_property_type ( 
	property_type_id     BIGINT  NOT NULL  ,
	building_class       VARCHAR    ,
	tax_class            VARCHAR    ,
	CONSTRAINT pk_dim_property_type PRIMARY KEY ( property_type_id )
 );

CREATE  TABLE "instance".dim_year_built ( 
	year_id              INT  NOT NULL  ,
	"year"               INT    ,
	CONSTRAINT pk_dim_year_built PRIMARY KEY ( year_id )
 );

CREATE  TABLE "instance".facts_properties ( 
	fact_id              BIGINT  NOT NULL  ,
	property_id          INT  NOT NULL  ,
	sale_price           DECIMAL(2,2)    ,
	total_units          INT    ,
	land_sq_feet         INT    ,
	gross_sq_feet        INT    ,
	residential_units    INT    ,
	commercial_units     INT    ,
	price_per_sqft       DECIMAL(2,2)    ,
	mean_per_sqft        DECIMAL(2,2)    ,
	square_differences_mean DECIMAL(2,2)    ,
	variance_per_sqft    DECIMAL(2,2)    ,
	CONSTRAINT pk_facts_properties PRIMARY KEY ( fact_id, property_id )
 );
