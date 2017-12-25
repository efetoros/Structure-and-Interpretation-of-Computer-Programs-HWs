create table parents as
  select "abraham" as parent, "barack" as child union
  select "abraham"          , "clinton"         union
  select "delano"           , "herbert"         union
  select "fillmore"         , "abraham"         union
  select "fillmore"         , "delano"          union
  select "fillmore"         , "grover"          union
  select "eisenhower"       , "fillmore";

create table dogs as
  select "abraham" as name, "long" as fur, 26 as height union
  select "barack"         , "short"      , 52           union
  select "clinton"        , "long"       , 47           union
  select "delano"         , "long"       , 46           union
  select "eisenhower"     , "short"      , 35           union
  select "fillmore"       , "curly"      , 32           union
  select "grover"         , "short"      , 28           union
  select "herbert"        , "curly"      , 31;

create table sizes as
  select "toy" as size, 24 as min, 28 as max union
  select "mini",        28,        35        union
  select "medium",      35,        45        union
  select "standard",    45,        60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
create table size_of_dogs as
  select name, size from dogs, sizes
  where height > min and height <= max;
 
-- All dogs with parents ordered by decreasing height of their parent
create table by_height as
  select child from dogs, parents 
  where name = parent
  order by - height;
  
-- Sentences about siblings that are the same size
-- create table sentences as
  -- with
  -- greater(stack, num, theight, max) as (
  --   select name, 1, height, height from dogs union
  --   select stack || ',' || name, num + 1, theight + height, height
  --   from dogs, greater
  --   where num < 4 and max < height

  --   )
  -- select stack, theight from greater where num = 4 and theight >= 170
  -- order by theight;

  


-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
create table stacks as
with
    sums(names, total, n, max) as (
      select name, height, 1, height from dogs union
      select names || ", " || name, total+height, n+1, height
        from sums, dogs
        where n < 4 and max < height
    )
  select names, total from sums where n=4 and total>=170 order by total;
    
  

-- non_parents is an optional, but recommended question
-- All non-parent relations ordered by height difference
-- create table non_parents as
--   with
--   grandparents(gp, gc) as(
--     select b.parent, a.child from 
--     parent as a, parents as b where
--     b.child = a.parent

--     )
--   with grandgrand(ggp,ggc) as(
--     select gp, gc from grandparents union
--     select parent, child from parents where 
--     child = gp and parent = gc

--     )
--   select 

-- create table ints as
--     with i(n) as (
--         select 1 union
--         select n+1 from i limit 100
--     )
--     select n from i;

-- create table divisors as
--     with h(num, div) as (
--       select a.n, b.n 
--       from ints as a, ints as b 
--       where a.n % b.n = 0)
      
--     select num, count(*) as div from h group by num;
 

-- create table primes as
    

--     select num from divisors where div = 2;





