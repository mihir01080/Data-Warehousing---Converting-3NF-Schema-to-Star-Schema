CREATE table dimCustomer
(
customer_key serial NOT NULL PRIMARY KEY,
customer_id smallint NOT NULL,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
email VARCHAR(50) ,
address VARCHAR(50) NOT NULL,
address2 VARCHAR(50),
district VARCHAR(20) NOT NULL,
city VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
postal_code VARCHAR(10),
phone VARCHAR(20) NOT NULL,
active smallint NOT NULL,
create_date timestamp NOT NULL,
start_date date NOT NULL,
end_date date NOT NULL
);

CREATE table dimMovie
(
movie_key SERIAL PRIMARY KEY,
film_id smallint NOT NULL,
title VARCHAR(255) NOT NULL,
description text,
release_year year,
language VARCHAR(20) NOT NULL,
original_language VARCHAR(20),
rental_duration smallint NOT NULL,
length smallint NOT NULL,
rating VARCHAR(5) NOT NULL,
special_features VARCHAR(60) NOT NULL
);

CREATE TABLE dimStore
(
store_key SERIAL PRIMARY KEY,
store_id smallint NOT NULL,
address VARCHAR(50) NOT NULL,
address2 VARCHAR(50),
district VARCHAR(20) NOT NULL,
city VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
postal_code VARCHAR(10),
manager_first_name VARCHAR(45) NOT NULL,
manager_last_name VARCHAR(45) NOT NULL,
start_date date NOT NULL,
end_date date NOT NULL
);

CREATE table dimDate
(
date_key integer NOT NULL PRIMARY KEY,
date date NOT NULL,
year smallint NOT NULL,
quarter smallint NOT NULL,
month smallint NOT NULL,
day smallint NOT NULL,
week smallint NOT NULL,
is_weekend boolean
);

CREATE table factSales
(
sales_key serial PRIMARY KEY,
date_key integer REFERENCES dimDate(date_key),
customer_key integer REFERENCES dimCustomer(customer_key),
movie_key integer REFERENCES dimMovie (movie_key),
store_key integer REFERENCES dimStore (store_key),
sales_amount numeric
);

