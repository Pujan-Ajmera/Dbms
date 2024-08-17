--LAB-9
--SUB QUERIES
CREATE TABLE STUDENT_DATA(
	no INT,
	Name VARCHAR(50),
	City VARCHAR(50),
	DID INT
);
INSERT INTO STUDENT_DATA(NO,NAME,CITY,DID) VALUES
(101,'Raju','Rajkot',10),
(102,'Amit','Ahmedabad',20),
(103,'Sanjay','Baroda',40),
(104,'Neha','Rajkot',20),
(105,'Meera','Ahmedabad',30),
(106,'Mahesh','Baroda',10);
CREATE TABLE ACADEMIC(
	Rno INT,
	SPI DECIMAL(3,1),
	Bklog INT
);
INSERT INTO ACADEMIC(Rno,SPI,Bklog) VALUES
(101,8.8,0),
(102,9.2,2),
(103,7.6,1),
(104,8.2,4),
(105,7.0,2),
(106,8.9,3);
CREATE TABLE DEPARTMENT(
	DID INT,
	DName VARCHAR(50)
);
INSERT INTO DEPARTMENT(DID,DNAME) VALUES 
(10,'Computer'),
(20,'Electrical'),
(30,'Mechanical'),
(40,'Civil');
--PART-A
--1 Display details of students who are from computer department
SELECT * FROM STUDENT_DATA WHERE DID=(SELECT DID FROM DEPARTMENT WHERE DNAME='Computer');
--2 Displays name of students whose SPI is more than 8
SELECT Name FROM STUDENT_DATA WHERE no IN(SELECT RNO FROM ACADEMIC WHERE SPI>8)
--3 Display details of students of computer department who belongs to Rajkot city
SELECT * FROM STUDENT_DATA WHERE DID=(SELECT DID FROM DEPARTMENT WHERE DNAME='Computer') AND CITY='Rajkot';
--4 Find total number of students of electrical department
SELECT COUNT(no) FROM STUDENT_DATA WHERE DID=(SELECT DID FROM DEPARTMENT WHERE DNAME='Electrical')
--5 Display name of student who is having maximum SPI.
SELECT NAME FROM STUDENT_DATA WHERE no IN(SELECT RNO FROM ACADEMIC WHERE SPI=(SELECT MAX(SPI) FROM ACADEMIC))
--6 Display details of students having more than 1 backlog.
SELECT * FROM STUDENT_DATA WHERE no IN(SELECT RNO FROM ACADEMIC WHERE Bklog>1);
--PART-B
--1 Display name of students who are either from computer department or from mechanical department
SELECT Name FROM STUDENT_DATA WHERE DID IN(SELECT DID FROM DEPARTMENT WHERE DNAME IN('Computer','Mechanical'));
--2 Display name of students who are in same department as 102 studying in
SELECT Name FROM STUDENT_DATA WHERE DID IN(SELECT DID FROM STUDENT_DATA WHERE no=102);
--PART-C
--1 Display name of students whose SPI is more than 9 and who is from electrical department.
SELECT NAME FROM STUDENT_DATA WHERE no IN(SELECT RNO FROM ACADEMIC WHERE SPI>9) AND DID=(SELECT DID FROM DEPARTMENT WHERE DNAME='Electrical');
--2 Display name of student who is having second highest SPI.
SELECT NAME FROM STUDENT_DATA WHERE no IN(SELECT Rno FROM ACADEMIC WHERE SPI=(SELECT MAX(SPI) FROM ACADEMIC WHERE SPI<(SELECT MAX(SPI) FROM ACADEMIC)))
--3 Display city names whose students branch wise SPI is 9.2
SELECT CITY FROM STUDENT_DATA WHERE no=(SELECT RNO FROM ACADEMIC WHERE SPI=9.2) AND DID IN(SELECT DID FROM DEPARTMENT GROUP BY DID);

--SET OPERATORS
--PART-A
CREATE TABLE COMPUTER(
	RollNo INT,
	Name VARCHAR(50)
);
INSERT INTO COMPUTER(ROLLNO,NAME) VALUES
(101,'Ajay'),
(109,'Haresh'),
(115,'Manish');
CREATE TABLE ELECTRICAL(
	RollNo INT,
	Name VARCHAR(50)
);
INSERT INTO ELECTRICAL(ROLLNO,NAME) VALUES
(105,'Ajay'),
(107,'Mahesh'),
(115,'Manish');

--1 . Display name of students who is either in Computer or in Electrical
SELECT NAME FROM COMPUTER
UNION
SELECT NAME FROM ELECTRICAL;

--2 Display name of students who is either in Computer or in Electrical including duplicate data.
SELECT NAME FROM COMPUTER
UNION ALL
SELECT NAME FROM ELECTRICAL

--3 Display name of students who is in both Computer and Electrical.
SELECT NAME FROM COMPUTER
INTERSECT
SELECT NAME FROM ELECTRICAL

--4 Display name of students who are in Computer but not in Electrical
SELECT NAME FROM COMPUTER
EXCEPT
SELECT NAME FROM ELECTRICAL

--5 Display name of students who are in Electrical but not in Computer
SELECT NAME FROM ELECTRICAL
EXCEPT
SELECT NAME FROM COMPUTER

--6 Display all the details of students who are either in Computer or in Electrical
SELECT * FROM COMPUTER
UNION
SELECT * FROM ELECTRICAL

--7 Display all the details of students who are in both Computer and Electrical.
SELECT * FROM COMPUTER
INTERSECT
SELECT * FROM ELECTRICAL

--PART-B
CREATE TABLE EMP_DATA(
	EID INT,
	Name VARCHAR(50)
);
INSERT INTO EMP_DATA(EID,Name) VALUES
(1,'Ajay'),
(9,'Haresh'),
(5,'Manish')
CREATE TABLE CUSTOMER(
	CID INT,
	Name VARCHAR(50) 
);
INSERT INTO CUSTOMER(CID,Name) VALUES
(5,'Ajay'),
(7,'Mahesh'),
(5,'Manish')

--1 Display name of persons who is either Employee or Customer
SELECT NAME FROM EMP_DATA
UNION 
SELECT NAME FROM CUSTOMER

--2 Display name of persons who is either Employee or Customer including duplicate data.
SELECT NAME FROM EMP_DATA
UNION ALL
SELECT NAME FROM CUSTOMER

--3 Display name of persons who is both Employee as well as Customer
SELECT NAME FROM EMP_DATA
INTERSECT
SELECT NAME FROM CUSTOMER

--4 Display name of persons who are Employee but not Customer.
SELECT NAME FROM EMP_DATA
EXCEPT
SELECT NAME FROM CUSTOMER

--5 Display name of persons who are Customer but not Employee.
SELECT NAME FROM CUSTOMER
EXCEPT
SELECT NAME FROM EMP_DATA

--c
--1. Display name of persons who is either Employee or Customer.
	select * from EMP_DATA union select * from CUSTOMER 
--2. Display name of persons who is either Employee or Customer including duplicate data.
	select * from emp_data union all select * from CUSTOMER
--3. Display name of persons who is both Employee as well as Customer.
	select * from EMP_DATA intersect select * from CUSTOMER
--4. Display name of persons who are Employee but not Customer.
	select * from EMP_DATA except select * from CUSTOMER
--5. Display name of persons who are Customer but not Employee.
	select * from CUSTOMER except select * from EMP_DATA