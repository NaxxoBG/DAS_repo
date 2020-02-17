-- 1. Find the names of beverages that are offered in 'maxi' size
select name from beverage where size = 'large';

-- 2. Find the names of beverages that come in 'maxi' or 'medium' size
select `name`, size from beverage where size = 'large' or size = 'medium';

-- 3. Find the names of beverages that come in both a 'maxi' and 'medium' size 
SELECT a.name, a.size, b.size
FROM beverage a, beverage b
WHERE a.name = b.name
AND a.size = 'large' and b.size = 'medium'
ORDER BY A.name;

-- 4. Find the names and the phone numbers of the stores in "Randers" or "Horsens" that sell a 'maxi' beverage named "latte"
-- for no more than 45 kr

select `name`, telephone
from store
where location in ('Randers', 'Horsens') and 

-- 5. Find the code(s), name(s), and name(s) of store(s), selling the least expensive beverage(s).

-- 6.For each store , give its name and the code(s) of the least expensive beverage(s) it sells.


-- 7. For each store, give its name and the price of the least expensive beverage(s) it sells.
-- Repeat, but now (i) include the name(s) of such beverage(s) and (ii) do not use any aggregation operations,
-- such as like MIN, GROUP BY, ORDER BY, etc.

-- 8. For each beverage, give its name, size, and its highest price across all stores. 
-- Repeat, but now (i) include the name(s) of store(s) selling that beverage at the highest price, and (ii) 
-- do not use any aggregation operations,such as MAX, GROUP BY, ORDER BY, etc.

-- 9. Find the names of the stores that offer all beverage codes; do not use COUNT.

-- 10. Find the largest price difference between beverages of the same name across all stores, the name(s) of the beverage(s) having that price difference, and the relevant store(s).