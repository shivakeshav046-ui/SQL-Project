-- Which products has low sales in the top category 
use AdventureWorks_Project;
select 
p.Name , sum(sod.LineTotal) as sales_by_product
from SalesOrderDetail as sod 
left join Product as p
on sod.ProductID = p.ProductID
left join ProductSubcategory as ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID
where ProductCategoryID = 1
group by p.Name
order by sum(sod.LineTotal) asc 