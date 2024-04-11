alter table person_discounts
alter column discount set default 0, add check (discount >= 0 and discount <= 100);
alter table person_discounts add constraint ch_nn_person_id unique (person_id), alter column person_id set not NULL;
alter table person_discounts add constraint ch_nn_pizzeria_id unique (pizzeria_id), alter column pizzeria_id set not NULL;
alter table person_discounts add constraint ch_nn_discount unique (discount), alter column discount set not NULL;
