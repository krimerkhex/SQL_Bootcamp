select p1.name as person_name1,
       p2.name as person_name2,
       p1.address as common_address from person p1
join person p2 on p2.address = p1.address
where not p1.name = p2.name and p1.id > p2.id
order by 1, 2, 3;
