with temp as (
    select * from generate_series(1, 2)
), visited_days as (
    select visit_date from person_visits
    join temp on person_visits.person_id = temp.generate_series
    group by 1
)

select person_visits.visit_date as missing_day from person_visits
left join visited_days v on v.visit_date = person_visits.visit_date
where v.visit_date is NULL
group by 1 order by 1;