select
       (select name from person where id in (select person_id)) as person_name,
       (select name from pizzeria where id in (select pizzeria_id)) as pizzeria_name
from (SELECT person_id, pizzeria_id FROM person_visits where visit_date between '2022-01-07' and '2022-01-09') as pv
order by person_name, pizzeria_name DESC;