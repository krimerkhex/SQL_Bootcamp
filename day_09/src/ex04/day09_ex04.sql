create function fnc_persons_female() returns table (
    name text,
    age int,
    address text
                                                   ) as $$
    select name, age, address from person where gender = 'female';
$$ language SQL;

create function fnc_persons_male() returns table (
    name text,
    age int,
    address text
                                                   ) as $$
    select name, age, address from person where gender = 'male';
$$ language SQL;

select * from fnc_persons_female();
select * from fnc_persons_male();