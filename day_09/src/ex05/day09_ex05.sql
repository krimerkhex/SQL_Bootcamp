drop function fnc_persons_female();
drop function fnc_persons_male();

create function fnc_persons(in pgender text default 'female') returns setof person as $$
   select * from person where gender = pgender;
$$ language SQL;


select * from fnc_persons();
select * from fnc_persons(pgender:='male');