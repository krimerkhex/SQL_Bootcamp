with visit_table as (
    select person.name as name, temp.count as count
    from (select person_id, count(person_id) from person_visits group by person_id) as temp
    join person on temp.person_id = person.id
), names as (
    select person.name as name from person_visits
    join person on person_visits.person_id = person.id
    group by 1
)

select distinct visit_table.name, count from names
join visit_table on visit_table.count > 3;

