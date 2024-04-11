select temp.pizza_name, temp.price, pizzeria.name as pizzeria_name from (select pizza_name, price, pizzeria_id from menu where id not in(select menu_id from person_order)
order by pizza_name, price) as temp, pizzeria where temp.pizzeria_id = pizzeria.id
order by 1, 2;