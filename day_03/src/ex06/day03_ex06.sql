select temp_1.pizza_name,
       temp_1.name as pizzeria_name_1,
       temp_2.name as pizzeria_name_2,
       temp_1.price
from (select menu.id, pizzeria.name, menu.pizza_name, menu.price
from menu join pizzeria on menu.pizzeria_id = pizzeria.id) as temp_1
cross join (select menu.id, pizzeria.name, menu.pizza_name, menu.price
from menu join pizzeria on menu.pizzeria_id = pizzeria.id) as temp_2
where
    temp_1.pizza_name = temp_2.pizza_name
and
    temp_1.price = temp_2.price
and
    temp_1.name != temp_2.name
and
    temp_1.id > temp_2.id
order by pizza_name;