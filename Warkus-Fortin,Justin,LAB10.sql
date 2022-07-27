SELECT * FROM customers;
------------------------------------------------------------------------------------------------------------------
SELECT * FROM countries;
------------------------------------------------------------------------------------------------------------------
SELECT customers.name, customers.city, countries.name
FROM customers JOIN countries
ON customers.country_id = countries.id
WHERE countries.name = 'Canada'
------------------------------------------------------------------------------------------------------------------
SELECT c.name, c.city, o.id, o.order_date 
FROM customers c JOIN orders o
ON c.id = o.customer_id 
WHERE c.id between 4563 and 5678
ORDER BY order_date DESC;
------------------------------------------------------------------------------------------------------------------
SELECT c.name, c.city, o.id, o.order_date, ct.name
FROM customers c JOIN orders o 
ON c.id = o.customer_id 
JOIN countries ct 
ON c.country_id = ct.id
WHERE (c.id between 4563 and 5678) and ct.name = 'Canada' 
ORDER BY order_date;
------------------------------------------------------------------------------------------------------------------
SELECT c.name, c.city, o.id, o.order_date, p.name, ct.name
FROM customers c JOIN orders o 
ON c.id = o.customer_id 
JOIN countries ct 
ON c.country_id = ct.id
JOIN state_provinces p on c.state_province_id = p.id
WHERE (c.id between 4563 and 5678) and ct.name = 'Canada' 
ORDER BY order_date;
------------------------------------------------------------------------------------------------------------------
SELECT to_char(AVG(price), '99999999D99') FROM order_lines WHERE product_version_id = 198;
------------------------------------------------------------------------------------------------------------------
SELECT MAX(price) FROM order_lines WHERE product_version_id = 198;
------------------------------------------------------------------------------------------------------------------
SELECT ol.order_id, o.order_date, SUM(ol.extended_price), COUNT(DISTINCT ol.id)
FROM order_lines ol JOIN orders o 
ON ol.order_id = o.id
WHERE ol.order_id = 34567
GROUP BY ol.order_id, o.order_date
------------------------------------------------------------------------------------------------------------------
SELECT p.name, to_char(AVG(pv.msrp), '9999999D99') 
FROM products p, product_versions pv
WHERE p.name = 'Groovecom'
GROUP BY p.name
------------------------------------------------------------------------------------------------------------------
SELECT to_char(avg(price), '9999D99')
FROM order_lines
JOIN product_versions on product_versions.id = order_lines.product_version_id
WHERE product_versions.product_id = (select id from products where products.name = 'Groovecom');
------------------------------------------------------------------------------------------------------------------
SELECT to_char(avg(line_count), '99999999D99')
AS Average, max(line_count), min(line_count)
FROM (SELECT COUNT(*) as line_count, order_id FROM order_lines group by order_id) as a;
------------------------------------------------------------------------------------------------------------------
CREATE VIEW OntarioCustomersOrders_V AS
SELECT count(orders.*) as NumOfOrders,
		customers.name as CustomersName
FROM customers 
JOIN state_provinces
	ON customers.state_province_id = state_provinces.id
JOIN orders
	ON orders.customer_id = customers.id
WHERE state_provinces.name LIKE 'Ontario' 
GROUP BY customers.name
------------------------------------------------------------------------------------------------------------------
SELECT to_char (avg (NumOfOrders), '99999D99') FROM OntarioCustomersOrders_V;
------------------------------------------------------------------------------------------------------------------
1
------------------------------------------------------------------------------------------------------------------
SELECT a.customer_id, to_char(avg(order_count), '9999999D99') as Average
FROM (SELECT SUM(extended_price) as order_count, customer_id from orders join order_lines on order_lines.order_id = orders.id
	  Group by customer_id) 
AS A JOIN customers on customers.id = a.customer_id
GROUP BY a.customer_id
OrDER BY a.customer_id ASC
LIMIT 500;
------------------------------------------------------------------------------------------------------------------
SELECT * FROM products
join product_versions on products.id = product_versions.product_id
------------------------------------------------------------------------------------------------------------------
SELECT * FROM products
left join product_versions on products.id = product_versions.product_id
------------------------------------------------------------------------------------------------------------------
SELECT * FROM products
left join product_versions on products.id = product_versions.product_id
WHERE product_versions.id IS NULL;
------------------------------------------------------------------------------------------------------------------
SELECT email FROM customers
UNION
SELECT email FROM tradeshow_leads;
------------------------------------------------------------------------------------------------------------------
SELECT email FROM tradeshow_leads
EXCEPT
SELECT email FROM customers
------------------------------------------------------------------------------------------------------------------
SELECT email FROM tradeshow_leads
INTERSECT
SELECT email FROM customers
