with temp as (
    select pizzeria_id from person_visits group by 1
)

select name, rating from pizzeria
left join temp on temp.pizzeria_id = pizzeria.id
where temp.pizzeria_id is NULL