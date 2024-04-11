create or replace function fnc_trg_person_delete_audit() returns trigger as $person_audit$
    begin
        if (TG_OP = 'DELETE') then
            insert into person_audit select now(), 'D',  OLD.*;
            return OLD;
        end if;
    end;
$person_audit$ language plpgsql;

create trigger trg_person_delete_audit
after insert or update or delete on person
for each row execute procedure fnc_trg_person_delete_audit();
delete from person where id = 10;