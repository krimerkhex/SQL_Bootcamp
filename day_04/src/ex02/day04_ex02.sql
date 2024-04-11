create view v_generated_dates as select DATE('2022-01-01')+ s.a as generated_date from Generate_series(0,30,1) as s(a);
