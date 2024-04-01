-- EXERCISE 1
select
name
from students
where marks >75
order by right (name,3) ASC, ID ASC

-- EXERCISE 2
select
user_id,
concat (upper (left(name,1)), lower(right(name,length(name)-1))) as name
from Users
order by user_id

-- EXERCISE 3
SELECT manufacturer,
CONCAT('$',round(SUM (total_sales)/1000000,0),' million') AS sale
FROM pharmacy_sales
group by manufacturer
order by SUM (total_sales) desc, manufacturer asc

-- EXERCISE 4
SELECT
EXTRACT (MONTH FROM submit_date) AS mth,
product_id AS product,
ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY EXTRACT (MONTH FROM submit_date), product_id
ORDER BY mth, product

-- EXERCISE 5
SELECT
sender_id,
COUNT(message_id) AS message_count
FROM messages
WHERE to_char (sent_date,'mm-yyyy') = '08-2022'
GROUP BY sender_id
order by message_count DESC
limit 2

-- EXERCISE 6
select
tweet_id
from Tweets
where length(content) >15

-- EXERCISE 7
select
activity_date as day, 
count(distinct user_id) as active_users
from Activity
where activity_date between '2019-06-28' and '2019-07-27'
group by activity_date

-- EXERCISE 8
select
EXTRACT (MONTH FROM joining_date) AS MTH,
COUNT (id) AS NUMBER_EMPLOYEES
from employees
WHERE EXTRACT (YEAR FROM joining_date) = 2022
AND EXTRACT (MONTH FROM joining_date) BETWEEN 1 AND 7
GROUP BY MTH

-- EXERCISE 9
select
position ('a' in 'Amitah') as clm
from worker
where first_name = 'Amitah'

-- EXERCISE 10
select title, 
substring (title from length(winery) + 2 for 4)
from winemag_p2
where country = 'Macedonia'

