"1.Get the names and the quantities in stock for each product."
select productname,unitsinstock from products;

"2.Get a list of current products (Product ID and name)."
select productid,productname from products where discontinued = 0;

"3.Get a list of the most and least expensive products (name and unit price)."
select productname, unitprice from products where unitprice in (
(select max(unitprice) from products), (select min(unitprice) from products));
"4.Get products that cost less than $20."
select * from products where unitprice <= 20.0;

"5.Get products that cost between $15 and $25."
select * from products where unitprice between 15 and 25;

"6.Get products above average price."
select * from products where unitprice >= (select avg(unitprice) from products);

'7.Find the ten most expensive products.'
select * from products order by unitprice desc limit 10;

'8.Get a list of discontinued products (Product ID and name)'
select productid, productname from products where discontinued=1;

'9.Count current and discontinued products.'
select discontinued,count(*) from products group by discontinued;

'10.Find products with less units in stock than the quantity on order.'
select * from products  where unitsinstock < unitsonorder; 

'11.Find the customer who had the highest order amount'
select orders.customerid, order_details.quantity
from orders
join order_details
on orders.orderid=order_details.orderid
order by order_details.quantity desc 
limit 1;

'12.Get orders for a given employee and the according customer'
SELECT employeeid, customerid, orderid FROM orders ORDER BY employeeid, customerid;

'13.Find the hiring age of each employee'
select firstname,lastname,age(hiredate,birthdate) from employees;

