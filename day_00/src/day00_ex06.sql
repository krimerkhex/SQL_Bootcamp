select person.name, person.name = 'Denis' as check_name
from person
where person.id in (select person_id from person_order where order_date = '2022-01-07' and (menu_id = '13' or menu_id = '14' or menu_id = '18'));
