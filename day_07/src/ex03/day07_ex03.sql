with order_table as (
    select pizzeria.name as name, temp.count as count
      from (select in_temp.pizzeria_id, count(in_temp.pizzeria_id)
            from (select menu.id, pizzeria_id
                  from menu join person_order po on menu.id = po.menu_id) as in_temp
            group by pizzeria_id) as temp
               join pizzeria on temp.pizzeria_id = pizzeria.id
), visit_table as (
    select pizzeria.name as name, temp.count as count
      from (select pizzeria_id, count(pizzeria_id) from person_visits group by pizzeria_id) as temp
               join pizzeria on temp.pizzeria_id = pizzeria.id
)

select * from
(select visit_table.name, visit_table.count + order_table.count as count
from visit_table, order_table where visit_table.name = order_table.name) as result
order by name, count DESC;

