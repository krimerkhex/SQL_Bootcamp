with temp as (
    select person_order.person_id, menu.pizzeria_id
    from person_order
    join menu on person_order.menu_id = menu.id
)

insert into person_discounts
select
    row_number() over () as id,
    temp.person_id, temp.pizzeria_id,
    (case
        when count(temp.pizzeria_id) = 1 then 10.5
        when count(temp.pizzeria_id) = 2 then 22
        else 30
    end)
from temp
group by temp.person_id, temp.pizzeria_id;

