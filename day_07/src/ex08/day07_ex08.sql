select person.address as address, p.name as name, count(menu.pizzeria_id) from person_order
join person on person.id = person_order.person_id
join menu on person_order.menu_id = menu.id
join pizzeria p on menu.pizzeria_id = p.id
group by 1, 2
order by 1, 2;