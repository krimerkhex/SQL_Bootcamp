create unique index idx_person_discounts_unique
on person_discounts (person_id, pizzeria_id);

SET enable_seqscan = off;
EXPLAIN analyze
with temp_1 as (
    select person_order.person_id, menu.pizza_name, menu.price, menu.pizzeria_id
    from person_order
    join person on person_order.person_id = person.id
    join menu on person_order.menu_id = menu.id
)

select distinct person.name as name,
       temp_1.pizza_name,
       temp_1.price,
       (temp_1.price - (temp_1.price/100) * (select discount from person_discounts
       where temp_1.person_id = person_discounts.person_id
           and
             temp_1.pizzeria_id = person_discounts.pizzeria_id)) as discount_price,
       pizzeria.name as pizzeria_name
from temp_1
join person on person_id = person.id
join pizzeria on pizzeria_id = pizzeria.id
order by 1, 2;
