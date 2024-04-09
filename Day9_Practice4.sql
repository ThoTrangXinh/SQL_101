-- EXERCISE 1
select
sum(case
    when device_type = 'laptop' then 1
    else 0
    end) as laptop_views,
sum(case
    when device_type = 'tablet' or device_type = 'phone' then 1
    else 0
    end) as mobile_views
from viewership

-- EXERCISE 2
select *,
case
    when x+y>z and y+z>x and z+x>y then 'Yes'
    else 'No'
end as triangle
from Triangle

-- EXERCISE 3
SELECT
cast(sum (CASE
    when call_category = 'n/a' or call_category is NULL then 1
    else 0
    end) as decimal) /count (case_id)
FROM callers

-- EXERCISE 4
select name from customer
where referee_id is null
or referee_id <> 2

-- EXERCISE 5
select survived,
sum(case
    when pclass = 1 then 1
    end) as first_class,
sum(case
    when pclass = 2 then 1
    end) as second_classs,
sum(case
    when pclass = 3 then 1
    end) as third_class
from titanic
group by survived
