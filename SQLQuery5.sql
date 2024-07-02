-- lab4 a

--1. Add two more columns City VARCHAR (20) and Pincode INT.
		alter table deposit
		add City varchar(20),Pincode int
		select * from DEPOSIT

--2. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).
		alter table deposit
		alter column cname varchar(35)
		select * from DEPOSIT
--3. Change the data type DECIMAL to INT in amount Column.
		alter table deposit
		alter column amount int
		select * from DEPOSIT

--4. Rename Column ActNo to ANO.
	sp_rename 'deposit.actno', 'Ano'
	select * from DEPOSIT

--5. Delete Column City from the DEPOSIT table.
	alter table deposit
	drop  column City
	select * from DEPOSIT
--6. Change name of table DEPOSIT to DEPOSIT_DETAIL.		sp_rename 'deposit','DEPOSIT_DETAIL'		select * from DEPOSIT_detail		--b		--1 Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
			sp_rename 'DEPOSIT_DETAIL.adate','AOPENDATE'
		--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
			alter table deposit_detail
			drop column aopendate
			select * from DEPOSIT_detail
		--3. Rename Column CNAME to CustomerName.		sp_rename 'DEPOSIT_detail.cname','CustomerName'		--C
		
		CREATE TABLE STUDENT_DETAIL(
			Enrollment_No VARCHAR(20),
			Name VARCHAR(20),
			CPI decimal(5,2),
			Birthdate  Datetime
		);
		--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).
			alter table student_detail
			add City varchar(20) not null default 'rajkot', Backlog int null
			select * from STUDENT_DETAIL
		--	2. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).
			alter table	student_detail
			alter column name varchar(35)
		--	3. Change the data type DECIMAL to INT in CPI Column.
			alter table student_detail
			alter column cpi int
		--	4. Rename Column Enrollment_No to ENO.
			sp_rename 'student_detail.enrollment_no','ENO'
		--	5. Delete Column City from the student_detail table.
			alter table student_detail drop column City			alter table student_detail drop column cpi			alter table student_detail alter column city varchar(25) null		--	6. Change name of table student_detail to STUDENT_MASTER.				sp_Rename 'student_detail','STUDENT_MASTER'				SELECT * FROM STUDENT_MASTER		 --DELETE, Truncate, Drop Operation		 --A		--1. Delete all the records of DEPOSIT_DETAIL table having amount greater than and equals to 4000.
			DELETE FROM DEPOSIT_DETAIL WHERE AMOUNT>=4000
			select * from DEPOSIT_detail
		--2. Delete all the accounts CHANDI BRANCH.
			DELETE FROM DEPOSIT_DETAIL 
		--3. Delete all the accounts having account number (ANO) is greater than 105.
			DELETE FROM DEPOSIT_DETAIL WHERE ANO>105
		--4. Delete all the records of Deposit_Detail table. (Use Truncate)
			TRUNCATE TABLE DEPOSIT_DETAIL

		--5. Remove Deposit_Detail table. (Use Drop)		DROP TABLE Deposit_Detail		SELECT * FROM Deposit_Detail		--PART-B
CREATE TABLE EMPLOYEE_MASTER(
	EMPNO INT,
	EMPNAME VARCHAR(25),
	JOININGDATE DATETIME,
	SALARY DECIMAL(8,2),
	CITY VARCHAR(20)
);
INSERT INTO EMPLOYEE_MASTER(EMPNO,EMPNAME,JOININGDATE,SALARY,CITY) VALUES 
(101,'KEYUR','2002-01-05',12000.00,'RAJKOT'),
(102,'HARDIK','2004-02-15',14000.00,'AHMEDABAD'),
(103,'KAJAL','2006-03-14',15000.00,'BARODA'),
(104,'BHOOMI','2005-06-23',12500.00,'AHMEDABAD'),
(105,'HARMIT','2004-02-15',14000.00,'RAJKOT'),
(106,'MITESH','2001-09-25',5000.00,'JAMNAGAR'),
(107,'MEERA',NULL,7000.00,'MORBI'),
(108,'KISHAN','2003-02-06',10000.00,NULL);

--1 Delete all the records of Employee_MASTER table having salary greater than and equals to 14000. 
DELETE FROM EMPLOYEE_MASTER
WHERE SALARY>=14000;
--2 Delete all the Employees who belongs to ‘RAJKOT’ city
DELETE FROM EMPLOYEE_MASTER
WHERE CITY='RAJKOT';
--3 Delete all the Employees who joined after 1-1-2007
DELETE FROM EMPLOYEE_MASTER
WHERE JOININGDATE>'2007-01-01';
--4 Delete the records of Employees whose joining date is null and Name is not null.
DELETE FROM EMPLOYEE_MASTER
WHERE JOININGDATE IS NULL AND EMPNAME IS NOT NULL;
--5 Delete the records of Employees whose salary is 50% of 20000
DELETE FROM EMPLOYEE_MASTER
WHERE SALARY = 0.5*20000;
--6 Delete the records of Employees whose City Name is not empty
DELETE FROM EMPLOYEE_MASTER
WHERE CITY IS NOT NULL;
--7 Delete all the records of Employee_MASTER table. (Use Truncate)
TRUNCATE TABLE EMPLOYEE_MASTER;
--8 Remove Employee_MASTER table. (Use Drop)
DROP TABLE EMPLOYEE_MASTER;		