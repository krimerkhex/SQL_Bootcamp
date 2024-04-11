create table person_audit (
    created    timestamp with time zone default now() not null,
    type_event char(1)         default 'I' not null,
    row_id     bigint not null,
    name       varchar not null,
    age        integer not null default 10,
    gender     varchar          default 'female' not null,
    address    varchar
    constraint ch_type_event check (type_event = 'I' OR type_event = 'D' OR type_event = 'U')
);

create or replace function fnc_trg_person_insert_audit() returns trigger as $person_audit$
    begin
        if (TG_OP = 'INSERT')
            then
                insert into person_audit select now(),'I',  NEW.*;
            return NEW;
        end if;
    end;
$person_audit$ language plpgsql;

create trigger trg_person_insert_audit
after insert on person
for each row execute procedure fnc_trg_person_insert_audit();
insert into person values (10, 'Damir', 22, 'male', 'Irkutsk');