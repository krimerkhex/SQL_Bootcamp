

create view v_symmetric_union as select temp.id as person_id from (
with R as (
    select id from person_visits where visit_date >= '2022-01-02'
), S as (
    select id from person_visits where visit_date >= '2022-01-06'
)
    select R.id from R
    left join S on R.id = S.id
    where S.id is NULL
    union
    select S.id from S
    left join R on S.id = R.id
    where R.id is NULL
    order by 1) as temp