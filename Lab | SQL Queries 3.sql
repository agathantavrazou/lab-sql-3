-- Lab | SQL Queries 3

-- 1
select count(distinct(last_name))
from sakila.actor;

-- 2 
select count(distinct(language_id))
from sakila.language;

-- 3
select count(film_id)
from sakila.film
where rating = "PG-13";

-- 4 
select title, length
from sakila.film
where release_year = "2006"
limit 10;

-- 5
select datediff(max(rental_date),min(rental_date))
from sakila.rental;

-- 6: 
select date_format(convert(rental_date,date),'%M') as 'Rental Month', 
date_format(convert(rental_date, datetime), '%W') as 'Weekday' 
from sakila.rental
limit 20;

-- 7
select date_format(convert(rental_date, datetime), '%W') as rental_date,
case
when date_format(convert(rental_date, datetime), '%W') in ('Saturday','Sunday') then 'weekend'
else 'weekday'
end as 'day_type'
from sakila.rental;

-- 8: How many rentals were in the last month of activity?

select count(rental_id), date_format(convert(rental_date, date),'%M') as month, date_format(convert(rental_date,date),'%Y') as year
from sakila.rental 
group by 2,3
order by year desc
limit 1;

-- best version!
select count(rental_id), date_format(convert(rental_date, date),'%Y-%M') as yearmonth
from sakila.rental 
group by 2
order by yearmonth desc
limit 1;


-- or 
select count(rental_id) from sakila.rental
where date_format(convert(rental_date, date), '%M') = 'February' and date_format(convert(rental_date, date), '%Y') = '2006';
