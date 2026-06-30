-- Overview
use adventureworks_project;
select
count(*) as total_orders,
round(sum(subTotal),2) as total_sales,
round(avg(subTotal),2) as average_order_value
from SalesOrderHeader;

select count(*) as total_products from Product;
select count(*) as  total_customers from Customer;

select 
sum(((sod.UnitPrice*(1 - sod.UnitPriceDiscount))
- p.StandardCost)*sod.OrderQty)
as total_profit
from 
SalesOrderDetail as sod
left join product as p
on sod.ProductID = p.ProductID;
