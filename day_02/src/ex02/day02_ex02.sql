-- with names as (
--     select name as person_name from person
-- ), temp as (
--     select p.name as person_name, visit_date, p2.name as pizzeria_name from person_visits
--     join person p on p.id = person_visits.person_id
--     join pizzeria p2 on p2.id = person_visits.pizzeria_id
--     where '2022-01-01' <= visit_date and visit_date <= '2022-01-03'
-- ), pizzerias as (
--     select name as pizzeria_name from pizzeria
-- )
--
-- select names.person_name, visit_date, pizzerias.pizzeria_name from temp
-- join names on temp.person_name = names.person_name
-- join pizzerias on temp.pizzeria_name = pizzerias.pizzeria_name


select p.name as person_name, visit_date, p2.name as pizzeria_name from person_visits
    join person p on p.id = person_visits.person_id
    join pizzeria p2 on p2.id = person_visits.pizzeria_id
    where '2022-01-01' <= visit_date and visit_date <= '2022-01-03'
order by 1,2,3;