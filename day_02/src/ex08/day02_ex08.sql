with peoples as (
    select id from person
    where (address = 'Moscow' or address = 'Samara')
    and gender = 'male'
), orders as (
    select id from menu
    where pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'
)

select p2.name from person_order po
join peoples p on po.person_id = p.id
join orders o on o.id = po.menu_id
join person p2 on p2.id = po.person_id
order by 1 DESC;

