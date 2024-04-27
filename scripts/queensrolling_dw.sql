#script to create DW

CREATE SCHEMA IF NOT EXISTS "queensrollingsales";

CREATE  TABLE "queensrollingsales".dim_borough ( 
	boroughid            bigint  NOT NULL  ,
	boroughname          varchar(25)    ,
	CONSTRAINT pk_dim_borough PRIMARY KEY ( boroughid )
 );

CREATE  TABLE "queensrollingsales".dim_buildclasscategory ( 
	buildclasscatid      bigint  NOT NULL  ,
	buildclasscatname    varchar(100)    ,
	CONSTRAINT pk_dim_buildclasscategory PRIMARY KEY ( buildclasscatid )
 );

CREATE  TABLE "queensrollingsales".dim_buildingclass ( 
	buildclassid         bigint  NOT NULL  ,
	buildtype            varchar(1)    ,
	buildtypedescription varchar(25)    ,
	buildclassdescription varchar(50)    ,
	CONSTRAINT pk_dim_property_type PRIMARY KEY ( buildclassid )
 );

CREATE  TABLE "queensrollingsales".dim_date ( 
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

CREATE  TABLE "queensrollingsales".dim_location ( 
	locationid           bigint  NOT NULL  ,
	address              varchar(75)    ,
	zipcode              integer    ,
	block                integer    ,
	lot                  integer    ,
	apartmentnumber      varchar(25)    ,
	CONSTRAINT pk_dim_location PRIMARY KEY ( locationid )
 );

CREATE  TABLE "queensrollingsales".dim_neighborhoods ( 
	neighborhoodid       bigint  NOT NULL  ,
	neighborhoodname     varchar(30)    ,
	buildclasscatid      integer    ,
	buildingclasscatname varchar    ,
	avgprice             numeric(2,2)    ,
	maxprice             numeric(2,2)    ,
	minprice             numeric(2,2)    ,
	numbersales          integer    ,
	CONSTRAINT pk_fact_neighborhoods PRIMARY KEY ( neighborhoodid )
 );

CREATE  TABLE "queensrollingsales".dim_taxclass ( 
	taxclassid           bigint  NOT NULL  ,
	taxclassname         varchar(75)    ,
	CONSTRAINT pk_dim_taxclass PRIMARY KEY ( taxclassid )
 );

CREATE  TABLE "queensrollingsales".facts_properties ( 
	factid               bigint  NOT NULL  ,
	propertyid           integer  NOT NULL  ,
	boroughid            integer    ,
	neighborhoodid       integer    ,
	locationid           integer    ,
	buildclasscatid      integer    ,
	taxclassid           bigint    ,
	buildclassid         bigint    ,
	totalunits           integer    ,
	landsqfeet           integer    ,
	grosssqfeet          integer    ,
	yearbuilt            integer    ,
	saleprice            numeric(2,2)    ,
	saledateid           integer    ,
	yearsoldid           integer    ,
	pricepersqft         numeric(2,2)    ,
	meanpersqft          numeric(2,2)    ,
	squarediffmean       numeric(2,2)    ,
	variancepersqft      numeric(2,2)    ,
	CONSTRAINT pk_facts_properties PRIMARY KEY ( factid, propertyid )
 );

CREATE UNIQUE INDEX unq_property_id ON "queensrollingsales".facts_properties ( propertyid );

CREATE UNIQUE INDEX unq_sale_date ON "queensrollingsales".facts_properties ( saledateid );

CREATE UNIQUE INDEX unq_year_sold ON "queensrollingsales".facts_properties ( yearsoldid );

