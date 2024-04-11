drop trigger trg_person_insert_audit on person;
drop trigger trg_person_update_audit on person;
drop trigger trg_person_delete_audit on person;
drop function fnc_trg_person_update_audit();
drop function fnc_trg_person_delete_audit();
drop function fnc_trg_person_insert_audit();

create or replace  function fnc_trg_person_audit() returns  trigger as $person_audit$
    begin
        if (tg_op = 'UPDATE') then
            insert into person_audit select now(), 'U', NEW.*;
            return NEW;
        elsif (tg_op = 'INSERT') then
            insert into person_audit select now(), 'I', NEW.*;
            return NEW;
        elsif (tg_op = 'DELETE') then
            insert into person_audit select now(), 'D', OLD.*;
            return OLD;
        end if;
    end;
$person_audit$ language plpgsql;

create trigger trg_person_audit
after insert or update or delete on person
for each row execute procedure fnc_trg_person_audit();
insert into person(id, name, age, gender, address) values (10, 'Damir', 22, 'male', 'Irkutsk');
update person set name = 'Bulat' where id = 10;
update person set name = 'Damir' where id = 10;
delete from person where id = 10;