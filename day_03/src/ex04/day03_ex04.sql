with g_p as (
    select gender, pizzeria_id from person_order
    join person on person_order.person_id = person.id
    join menu m on person_order.menu_id = m.id
), male_visits as (
    select pizzeria_id from g_p where gender = 'male'
    group by 1 order by 1
), woman_visits as (
    select pizzeria_id from g_p where gender = 'female'
    group by 1 order by 1
)

select pizzeria.name from (select w_v.pizzeria_id from woman_visits w_v
left join male_visits m_v on m_v.pizzeria_id = w_v.pizzeria_id where m_v.pizzeria_id is NULL) as temp
join pizzeria on temp.pizzeria_id = pizzeria.id

