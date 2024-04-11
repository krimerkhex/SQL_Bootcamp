select order_date, person.name || ' (age:' || person.age || ')'  as person_name
from (select order_date, person_id
      from person_order
     ) as temp
natural join person where person_id = person.id
order by order_date, person_name;
