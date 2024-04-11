with temp as (
    select pizzeria_id, count(pizzeria_id) as count_of_order from (select pizzeria_id from person_order
    join menu m on person_order.menu_id = m.id) as temp
    group by pizzeria_id
), price_list as (
    select pizzeria_id,
           round(avg(price), 2) as average_price,
           max(price) as max_price,
           min(price) as min_price
    from menu
    group by pizzeria_id
)
select pizzeria.name, temp.count_of_order, pr.average_price, pr.max_price, pr.min_price from temp
join price_list pr on pr.pizzeria_id = temp.pizzeria_id
join pizzeria on temp.pizzeria_id = pizzeria.id
order by name;

