-- which film is providing the highest revenue
select f.title, sum(p.amount) as revenue from payment as p
inner join rental as r on p.rental_id = r.rental_id
inner join inventory as i on r.inventory_id = i.inventory_id 
inner join film as f on i.film_id = f.film_id
group by f.title
order by sum(p.amount) DESC;

-- which city is providing the highest revenue
select c.city, sum(p.amount) as revenue from payment as p
inner join rental as r on p.rental_id = r.rental_id
inner join inventory as i on r.inventory_id = i.inventory_id 
inner join film as f on i.film_id = f.film_id
inner join staff as s on p.staff_id = s.staff_id
inner join address as a on s.address_id = a.address_id
inner join city as c on a.city_id = c.city_id
group by c.city
order by sum(p.amount) DESC;

-- 3nf query
select f.title, EXTRACT(month FROM p.payment_date) as month,ci.city, sum(p.amount) as revenue 
from payment as p
inner join rental as r on p.rental_id = r.rental_id
inner join inventory as i on r.inventory_id = i.inventory_id 
inner join film as f on i.film_id = f.film_id
inner join customer as c on p.customer_id = c.customer_id
inner join address as a on c.address_id = a.address_id
inner join city as ci on a.city_id = ci.city_id
group by f.title, month,ci.city
order by f.title, month, ci.city, revenue DESC;

-- test query on new star schema
SELECT dimMovie.title, dimDate.month, dimCustomer.city, sum(sales_amount) as revenue
FROM factSales
INNER JOIN dimMovie on (dimMovie.movie_key = factSales.movie_key)
INNER JOIN dimDate on (dimDate.date_key = factSales.date_key)
INNER JOIN dimCustomer on (dimCustomer.customer_key = factSales.customer_key)
group by (dimMovie.title, dimDate.month, dimCustomer.city)
order by dimMovie.title, dimDate.month, dimCustomer.city, revenue desc;