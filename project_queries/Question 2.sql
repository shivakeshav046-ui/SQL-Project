--  Which product categories generate the highest revenue and profit?
use AdventureWorks_Project;
select
pc.Name,
sum(sod.UnitPrice * (1 - sod.UnitPriceDiscount)* 
sod.OrderQty) as total_sales,
sum((sod.UnitPrice * (1 - sod.UnitPriceDiscount) - p.StandardCost) * 
sod.OrderQty) as total_profit,
sum((sod.UnitPrice * (1 - sod.UnitPriceDiscount) - p.StandardCost) * 
sod.OrderQty)
/sum(sod.UnitPrice * (1 - sod.UnitPriceDiscount) * sod.OrderQty)*100 as margin 
from SalesOrderDetail as sod
inner join Product as p on sod.ProductID = p.ProductID
inner join ProductSubcategory as ps on p.ProductSubcategoryID = ps.ProductSubcategoryID
inner join ProductCategory as pc on ps.ProductCategoryID = pc.ProductCategoryID
group by pc.Name
order by total_sales desc; 