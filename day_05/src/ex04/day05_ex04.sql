create unique index idx_menu_unique
on menu (pizzeria_id, pizza_name);

SET enable_seqscan = off;
EXPLAIN analyze
SELECT pizzeria_id, pizza_name
FROM menu;