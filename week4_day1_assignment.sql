--Week4 Day1 SQL Queries
--1. How many actors are there with the last name 'Wahlberg' ?
SELECT COUNT(last_name) as num_wahlbergs
FROM actor
WHERE last_name LIKE 'Wahlberg';
	
--2. How many payments were made between 3.99 and 5.99?
SELECT COUNT(amount) as num_payments
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--3. What film does the store have the most of ?

-- Did not use limit as there were multiple films with the same count
SELECT film_id, COUNT(film_id) as count_film_id_store1
FROM inventory
WHERE store_id = 1
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

SELECT film_id, COUNT(film_id) as count_film_id_store2
FROM inventory
WHERE store_id = 2
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

SELECT film_id, COUNT(film_id) as count_film_id_all_stores
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

--4. How many customers have the last name 'William'?
SELECT COUNT(last_name) as count_Last_name_william
FROM customer
WHERE last_name LIKE 'William';

--5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(amount) as num_payments_per_employee
FROM payment
GROUP BY staff_id
ORDER BY COUNT(amount) DESC
LIMIT 1 ;



--6. How many different district names are there?
SELECT COUNT(DISTINCT(district)) 
FROM address;

--7. What film has the most actors in it? 

SELECT film_id , COUNT(actor_id) as num_actors_in_film
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC
LIMIT 1;



--8.From store_id 1, how many customers have a last_name ending with 'es'?
SELECT store_id, COUNT(last_name) as  num_last_name
FROM customer
WHERE store_id = 1 and 
	  last_name LIKE '%es'
GROUP BY store_id;
	  
--9.How many payment amounts had a number of rentals above 250 for customers
---	with ids between 380 and 430
SELECT customer_id, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY customer_id
HAVING COUNT(amount) > 250;



--10. Within the film table how many rating categories are there? And what rating has the most movies total?

SELECT COUNT(DISTINCT(rating)) as num_rating_categories
FROM film;

SELECT rating, count(film_id) as num_films
FROM film
GROUP BY rating
ORDER BY count(film_id) DESC
LIMIT 1;












	





 


	
