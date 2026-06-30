-- Which product subcategories have high sales but low profit margins
use AdventureWorks_Project;

select 
ps.Name,
(sum(sod.LineTotal)) as sales,
sum((sod.UnitPrice * (1 - sod.UnitPriceDiscount) - p.StandardCost) * sod.OrderQty) as profit,
(sum(sod.LineTotal))/ sum((sod.UnitPrice * (1 - sod.UnitPriceDiscount)
	- p.StandardCost) * sod.OrderQty) as profit_margin
from SalesOrderDetail as sod 
left join Product as p
on sod.ProductID = p.ProductID
left join ProductSubcategory as ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID
group by ps.Name
-- having sum((sod.UnitPrice * (1 - sod.UnitPriceDiscount) - p.StandardCost) * sod.OrderQty) < 0
order by sales desc;