select pizza_name, price, pizzeria.name as pizzeria_name, person_visits.visit_date
from menu
join pizzeria on menu.pizzeria_id = pizzeria.id
join person_visits on pizzeria.id = person_visits.pizzeria_id
join person on person_visits.person_id = person.id
where person.name = 'Kate' and price between 800 and 1000
order by pizza_name, price, pizzeria_name;