create table sales_data(
Region varchar(50),
Product varchar(50),
Sales_Amount int,
Year int
);
select * from sales_data
insert into sales_data values('North America','Watch', 1500 , 2023);
insert into sales_data values('Europe','Mobile', 1200, 2023);
insert into sales_data values('Asia', 'Watch',1800, 2023);
insert into sales_data values('North America','TV', 900 ,2024);
insert into sales_data values('Europe' ,'Watch', 2000, 2024);
insert into sales_data values('Asia', 'Mobile', 1000, 2024);
insert into sales_data values('North America', 'Mobile', 1600, 2023);
insert into sales_data values('Europe', 'TV', 1500 ,2023);
insert into sales_data values('Asia', 'TV',  1100, 2024);
insert into sales_data values('North America' ,'Watch', 1700, 2024);

select * from sales_data
--a 
--1. Display Total Sales Amount by Region.
	select sum(Sales_Amount) from sales_data group by Region

--2. Display Average Sales Amount by Product

	select avg(Sales_Amount) from sales_data group by Product
--3. Display Maximum Sales Amount by Year
	
	select max(sales_amount) from sales_data  group by year
--4. Display Minimum Sales Amount by Region and Year
	
	select year,region, min(sales_amount) from sales_data  group by year,Region
--5. Count of Products Sold by Region
	
	select count(Product) from sales_data group by Region
--6. Display Sales Amount by Year and Product

	select year,product,count(Sales_Amount) from sales_data group by year,Product
--7. Display Regions with Total Sales Greater Than 5000

	select Region,sum(Sales_Amount) from sales_data group by Region having sum(Sales_Amount) > 5000
--8. Display Products with Average Sales Less Than 10000
	
	select product,avg(Sales_Amount) from sales_data group by Product having avg(Sales_Amount) < 10000
--9. Display Years with Maximum Sales Exceeding 500
	select year,max(sales_amount) from sales_data group by year having maX(Sales_Amount)>500
--10. Display Regions with at Least 3 Distinct Products Sold.
	select region,count(distinct product) from sales_data group by region having count(distinct product) >= 3
--11. Display Years with Minimum Sales Less Than 1000
	select year,min(Sales_Amount) from sales_data group by year
--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount
	select sum(sales_amount) from sales_data where year = 2023 group by Region 
	
----b
--1. Display Count of Orders by Year and Region, Sorted by Year and Region
	select year,region, count(product) from sales_data group by year,Region order by year,region

--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region
	select  Region,max(Sales_Amount) from sales_data group by year,region having max(sales_amount)>1000 order by Region
--3. Display Years with Total Sales Amount Less Than 1000, Sorted by Year Descending
	select year,sum(Sales_Amount) from sales_data group by year having sum(Sales_Amount)<1000 order by year desc 
--4. Display Top 3 Regions by Total Sales Amount in Year 2024