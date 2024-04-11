comment on table person_discounts is '
The table contains a discount for people in pizzerias';
comment on column person_discounts.id is 'Primary key for table';
comment on column person_discounts.person_id is 'Counting person_id for joins with person';
comment on column person_discounts.pizzeria_id is 'Counting pizzeria_id for joins with pizzeria';
comment on column person_discounts.discount is 'Counting discount value for person';
