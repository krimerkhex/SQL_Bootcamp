select person_id from person_order where order_date = '2022-01-07'
union
select person_id from person_visits where visit_date = '2022-01-07';