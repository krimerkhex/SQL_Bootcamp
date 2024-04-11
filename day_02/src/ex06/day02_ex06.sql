with temp as (
    select id from person
    where name = 'Denis' or name = 'Anna'
), orders as (
    select menu_id, pizzeria_id from person_order
    join person_visits pv on person_order.person_id = pv.person_id
    join temp on pv.person_id = temp.id
    where pv.visit_date = person_order.order_date
)

-- select * from orders;

select menu.pizza_name, pizzeria.name as pizzeria_name from orders
join menu on menu.id = orders.menu_id
join pizzeria on pizzeria.id = orders.pizzeria_id
order by 1, 2;