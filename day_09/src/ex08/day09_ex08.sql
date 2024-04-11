create function fnc_fibonacci(in pstop int default 10) returns setof int as $$
begin
    return query (with recursive fib(Num, Prev) as (
        select 0, 1
        union all
        select fib.Num + fib.Prev, fib.Num
        from fib
        where fib.Num < pstop - fib.Prev
    )
    select Num
    from fib);
end
$$ language plpgsql;

select * from fnc_fibonacci(13);