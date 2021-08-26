create view country_product_revenue as
select  pd.productname, cat.categoryName,
o.shipCountry,
SUM(od.unitPrice*od.quantity) as revenue, od.unitPrice, od.quantity,
ctr.code
from categories cat
join  products pd on pd.categoryID=cat.categoryID 
join order_details od on od.productID=pd.productID
join orders o on o.orderID=od.orderID
join countries ctr on ctr.country=o.shipCountry
group by pd.productname, cat.categoryName,o.shipCountry, od.unitPrice, od.quantity,ctr.code;



create view employee_revenue_order as
select emp.firstName, emp.lastName, emp.title, 
DATE_PART('year',AGE(emp.hiredate, emp.birthdate)) AS hiring_age,
cus.companyName,
SUM(od.unitPrice*od.quantity) as revenue_per_employee,
o.orderID  
FROM orders o 
JOIN employees emp ON o.employeeid=emp.employeeid 
JOIN order_details od ON od.orderid=o.orderid 
JOIN customers cus on o.customerID=cus.customerID
group by emp.firstName, emp.lastName, emp.title, hiring_age, cus.companyName,o.orderid;


create view sales as select orders.orderid, SUM(order_details.unitPrice*order_details.quantity) as revenue, orders.orderdate
from order_details
join orders on orders.orderid=order_details.orderid
group by orders.orderdate, orders.orderid  order by orders.orderdate;


create view best_product as select pd.productName, SUM(od.quantity*od.unitprice),o.orderid
from products pd
join order_details od on od.productid=pd.productid join orders o on o.orderid=od.orderid group by pd.productName,o.orderid order by o.orderid;



create view shippers_data as select sh.companyname, o.orderid, 
DATE_PART('day',AGE(o.shippedDate, o.orderdate)) as shipping_time
from orders o
join shippers sh on sh.shipperid=o.shipVia ;


create view discount as select emp.lastName,
SUM(od.unitPrice*od.quantity) as revenue,
SUM(od.unitPrice*od.discount*od.quantity) as discount
FROM orders o 
JOIN employees emp ON o.employeeid=emp.employeeid 
JOIN order_details od ON od.orderid=o.orderid 
group by  emp.lastName;

select productname, unitsinstock, unitsonorder
from products  
where unitsinstock < unitsonorder; 


create view country_product_revenue_new as
select cat.categoryName,
o.shipCountry,
SUM(od.unitPrice*od.quantity) as revenue
from categories cat
join  products pd on pd.categoryID=cat.categoryID 
join order_details od on od.productID=pd.productID
join orders o on o.orderID=od.orderID
group by cat.categoryName,o.shipCountry


select  cat.categoryName,
o.shipCountry,
SUM(od.unitPrice*od.quantity) as revenue
from categories cat
join  products pd on pd.categoryID=cat.categoryID 
join order_details od on od.productID=pd.productID
join orders o on o.orderID=od.orderID
group by cat.categoryName,o.shipCountry;


create view suppliers data as select sp.companyName,
o.orderid,
SUM(od.unitPrice*od.quantity) as sales
from suppliers sp
join  products pd on pd.supplierID=sp.supplierID 
join order_details od on od.productID=pd.productID join orders o on o.orderid=od.orderid group by sp.companyName, o.orderid ;