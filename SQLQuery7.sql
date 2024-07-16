create table EMP(
EID int,
EName varchar(50),
Department varchar(30),
Salary decimal(8,2),
JoiningDate datetime,
City varchar(20)
);

insert into EMP(EID,EName,Department,Salary,JoiningDate,City) values
(101,'Rahul','Admin',56000,'1-Jan-90','Rajkot'),
(102,'Hardik','IT',18000,'25-Sep-90','Ahmedabad'),
(103,'Bhavin','HR',25000,'14-May-91','Baroda'),
(104,'Bhoomi','Admin',39000,'8-Feb-91','Rajkot'),
(105,'Rohit','IT',17000,'23-Jul-90','Jamnagar'),
(106,'Priya','IT',9000,'18-Oct-90','Ahmedabad'),
(107,'Bhoomi','HR',34000,'25-Dec-91','Rajkot')

select * from EMP;

--PART-A

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
	
select max(Salary) as [Highest], min(Salary) as [Lowest] from EMP;

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,
--respectively.
	

select sum(Salary) as Total_Sal,avg(Salary) as Average_Sal from EMP;

--3. Find total number of employees of EMPLOYEE table.


select count(*) as total_Employees from EMP;

--4. Find highest salary from Rajkot city.


select max(Salary) as Highest_Sal from EMP where city='Rajkot';

--5. Give maximum salary from IT department.


select max(Salary) as Max_Sal from EMP where Department='IT';

--6. Count employee whose joining date is after 8-feb-91.

select count(EID)  "Total_Emp" from EMP where JoiningDate > '8-Feb-91';

--7. Display average salary of Admin department.
select city,max(salary) mx from emp group by city having city = 'rajkot' 

select avg(Salary) as Avg_Salary from EMP where Department='Admin';

--8. Display total salary of HR department.


select sum(Salary) as Total_Sal from EMP where Department='HR';

--9. Count total number of cities of employee without duplication.
select count(distinct City) as Total_City from EMP;

--10. Count unique departments.
select count(distinct Department)as Unique_Dept from EMP;

--11. Give minimum salary of employee who belongs to Ahmedabad.
select min(Salary) as Min_Sal from EMP where City='Ahmedabad';

--12. Find city wise highest salary.
select City,max(Salary) as Max_Sal from EMP group by City;

--13. Find department wise lowest salary.
select Department,min(Salary) as Min_Sal from EMP group by Department;

--14. Display city with the total number of employees belonging to each city.
select City,count(EID) as Total_Emp from EMP group by City;

--15. Give total salary of each department of EMP table.
select Department,sum(Salary) as Total_Sal from EMP group by Department;

--16. Give average salary of each department of EMP table without displaying the respective department.
select avg(Salary) as Avg_Sal from EMP group by Department;


--PART-B

--1. Count the number of employees living in Rajkot.
select count(EID) as Total_Emp from EMP where City='Rajkot'; 

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
select max(Salary)-min(Salary) as 'DIFERENCE' from EMP;

--3. Display the total number of employees hired before 1st January, 1991.
select count(EID) as Total_Emp from EMP where JoiningDate < '1-Jan-1991';


--c
--1. Count the number of employees living in Rajkot or Baroda.
	select count(eid) from emp where city='rajkot' or city ='baroda'

--2. Display the total number of employees hired before 1st January, 1991 in IT department.
	select count(eid) from emp where JoiningDate < '1-1-1991' and Department = 'it'

--3. Find the Joining Date wise Total Salaries.
	select JoiningDate,sum(salary) from emp group by JoiningDate
--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.	select max(salary) from emp group by city having city like 'r%'

	select max(salary),Department from emp group by Department,ename  
	select avg(salary),city  from emp group by city
