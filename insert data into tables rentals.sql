INSERT INTO dimDate(
date_key, date, year, quarter, month, day, week, is_weekend)
SELECT
DISTINCT (TO_CHAR(payment_date :: DATE, 'yyyyMMDD'):: integer) as date_key,
date(payment_date) as date,
EXTRACT(year from payment_date) as year,
EXTRACT(quarter from payment_date) as quarter,
EXTRACT(month from payment_date) as month,
EXTRACT(day from payment_date) as day,
EXTRACT(week from payment_date) as week,
CASE WHEN EXTRACT (ISODOW FROM payment_date) IN (6,7) THEN true ELSE false END AS is_weekend

FROM payment;

INSERT INTO dimCustomer(
customer_key, customer_id, first_name, last_name, email, address, address2, district
,city, country, postal_code, phone, active, create_date, start_date, end_date)
SELECT
c.customer_id as customer_key,
c.customer_id,
c.first_name,
c.last_name,
c.email,
a.address,
a.address2,
a.district,
ci.city,
co.country,
postal_code,
a.phone,
c.active,
c.create_date,
now() AS start_date,
now () AS end_date
FROM customer as c
INNER JOIN address as a ON (c.address_id = a.address_id)
INNER JOIN city as ci ON (a.city_id = ci.city_id)
INNER JOIN country as co ON (ci.country_id = co.country_id);


INSERT INTO dimStore (store_key, store_id, address, address2, district, city, country, postal_code, manager_first_name, manager_last_name, start_date, end_date)
SELECT
    s.store_id as store_key,
    s.store_id,
    a.address,
    a.address2,
    a.district,
    c.city,
    co.country,
    a.postal_code,
    st.first_name as manager_first_name,
    st.last_name  as manager_last_name,
    now() as start_date,
    now() as end_date
FROM store as s
INNER JOIN staff as st     ON    (s.manager_staff_id = st.staff_id)
INNER JOIN address as a    ON    (s.address_id = a.address_id)
INNER JOIN city as c       ON    (a.city_id = c.city_id)
INNER JOIN country as co   ON    (c.country_id = co.country_id);

INSERT INTO dimMovie(
movie_key, film_id, title, description, release_year
,language, original_language, rental_duration, length, rating, special_features)
SELECT
f.film_id as movie_key,
f.film_id,
f.title,
f.description, 
f.release_year,
l.name as langauge_name,
orig_lang.name as original_language,
f.rental_duration,
f.length,
f.rating,
f.special_features
FROM film as f
INNER JOIN language as l ON (f.language_id = l.language_id)
LEFT JOIN language as orig_lang ON (f.language_id = orig_lang.language_id)
;

INSERT INTO factSales (date_key, customer_key, movie_key, store_key, sales_amount)
SELECT
TO_CHAR(payment_date :: DATE, 'yyyyMMDD'):: integer as date_key,
p.customer_id as customer_key,
i.film_id as movie_key,
i.store_id as store_key,
p.amount as sales_amount
FROM payment p
INNER JOIN rental as r ON (p.rental_id = r.rental_id)
INNER JOIN inventory as i ON (r.inventory_id = i.inventory_id);
