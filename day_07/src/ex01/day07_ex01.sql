with temp as (
    select person_id, count(person_id) as count_of_visits from person_visits
    group by person_id
    order by count_of_visits DESC
)

select person.name, count_of_visits
from temp
join person on person_id = person.id
order by count_of_visits DESC
limit 4;