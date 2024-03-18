-- 1- Lis all customers who live in Texas
-- (use joins)
-- Answer: Jennifer Davis / Kim Cruz 
-- Richard Mccrary / Bryan Hardison / Ian Still
SELECT CONCAT(first_name,' ',last_name) AS Name, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2- Get all payments above $6.99 with the
-- Customer's Full Name
-- Answer:
SELECT CONCAT(first_name, ' ',last_name) AS Name, amount
FROM customer
JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99
ORDER BY amount ASC;

-- 3- Show all customer names who have made
-- payments over $175 (use subqueries)
-- Answer:There are no payments made above 141.99
SELECT CONCAT(first_name, ' ',last_name) AS Name
FROM customer
WHERE customer_id IN(
    SELECT amount AS Payment_Amount
    from payment
    WHERE amount > 130
    ORDER BY amount DESC
);

-- 4- List all customers that live in Nepal
-- (use the city table)
-- Answer: No customers live in Nepal
SELECT CONCAT(first_name,' ',last_name) AS Name, city
FROM customer
JOIN address
ON address.address_id = customer.address_id
JOIN city
ON city.city_id = address.city_id
WHERE city LIKE 'Nepal';

-- 5- Which staff member had the most transactions
-- Answer: Jon Stephens with 7304 transactions
SELECT COUNT(payment.staff_id) AS PaymentCount, CONCAT(staff.first_name,' ',staff.last_name) AS Name
FROM payment
JOIN staff
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY PaymentCount DESC;

-- 6- How many movies of each rating are there?
-- Answer:178-G/ 194-PG/ 195-R/ 210-NC-17/ 223-PG-13
SELECT COUNT(rating), rating
FROM film
GROUP BY rating
ORDER BY COUNT ASC;

-- 7- Show all customers who have made a single
-- payment above $6.99 (use subqueries)
-- Answer:
SELECT customer_id, CONCAT(first_name, ' ', last_name) AS Name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    
)ORDER BY customer_id ASC;

-- 8- How many free rentals did our stores give away?
-- Answer:24
SELECT COUNT(amount), amount
FROM payment
GROUP BY amount
ORDER BY amount ASC LIMIT 1;