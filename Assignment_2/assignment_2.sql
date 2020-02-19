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

select a.`name`, a.telephone
from store a, sells b, beverage c
where a.location in ('Randers', 'Horsens') 
	and b.`code` = c.`code` 
	and b.store_name = a.`name` 
	and b.price <= 45 and c.`name` = 'latte' and c.size = 'large';

-- 5. Find the code(s), name(s), and name(s) of store(s), selling the least expensive beverage(s).
select c.`code`, c.`name`, a.`name`
from store a, sells b, beverage c
WHERE 
	b.`code` = c.`code` 
	and b.store_name = a.`name` 
    and b.price = (
        SELECT 
            MIN(sells.price)
        FROM
            sells);
            
-- Version 2, no aggregation
select b.`code`, b.`name`, t.`name` as "store name"
from (store t, sells s, beverage b)
LEFT JOIN sells s2
    ON s2.price < s.price
	where b.`code` = s.`code` and s.store_name = t.name and s2.price is null;

-- 6.For each store , give its name and the code(s) of the least expensive beverage(s) it sells.
select a.store_name, a.`code`
from sells a, store b, beverage c
group by a.`store_name`, a.price
having (a.price, a.store_name) in (select min(t.price), t.store_name from sells t, store g where t.`store_name` = g.`name` group by t.`store_name`)
order by a.price;

-- 7. For each store, give its name and the price of the least expensive beverage(s) it sells.
-- Repeat, but now (i) include the name(s) of such beverage(s) and (ii) do not use any aggregation operations,
-- such as like MIN, GROUP BY, ORDER BY, etc.

	-- 7.1
select a.store_name, a.price
from sells a, store b, beverage c
group by a.`store_name`, a.price
having (a.price, a.store_name) in (select min(t.price), t.store_name from sells t, store g where t.`store_name` = g.`name` group by t.`store_name`)
order by a.price asc;

-- 7.2
select t.`name`, s.price, b.`name`, b.`code`
from (store t, sells s, beverage b)
LEFT JOIN sells s2
    ON s2.price < s.price
	where b.`code` = s.`code` and s.store_name = t.name and s2.price is null;

-- 8. For each beverage, give its name, size, and its highest price across all stores. 
-- Repeat, but now (i) include the name(s) of store(s) selling that beverage at the highest price, and (ii) 
-- do not use any aggregation operations,such as MAX, GROUP BY, ORDER BY, etc.

select c.`name`, b.size, s.price
from beverage b, sells s, store c
group by s.`store_name`, s.price, b.size
having (s.price, b.size, s.store_name) in (select max(t.price), t.store_name, i.size from sells t, store g, beverage i where t.`store_name` = g.`name` group by t.`store_name`)
order by s.price desc;

-- 9. Find the names of the stores that offer all beverage codes; do not use COUNT.

-- 10. Find the largest price difference between beverages of the same name across all stores, the name(s) of the beverage(s)
-- having that price difference, and the relevant store(s).