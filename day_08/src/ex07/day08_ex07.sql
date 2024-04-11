start transaction; -- for 1-st & 2-nd sessions
update pizzeria set ratong = 1 where id = 1; -- for 1-st sessions
update pizzeria set ratong = 1 where id = 2; -- for 2-nd sessions
update pizzeria set ratong = 2 where id = 2; -- for 1-st sessions
update pizzeria set ratong = 2 where id = 1; -- for 2-nd sessions
commit; -- for 1-st & 2-nd sessions