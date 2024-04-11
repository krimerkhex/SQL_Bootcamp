select person.id as object_id, person.name as object_name
FROM person
union all
select menu.id as object_id, menu.pizza_name as object_name
FROM menu
order by object_id, object_name
