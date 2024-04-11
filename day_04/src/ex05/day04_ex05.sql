create view v_price_with_discount as
select p.name, m.pizza_name, m.price, (m.price - m.price*0.1) as discount_price from person_order
join person p on person_order.person_id = p.id
join menu m on person_order.menu_id = m.id
order by 1, 2;