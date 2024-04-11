start transaction; -- for 1-st & 2-nd sessions
set isolation level repeatable read; -- for 1-st & 2-nd sessions
select sum(rating) from pizzeria; -- for 1-st session
insert into pizzeria set rating = 5 where name = 'Pizza Hut'; -- for 2-nd session
commit; -- for 2-nd session
select sum(rating) from pizzeria; -- for 1-st session
commit; -- for 1-st session
select sum(rating) from pizzeria; -- for 1-st & 2-nd session,
-- but we research for anomalis, i used select * from pizzeria