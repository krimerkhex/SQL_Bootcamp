with g_p as (
    select gender, pizzeria_id from person_visits
    join person on person_visits.person_id = person.id
), male_visits as (
    select pizzeria_id from g_p where gender = 'male'
    group by 1 order by 1
), woman_visits as (
    select pizzeria_id from g_p where gender = 'female'
    group by 1 order by 1
), only_m as (
    select m_v.pizzeria_id from male_visits m_v
    left join woman_visits w_v on m_v.pizzeria_id = w_v.pizzeria_id
    -- where w_v.pizzeria_id is NULL
), only_w as (
    select w_v.pizzeria_id from woman_visits w_v
    left join male_visits m_v on m_v.pizzeria_id = w_v.pizzeria_id
    -- where m_v.pizzeria_id is NULL
)

(select p.name from only_m
join pizzeria p on  p.id = only_m.pizzeria_id
union
select p.name from only_w
join pizzeria p on  p.id = only_w.pizzeria_id)
order by 1