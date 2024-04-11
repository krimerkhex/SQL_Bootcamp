(select person.name as object_name
FROM person order by object_name)
union all
(select menu.pizza_name as object_name
FROM menu order by object_name)