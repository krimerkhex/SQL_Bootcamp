start transaction; -- for 1-st & 2-nd sessions
set isolation level serializable; -- for 1-st & 2-nd sessions
select * from pizzeria where name = 'Pizza Hut'; -- for 1-st session,
-- but we research for anomalis, i used select * from pizzeria
insert into pizzeria set rating = 3.0 where name = 'Pizza Hut'; -- for 2-nd session
commit; -- for 2-nd session
select * from pizzeria where name = 'Pizza Hut'; -- for 1-st session,
-- but we research for anomalis, i used select * from pizzeria
commit; -- for 1-st session
select * from pizzeria where name = 'Pizza Hut'; -- for 1-st & 2-nd session,
-- but we research for anomalis, i used select * from pizzeria