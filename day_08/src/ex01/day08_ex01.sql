start transaction; -- for 1-st & 2-nd sessions
select * from pizzeria where name = 'Pizza Hut'; -- for 1-st & 2-nd session,
-- but we research for anomalis, i used select * from pizzeria
insert into pizzeria set rating = 4 where name = 'Pizza Hut'; -- for 1-st session
insert into pizzeria set rating = 3.6 where name = 'Pizza Hut'; -- for 2-nd session
commit; -- for 1-st session
commit; -- for 2-nd session
select * from pizzeria where name = 'Pizza Hut'; -- for 1-st & 2-nd session,
-- but we research for anomalis, i used select * from pizzeria