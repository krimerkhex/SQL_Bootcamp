with peoples as (
    select id from person
    where gender = 'female'
), ches as (
    select id from menu
    where pizza_name = 'cheese pizza'
), pep as (
    select id from menu
    where pizza_name = 'pepperoni pizza'
)

select name
from
    (select person_id from person_order
    join peoples on person_id = peoples.id
    join ches on ches.id = person_order.menu_id
    intersect
    select person_id from person_order
    join peoples on person_id = peoples.id
    join pep on pep.id = person_order.menu_id)
as why_i_done_that
join person on person_id = person.id
order by 1;