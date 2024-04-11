create index idx_person_name on person(upper(name));

SET enable_seqscan = off;
EXPLAIN analyze
select name from person
where upper(name) = upper(name);
-- where upper(name) is not NULL;
-- where upper(name) is NULL;