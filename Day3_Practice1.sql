--- EXERCISE 1
select name from city
where population > 120000
and countrycode = 'USA'

--- EXERCISE 2
select * from city
where countrycode = 'JPN'

--- EXERCISE 3
select city, state from station

--- EXERCISE 4
select distinct city from station
where city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' or city like 'u%'

--- EXERCISE 5
select distinct city from station
where city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u'

--- EXERCISE 6
select distinct city from station
where city not like 'a%' and city not like 'e%' and city not like 'i%' and city not like 'o%' and city not like 'u%'

--- EXERCISE 7
select name from employee
order by name ASC

--- EXERCISE 8
select name from employee
order by name ASC

--- EXERCISE 9
select product_id from products
where low_fats = 'Y' and recyclable = 'Y'

--- EXERCISE 10
select name from customer
where referee_id is null
or referee_id <> 2

--- EXERCISE 11
select name, population, area from world
where area >= 3000000 or population >= 25000000

--- EXERCISE 12
select distinct author_id as id from views
where author_id = viewer_id
order by author_id asc

--- EXERCISE 13
select part, assembly_step from parts_assembly
where finish_date is null

--- EXERCISE 14
select * from lyft_drivers
where yearly_salary <= 30000 or yearly_salary >= 70000

--- EXERCISE 15
select advertising_channel from uber_advertising
where year = 2019 and money_spent > 100000
