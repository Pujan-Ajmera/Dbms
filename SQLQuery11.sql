create table STU_INFO(
	rno int,
	name varchar(50),
	branch varchar(50)
);

	insert into  STU_INFO values(101,'raju','ce'),(102,'amit','ce'),(103,'sanjay','me'),(104,'neha','ec'),(105,'meera','ee'),(106,'mahesh','me')

create table result(
	rno int,
	spi decimal(2,1)
);
	
	insert into result values(101,8.8),(102,9.2),(103,7.6),(104,8.2),(105,7.0),(107,8.9)

create table  employee_master(
	employeeno varchar(50),
	name varchar(50),
	managerno varchar(50)
);

	insert into employee_master values('e01','tarun',null),('e02','rohan','e02'),('e03','priya','e01'),('e04','milan','e03'),('e05','jay','e01'),('e06','anjana','e04')\
	select * from employee_master
	select * from result
	select * from STU_INFO

--Part – A:
--1. Combine information from student and result table using cross join or Cartesian product.
	select * from STU_INFO cross join result
--2. Perform inner join on Student and Result tables.
	select * from STU_INFO s inner join result on s.rno = result.rno 
--3. Perform the left outer join on Student and Result tables.
	select * from stu_info left outer join result on stu_info.rno = result.rno
--4. Perform the right outer join on Student and Result tables.
	SELECT * FROM STU_INFO RIGHT OUTER JOIN result ON STU_INFO.RNO = RESULT.RNO
--5. Perform the full outer join on Student and Result tables.
	SELECT * FROM STU_INFO FULL OUTER JOIN result ON STU_INFO.RNO = RESULT.RNO
--6. Display Rno, Name, Branch and SPI of all students.
	select STU_INFO.rno,STU_INFO.name,STU_INFO.branch,result.spi from STU_INFO join result on STU_INFO.RNO = RESULT.RNO
--7. Display Rno, Name, Branch and SPI of CE branch’s student only.
	select STU_INFO.rno,STU_INFO.name,STU_INFO.branch,result.spi from STU_INFO join result on STU_INFO.RNO = RESULT.RNO where STU_INFO.branch = 'ce'
--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
	select STU_INFO.rno,STU_INFO.name,STU_INFO.branch,result.spi from STU_INFO join result on STU_INFO.RNO = RESULT.RNO where not STU_INFO.branch = 'ec'
--9. Display average result of each branch.
	select avg(spi) from STU_INFO join result on STU_INFO.rno = result.rno group by STU_INFO.branch
--10. Display average result of CE and ME branch
	select avg(spi) from STU_INFO join result on STU_INFO.rno = result.rno where branch in ('ce','me') group by STU_INFO.branch 
--Part – B:
--1. Display average result of each branch and sort them in ascending order by SPI.
	select avg(result.spi),branch from STU_INFO join result on STU_INFO.rno = result.rno group by STU_INFO.branch order by avg(spi)
--2. Display highest SPI from each branch and sort them in descending order.	select max(spi),branch from STU_INFO join result on STU_INFO.rno = result.rno group by STU_INFO.branch order by max(spi) desc
--Part – C:
--1. Retrieve the names of employee along with their manager’s name from the Employee table.
		select m.name as manager,e.name as employee from employee_master m inner join employee_master e on m.managerno = e.employeeno