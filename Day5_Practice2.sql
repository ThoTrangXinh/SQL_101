-- EXERCISE 1
select distinct city from station
where ID%2 =0

-- EXERCISE 2
select count(city) - count(distinct city) from station

-- EXERCISE 3
select 
ceiling (avg (salary) - avg (replace(salary,'0','')))
from employees

-- EXERCISE 4
SELECT
round(cast(sum(item_count*order_occurrences)/sum(order_occurrences) as decimal), 1) as mean
FROM items_per_order

-- EXERCISE 5
SELECT candidate_id
FROM candidates
WHERE skill in ('Python','Tableau','PostgreSQL')
group by candidate_id
having count(skill) = 3
ORDER BY candidate_id ASC

-- EXERCISE 6
SELECT user_id,
date (MAX(post_date)) - date(MIN(post_date)) AS day_between
FROM posts
where post_date >= '2021-01-01' and post_date < '2022-01-01'
group by user_id
having count(post_id) >= 2

-- EXERCISE 7
SELECT card_name,
MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC

-- EXERCISE 8
SELECT manufacturer,
COUNT (drug) AS drug_count,
ABS (SUM(cogs - total_sales)) AS total_loss
FROM pharmacy_sales
WHERE total_sales < cogs
GROUP BY manufacturer
ORDER BY total_loss DESC

-- EXERCISE 9
select *
from cinema
where id%2 = 1
and description <> 'boring'
order by rating desc

-- EXERCISE 10
SELECT teacher_id,
count(distinct subject_id) as cnt
FROM teacher
group by teacher_id

-- EXERCISE 11
select user_id,
count(follower_id) as followers_count
from Followers
group by user_id
order by user_id asc

-- EXERCISE 12
select class from Courses
group by class
having count(student) >= 5
