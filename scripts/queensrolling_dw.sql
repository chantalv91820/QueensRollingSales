#script to create DW

CREATE SCHEMA IF NOT EXISTS "queensrollingsales";

CREATE  TABLE "queensrollingsales".dim_borough (
                                                   borough_id           integer  NOT NULL  ,
                                                   borough_name         integer    ,
                                                   CONSTRAINT pk_dim_year_built PRIMARY KEY ( borough_id )
);

CREATE  TABLE "queensrollingsales".dim_date (
                                                date_id              bigint  NOT NULL  ,
                                                dateisoformat        DATE    ,
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
                                                         avg_price            decimal(2,2)    ,
                                                         max_price            decimal(2,2)    ,
                                                         min_price            decimal(2,2)    ,
                                                         number_sales         integer    ,
                                                         CONSTRAINT pk_fact_neighborhoods PRIMARY KEY ( neighborhood_id )
);

CREATE  TABLE "queensrollingsales".dim_property_type (
                                                         property_type_id     bigint  NOT NULL  ,
                                                         building_class       varchar(2)    ,
                                                         tax_class            varchar(2)    ,
                                                         CONSTRAINT pk_dim_property_type PRIMARY KEY ( property_type_id )
);

CREATE  TABLE "queensrollingsales".facts_properties (
                                                        fact_id              bigint  NOT NULL  ,
                                                        property_id          integer  NOT NULL  ,
                                                        sale_price           integer    ,
                                                        total_units          integer    ,
                                                        land_sq_feet         integer    ,
                                                        gross_sq_feet        integer    ,
                                                        residential_units    integer    ,
                                                        commercial_units     integer    ,
                                                        price_per_sqft       decimal(2,2)    ,
                                                        mean_per_sqft        decimal(2,2)    ,
                                                        square_differences_mean decimal(2,2)    ,
                                                        variance_per_sqft    decimal(2,2)    ,
                                                        year_built           integer    ,
                                                        neighborhood_id      integer    ,
                                                        property_type_id     integer    ,
                                                        borough_id           integer    ,
                                                        sale_date            date    ,
                                                        year_sold            date    ,
                                                        location_id          integer    ,
                                                        CONSTRAINT pk_facts_properties PRIMARY KEY ( fact_id, property_id )
);

CREATE UNIQUE INDEX unq_property_id ON "queensrollingsales".facts_properties ( property_id );

CREATE UNIQUE INDEX unq_property_type_id ON "queensrollingsales".facts_properties ( property_type_id );

CREATE UNIQUE INDEX unq_neighborhood_id ON "queensrollingsales".facts_properties ( neighborhood_id );

CREATE UNIQUE INDEX unq_borough_id ON "queensrollingsales".facts_properties ( borough_id );
