-- How has monthly revenue changed over time and where are the major growth or decline periods
use AdventureWorks_Project;

select 
year(orderDate) as year_,
month(orderDate) as month_,
sum(subTotal) as total_sales
from SalesOrderHeader
group by year(orderDate),month(orderDate)
order by year_ asc, month_ asc;