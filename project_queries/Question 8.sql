-- Which customer segments generate the highest average order value
use AdventureWorks_Project;
select 
c.CustomerSegment, 
AVG(soh.SubTotal) as average_order_value
from SalesOrderHeader as soh
left join Customer as c
on soh.CustomerID = c.CustomerID
group by c.CustomerSegment ;