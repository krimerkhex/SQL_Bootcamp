select distinct person.name as name from person_visits
join person on person_visits.person_id = person.id
order by 1;