use sakila;

show tables;

-- Question 1a
select a.first_name, a.last_name from actor a;

-- Question 1b
SELECT *, CONCAT(first_name, ' ', last_name)
as ActorName
from actor;

-- Question 2a
SELECT actor_id, first_name, last_name from actor
   WHERE first_name = 'Joe';
   
-- Question 2b
SELECT * from actor
	WHERE last_name LIKE "%GEN%";

-- Question 2c
SELECT * from actor a
	WHERE a.last_name LIKE "%LI%"
ORDER BY a.last_name, a.first_name;

-- Question 2d
SELECT country_id, country
FROM country 
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- Question 3a
ALTER TABLE customer
ADD description BLOB(100000);
select * from customer limit 10;

-- Question 3b
ALTER TABLE customer
DROP description;

select * from customer limit 10;

-- Question 4a
SELECT last_name, count(*)
FROM actor
GROUP BY last_name;


-- Question 4b
SELECT last_name, count(*)
FROM actor
GROUP BY last_name
HAVING count(*) > 1;

-- Question 4c
SELECT REPLACE(first_name, 'GROUCHO', 'HARPO') AS first_name FROM actor
GROUP BY first_name
ORDER BY first_name;

-- Question 4d
SELECT REPLACE(first_name, 'HARPO', 'GROUCHO') AS first_name FROM actor
GROUP BY first_name
ORDER BY first_name;

-- Question 5a
CREATE TABLE address_hmwrk
(
address_id smallint(5) ,
address varchar(50), 
address2 varchar(50), 
district varchar(20), 
city_id smallint(5),
postal_code varchar(10), 
phone varchar(20) ,
location geometry ,
last_update timestamp
);
SHOW CREATE TABLE address;

-- Question 6a
SELECT s.first_name, s.last_name, address.address
FROM staff s
INNER JOIN address ON address.address_id=s.address_id;

-- Question 6b
SELECT s.first_name, s.last_name, sum(payment.amount) as "Total Rung Up"
FROM staff s
INNER JOIN payment on payment.staff_id = s.staff_id
WHERE payment_date BETWEEN '2005-08-01' AND '2005-08-30'
GROUP BY s.staff_id;

SELECT *
FROM payment;

-- Question 6c
SELECT f.title, count(fa.actor_id) as "Number of Actors in Film"
FROM film f
INNER JOIN film_actor fa on fa.film_id=f.film_id
GROUP BY f.title;

-- Question 6d
SELECT f.title, count(i.inventory_id)
FROM inventory i
INNER JOIN film f on f.film_id = i.film_id
WHERE f.title='Hunchback Impossible';

-- Question 6e
SELECT c.last_name, sum(payment.amount) as "Total Paid"
FROM payment
JOIN customer c on c.customer_id = payment.customer_id
GROUP BY c.last_name;

-- Question 7a
SELECT f.title
FROM film f
WHERE f.title LIKE 'Q%' or f.title like 'K%';

-- Question 7b
SELECT fa.film_id, fa.actor_id, a.last_name
FROM film_actor fa
JOIN actor a on a.actor_id = fa.actor_id
WHERE fa.film_id 
IN (SELECT film.film_id FROM film WHERE film.title = 'ALONE TRIP')
ORDER BY a.last_name;

-- Question 7c
SELECT c.first_name, c.last_name, c.email, a.city_id, co.country 
FROM customer c
JOIN address a ON a.address_id = c.address_id
JOIN city ct ON a.city_id = ct.city_id
JOIN country co ON ct.country_id = co.country_id WHERE co.country = "Canada";

-- Question 7D
SELECT f.rating, f.film_id, f.title
FROM film f
WHERE f.rating = "G";

-- Question 7e
SELECT f.rental_rate, f.title
FROM film f
ORDER BY f.rental_rate DESC;

-- Question 7f
SELECT sum(p.amount), p.payment_id, s.store_id
FROM payment p
JOIN staff sf ON p.staff_id = sf.staff_id
JOIN store s ON sf.store_id = s.store_id
GROUP BY s.store_id;

-- Question 7g
SELECT s.store_id, c.city, co.country
FROM store s
JOIN address a ON a.address_id = s.address_id
JOIN city c ON c.city_id = a.city_id
JOIN country co ON c.country_id = co.country_id;

-- Question 7h
SELECT c.name, sum(p.amount), i.inventory_id
FROM category c
JOIN film_category fc ON fc.category_id = c.category_id
JOIN inventory i ON i.film_id = fc.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN payment p ON p.rental_id = r.rental_id
GROUP BY c.name
ORDER BY sum(p.amount) DESC;

-- Question 8a
CREATE VIEW top_five AS
SELECT c.name, sum(p.amount), i.inventory_id
FROM category c
JOIN film_category fc ON fc.category_id = c.category_id
JOIN inventory i ON i.film_id = fc.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN payment p ON p.rental_id = r.rental_id
GROUP BY c.name
ORDER BY sum(p.amount) DESC;

-- Question 8b
SELECT * 
FROM top_five;

-- Question 8c
DROP VIEW top_five;









 




    
    
    
    


   

 







