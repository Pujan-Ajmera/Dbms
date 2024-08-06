create table student_info(
	rno int,
	name varchar(50),
	branch varchar(50),
	spi decimal(10,2),
	bklog int
);
drop table student_info

insert into student_info values (101,'raju','ce',8.80,0),(102,'amit','ce',2.20,3),(103,'sanjay','me',1.50,6),(104,'neha','ec',7.65,1),(105,'meera','ee',5.52,2),(106,'mahesh','ec',4.50,3);
select * from student_info
create view personal as select * from student_info
select * from personal

create view student_details as select name,branch,spi from student_info
select * from student_details

create view Academicdata as select RNo, Name, Branch from student_info
select * from Academicdata

create view Student_bklog as select * from student_info where bklog>2
select * from Student_bklog

--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four
--letters.
	create view student_pattern as select rno,name,branch from student_info where name like '____'
	select * from student_pattern
--6. Insert a new record to AcademicData view. (107, Meet, ME)
	insert into Academicdata values (107,'meet','me')
	select * from Academicdata

	insert into Academicdata 
	select 107,'meet','me'

	delete from Academicdata where rno=107
--7. Update the branch of Amit from CE to ME in Student_Details view.
	update student_details set branch = 'me' where name = 'amit' and branch = 'ce'
--8. Delete a student whose roll number is 104 from AcademicData view.
	delete from Academicdata where rno = 104

--Part – B:
--1. Create a view that displays information of all students whose SPI is above 8.5
	create view spi_Det as select * from student_details  where spi>=8.5
	select * from spi_Det
	select * from student_details
--2. Create a view that displays 0 backlog students.
	create view zero_back as select * from student_info where bklog = 0
--3. Create a view Computerview that displays CE branch data only.
	create view computerview as select * from student_info where branch = 'ce'
	select * from computerview

--Part – C:
--1. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.
	create view result_ec as select * from student_info where spi<5 and branch = 'ec'
	select * from result_ec
--2. Update the result of student MAHESH to 4.90 in Result_EC view.
	update result_ec set spi = 4.90 where name='mahesh'
--3. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having
--bklogs more than 5.
	create view stu_bklog as select rno,name,bklog from student_info where name like 'm%' and bklog>=5
--4. Drop Computerview form the database.
drop view computerview