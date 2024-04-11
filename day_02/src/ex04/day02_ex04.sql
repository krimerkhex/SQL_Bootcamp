with temp as (
    select pizzeria_id, pizza_name, price from menu
    where pizza_name = 'pepperoni pizza' or pizza_name = 'mushroom pizza'
)

select pizza_name, name as pizzeria_name, price from temp
join pizzeria on id = temp.pizzeria_id
order by 1, 2;