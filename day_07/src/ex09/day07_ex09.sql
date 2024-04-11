select address,
       (round((max(age) - round((round(min(age), 2) / round(max(age), 2)), 2)), 2)) as formula,
       round(avg(age), 2) as average,
       (case
           when (round((max(age) - round((round(min(age), 2) / round(max(age), 2)), 2)), 2)) > round(avg(age), 2) then 'true'
           else 'false'
        end) as comparison
       from person where address = address
group by 1
order by 1;
