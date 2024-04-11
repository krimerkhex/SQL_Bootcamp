insert into person_order(id, person_id, menu_id, order_date)
select generate_series((select max(id) from person_order) + 1,
(select max(id) from person) + (select max(id) from person_order), 1) as id,
generate_series((select MIN(id) from person), (select max(id) from person)) as person_id,
(select id from menu where pizza_name = 'greek pizza') as menu_id,
'2022-02-25' as order_date;