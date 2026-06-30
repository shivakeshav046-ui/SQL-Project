-- What percentage of total revenue comes from the top 20% of customers?
Use AdventureWorks_Project;
DECLARE @top20 INT = (SELECT COUNT(*) * 0.2 FROM Customer);

select 
((select sum(total_sales)
from
	(select  Top (@top20)
	c.CustomerID,
	sum(soh.SubTotal) as total_sales
	from SalesOrderHeader as soh
	left join Customer as c
	on soh.CustomerID = c.CustomerID
	group by c.CustomerID
	order by total_sales desc)t) /sum(soh.subTotal)) * 100  
	as  total_revenue_generated_by_top_20_percent_people
from SalesOrderHeader as soh;
