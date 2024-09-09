CREATE TABLE Dept (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);

CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT NULL,
    Salary DECIMAL(8, 2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Dept(DepartmentID)
);

INSERT INTO Dept (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');

INSERT INTO Person (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');

-- part A
--1. Find all persons with their department name & code.
	select person.Personname ,dept.DepartmentCode from person join dept on person.DepartmentID = dept.DepartmentID
--2. Find the person's name whose department is in C-Block.
	select person.Personname ,dept.DepartmentCode from person join dept on person.DepartmentID = dept.DepartmentID where dept.location = 'c-block'
--3. Retrieve person name, salary & department name who belongs to Jamnagar city.
	select person.Personname ,dept.Departmentname, person.salary from person join dept on person.DepartmentID = dept.DepartmentID where person.City = 'jamnagar'
--4. Retrieve person name, salary & department name who does not belong to Rajkot city.
	select person.Personname ,person.Salary ,dept.Departmentname from person join dept on person.DepartmentID = dept.DepartmentID where not person.city = 'rajkot'
--5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001.
	select person.Personname from person join dept on person.DepartmentID = dept.DepartmentID where Person.JoiningDate>'1-Aug-2001' and dept.Departmentname = 'civil'
--6. Find details of all persons who belong to the computer department.
select * from person join dept on person.DepartmentID = dept.DepartmentID where dept.Departmentname = 'computer'

--7. Display all the person's name with the department whose joining date difference with the current date
--is more than 365 days.
	select * from person join dept on person.DepartmentID = dept.DepartmentID where DATEDIFF(day,person.joiningdate,getdate())>365
--8. Find department wise person counts.
	select count(person.personid) from person join dept on person.DepartmentID = dept.DepartmentID group by dept.DepartmentName
--9. Give department wise maximum & minimum salary with department name.
	select max(salary), min(salary), dept.Departmentname from person join dept on person.DepartmentID = dept.DepartmentID group by dept.DepartmentName
--10. Find city wise total, average, maximum and minimum salary.
	select max(salary), min(salary),sum(salary) ,person.city from person join dept on person.DepartmentID = dept.DepartmentID group by person.city
--11. Find the average salary of a person who belongs to Ahmedabad city.
select avg(salary) from person join dept on person.DepartmentID = dept.DepartmentID where person.City = 'ahmedabad'
--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In
--single column)
	select person.Personname + 'lives in ' + person.city from person
	

	
