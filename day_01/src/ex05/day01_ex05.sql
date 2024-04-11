select *
from person join pizzeria
on person.id != pizzeria.id or person.id = pizzeria.id
group by person.id, pizzeria.id
