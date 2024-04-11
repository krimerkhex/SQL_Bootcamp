create or replace function fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy',
															  pprice numeric default 500,
															  pdate date default '2022-01-08')
returns table (pizzeria_name varchar) as $$
begin
	return query select distinct p.name from pizzeria p
	join menu m on m.pizzeria_id = p.id
				and m.price < pprice
	join person_order po on po.menu_id = m.id
							and po.order_date = pdate
							and po.order_date in (select pv.visit_date from person_visits pv)
	join person pe on pe.id = po.person_id
							and pe.name = pperson;
end;
$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');