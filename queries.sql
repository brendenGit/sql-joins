-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id --
SELECT * 
    FROM owners 
    FULL JOIN vehicles ON owners.id = vehicles.owner_id;

-- Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. 
-- first_name should be ordered in ascending order --
SELECT first_name, last_name, count(*)
    FROM owners 
    JOIN vehicles ON owners.id = vehicles.owner_id
    GROUP BY first_name, last_name
    ORDER BY first_name ASC;

--Count the number of cars for each owner and display the average price for each of the cars as integers.--
--Display the owners first_name , last_name, average price and count of vehicles. The first_name should be ordered in descending order.-- 
--Only display results with more than one vehicle and an average price greater than 10000--
SELECT o.first_name, o.last_name, CAST(avg(v.price) AS INT) AS avg_vehicle_price, count(*)
    FROM owners o
    JOIN vehicles v ON o.id = v.owner_id
    GROUP BY first_name, last_name
    HAVING count(*) > 1 AND CAST(avg(v.price) AS INT) > 10000
    ORDER BY first_name DESC;