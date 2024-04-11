select generated_date as missing_date from v_generated_dates
left join person_visits on generated_date = visit_date
where person_visits.visit_date is NULL