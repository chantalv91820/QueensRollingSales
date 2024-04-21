#script to create DW

CREATE SCHEMA IF NOT EXISTS "instance";

CREATE  TABLE "instance".dim_buildingclass ( 
	buildingclassid      bigint  NOT NULL  ,
	buildingclassname    varchar(75)    ,
	CONSTRAINT pk_dim_property_type PRIMARY KEY ( buildingclassid )
 );

CREATE  TABLE "instance".dim_date ( 
	dateid               bigint  NOT NULL  ,
	dateisoformat        date    ,
	quarternumber        integer    ,
	monthnumber          integer    ,
	monthname            varchar(25)    ,
	dayname              varchar(15)    ,
	daynumber            integer    ,
	weekofmonth          integer    ,
	weekofyear           integer    ,
	CONSTRAINT pk_dim_date PRIMARY KEY ( dateid )
 );

CREATE  TABLE "instance".dim_location ( 
	locationid           bigint  NOT NULL  ,
	address              varchar(75)    ,
	zipcode              integer    ,
	block                integer    ,
	lot                  integer    ,
	CONSTRAINT pk_dim_location PRIMARY KEY ( locationid )
 );

CREATE  TABLE "instance".dim_neighborhoods ( 
	neighborhoodid       bigint  NOT NULL  ,
	neighborhoodname     varchar(30)    ,
	avgprice             numeric(2,2)    ,
	maxprice             numeric(2,2)    ,
	minprice             numeric(2,2)    ,
	numbersales          integer    ,
	CONSTRAINT pk_fact_neighborhoods PRIMARY KEY ( neighborhoodid )
 );

CREATE  TABLE "instance".dim_taxclass ( 
	taxclassid           bigint  NOT NULL  ,
	taxclassname         varchar(75)    ,
	CONSTRAINT pk_dim_taxclass PRIMARY KEY ( taxclassid )
 );

CREATE  TABLE "instance".facts_properties ( 
	factid               bigint  NOT NULL  ,
	propertyid           integer  NOT NULL  ,
	saleprice            numeric(2,2)    ,
	totalunits           integer    ,
	landsqfeet           integer    ,
	grosssqfeet          integer    ,
	residentialunits     integer    ,
	commercialunits      integer    ,
	pricepersqft         numeric(2,2)    ,
	meanpersqft          numeric(2,2)    ,
	squarediffmean       numeric(2,2)    ,
	variancepersqft      numeric(2,2)    ,
	yearbuilt            integer    ,
	saledate             date    ,
	yearsold             date    ,
	neighborhoodid       bigint    ,
	locationid           bigint    ,
	taxclassid           bigint    ,
	businessclassid      bigint    ,
	CONSTRAINT pk_facts_properties PRIMARY KEY ( factid, propertyid )
 );

CREATE UNIQUE INDEX unq_property_id ON "instance".facts_properties ( propertyid );

CREATE UNIQUE INDEX unq_neighborhood_id ON "instance".facts_properties ( neighborhoodid );

CREATE UNIQUE INDEX unq_taxclass_id ON "instance".facts_properties ( taxclassid );

CREATE UNIQUE INDEX unq_location_id ON "instance".facts_properties ( locationid );

CREATE UNIQUE INDEX unq_sale_date ON "instance".facts_properties ( saledate );

CREATE UNIQUE INDEX unq_year_sold ON "instance".facts_properties ( yearsold );

CREATE UNIQUE INDEX unq_businessclassid ON "instance".facts_properties ( businessclassid );
