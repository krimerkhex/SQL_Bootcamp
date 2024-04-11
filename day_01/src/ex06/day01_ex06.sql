select action_date, person.name as person_name
from (select order_date as action_date, person_id
    from person_order
    intersect
    select visit_date as action_date, person_id
    from person_visits) as temp
join person on temp.person_id = person.id
order by action_date, person_name DESC;
