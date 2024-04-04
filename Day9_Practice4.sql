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

