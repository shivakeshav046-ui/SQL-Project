--  Who are the top 10 customers by lifetime value (LTV)?
use AdventureWorks_Project;
select 
Top 10 
c.CustomerID,
sum(soh.SubTotal) as total_sales
from SalesOrderHeader as soh
left join Customer as c
on soh.CustomerID = c.CustomerID
group by c.CustomerID
order by total_sales desc;
