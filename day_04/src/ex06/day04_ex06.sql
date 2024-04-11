create materialized view mv_dmitriy_visits_and_eats
as with temp as (
    select pizzeria_id from person_visits pv
    join pizzeria p on pv.pizzeria_id = p.id
    where pv.visit_date = '2022-01-08' and pv.person_id = 9
), costs as (
    select menu.pizzeria_id, price from menu, temp
    where temp.pizzeria_id = menu.pizzeria_id and price < 800
)

select name as pizzeria_name from costs
join pizzeria on pizzeria_id = pizzeria.id
where costs.price is not NULL;