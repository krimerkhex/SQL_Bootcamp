begin transaction; -- for 1-st session
insert into pizzeria set rating = 5 where name = 'Pizza Hut'; -- for 1-st session
select * from pizzeria where name = 'Pizza Hut'; -- for 1-st & 2-nd session,
-- but we research for anomalis, i used select * from pizzeria
commit; -- for 1-st session
select * from pizzeria where name = 'Pizza Hut'; -- for 1-st & 2-nd session,
-- but we research for anomalis, i used select * from pizzeria