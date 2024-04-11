select * from (select pizzeria.name as name, temp.count as count, 'order' as action_type from
    (select in_temp.pizzeria_id, count(in_temp.pizzeria_id) from (select menu.id, pizzeria_id from menu
    join person_order po on menu.id = po.menu_id) as in_temp
    group by pizzeria_id) as temp
    join pizzeria on temp.pizzeria_id = pizzeria.id
    order by count DESC
    limit 3) as order_table
union
select * from (select pizzeria.name as name, temp.count as count, 'visit' as action_type from
   (select pizzeria_id, count(pizzeria_id) from person_visits group by pizzeria_id) as temp
    join pizzeria on temp.pizzeria_id = pizzeria.id
    order by count DESC
    limit 3) as visit_table
order by action_type, count DESC;