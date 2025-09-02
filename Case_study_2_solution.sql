CREATE TABLE LOCATION5 (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION5 (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


  CREATE TABLE DEPARTMENT5 (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION5(Location_ID)
);


INSERT INTO DEPARTMENT5 (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

	   CREATE TABLE JOB5 (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

CREATE TABLE JOB
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR(20))

INSERT  INTO JOB5 VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')


CREATE TABLE EMPLOYEE50
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE50 VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)

SELECT * FROM LOCATION5
SELECT * FROM Employee50
select * from Department5
Select * from JOB5
---------------------------------------------------------------------------------------------------------------------------------------
--SIMPLE QUERIES: 
--1. List all the employee details.select * from Employee50

--2. List all the department details.
select * from Department5

--3.List all job details
select * from Job5

--4.  List all the locations
select * from LOCATION5

--5. List out the First Name, Last Name, Salary, Commission for all Employees.
select First_Name, Last_Name, Salary, COMM from Employee50

--6. List out the Employee ID, Last Name, Department ID for all employees and alias Employee ID as "ID of the Employee", Last Name as "Name of theEmployee", Department ID as "Dep_id".select 
Employee_ID as ID_of_the_Employee,
Last_Name as Name_of_the_Employee,
Department_ID as Dep_id 
from Employee50

--7. List out the annual salary of the employees with their names only.
select FIRST_NAME, Salary*12 as Annual_Salary
from Employee50
------------------------------------------------------------------------------------------------------------------------------------------
--WHERE Condition:
--1. List the details about "Smith".
select * from Employee50 where Last_Name='Smith'

--2. List out the employees who are working in department 20
select * from Employee50 where Department_id=20

--3. List out the employees who are earning salary between 2000 and 3000.select * from Employee50 where Salary between 2000 and 3000

--4. List out the employees who are working in department 10 or 20.
select * from Employee50 where Department_ID in (10, 20)

--5. Find out the employees who are not working in department 10 or 30.
select * from Employee50 where Department_ID not in (10, 30)

--6. List out the employees whose name starts with 'L'
select * from Employee50 where FIRST_NAME like 'L%'

--7. List out the employees whose name starts with 'L' and ends with 'E'.
select * from Employee50 where  First_Name like 'L%E'

--8. List out the employees whose name length is 4 and start with 'J'
select * from Employee50 where len(First_Name)=4 and First_Name like 'J%'

--9. List out the employees who are working in department 30 and draw the salaries more than 2500.select * from Employee50 where Department_ID=30 and salary>2500

--10. List out the employees who are not receiving commission.
select * from Employee50 where COMM is null

----------------------------------------------------------------------------------------------------------------------------------------
--ORDER BY Clause:
--1. List out the Employee ID and Last Name in ascending order based on the Employee ID.select Employee_ID, Last_Name from Employee50 
ORDER BY EMPLOYEE_ID ASC

--2. List out the Employee ID and Name in descending order based on salary.
select Employee_ID, First_Name, Salary from Employee50 
ORDER BY salary DESC

--3. List out the employee details according to their Last Name in ascending-order.
select * from Employee50 
ORDER BY Last_Name ASC

--4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.select * from Employee50 
ORDER BY Last_Name ASC , Department_ID DESC

------------------------------------------------------------------------------------------------------------------------------------
--GROUP BY and HAVING Clause:
--1. List out the department wise maximum salary, minimum salary and average salary of the employees
select Department_Id , MAX(salary) as Max_Salary, Min(Salary) as Min_Salary, Avg(Salary) as Avg_Salary 
from Employee50 
Group by Department_ID

--2. List out the job wise maximum salary, minimum salary and average salary of the employees.select JOB_ID, MAX(Salary) as Max_Salary, Min(Salary) as Max_Salary, AVG(Salary) as AVG_Salaryfrom Employee50GROUP BY JOB_ID--3. List out the number of employees who joined each month in ascending orderselect  MONTH(Hire_Date) as Month_Joined , COUNT(Employee_ID)  as Number_of_Employeefrom Employee50 GROUP BY MONTH(Hire_Date)ORDER BY Month_Joined ASC--4. List out the number of employees for each month and year in ascending order based on the year and month.select FORMAT(HIRE_DATE, 'yyyy-MM') as HIRE_YEARMONTH,COUNT(Employee_ID) as Number_Employeefrom Employee50GROUP BY FORMAT(HIRE_DATE, 'yyyy-MM')ORDER BY HIRE_YEARMONTH ASC--5. List out the Department ID having at least four employees.select Department_ID, COUNT(*) as count_employeesfrom Employee50 GROUP BY Department_ID HAVING  COUNT(*) >=4--6. How many employees joined in February month.select  MONTH(HIRE_DATE) as month_joined, COUNT(Employee_ID) as count_employeefrom Employee50GROUP BY MONTH(HIRE_DATE) HAVING MONTH(HIRE_DATE) = 2--7. How many employees joined in May or June month.select  MONTH(HIRE_DATE) as month_joined, COUNT(Employee_ID) as count_employeefrom Employee50GROUP BY MONTH(HIRE_DATE) HAVING MONTH(HIRE_DATE) in (5,6)--8. How many employees joined in 1985?select  YEAR(HIRE_DATE) as year_joined, COUNT(Employee_ID) as count_employeefrom Employee50GROUP BY YEAR(HIRE_DATE) HAVING YEAR(HIRE_DATE) = '1985'--9. How many employees joined each month in 1985?select  YEAR(HIRE_DATE) as year_joined, MONTH(HIRE_DATE) AS month_joined,  COUNT(Employee_ID) as count_employeefrom Employee50WHERE YEAR(HIRE_DATE) = 1985GROUP BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)--10. How many employees were joined in April 1985?select  YEAR(HIRE_DATE) as year_joined, MONTH(HIRE_DATE) AS month_joined,  COUNT(Employee_ID) as count_employeefrom Employee50WHERE YEAR(HIRE_DATE) = 1985 and MONTH(HIRE_DATE)=04GROUP BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)--11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?select Department_ID, COUNT(*) AS COUNT_EMPLOYEE,MONTH(HIRE_DATE) AS month_joined, YEAR(HIRE_DATE) AS year_joined from Employee50 where  MONTH(HIRE_DATE)= 04 and YEAR(HIRE_DATE)=1985GROUP BY Department_ID, MONTH(HIRE_DATE),YEAR(HIRE_DATE)HAVING COUNT(*)>=3--------------------------------------------------------------------------------------------------------------------------------------------JOINS:--1. List out employees with their department namesselect E.Employee_ID, D.Namefrom Employee50 as E JOIN DEPARTMENT5 as Don E.Department_ID = D.Department_Id--2. Display employees with their designations.select E.Employee_ID, J.Designationfrom Employee50 as E join JOB5 AS J on E.JOB_ID = J.Job_ID--3. Display the employees with their department names and city.select E.Employee_Id, D.Name, L.City from Employee50 as Ejoin DEPARTMENT5 as D on E.DEPARTMENT_ID=D.Department_Idjoin LOCATION5 as L on L.Location_ID=D.Location_Id--4. How many employees are working in different departments? Display with department names.Select D.Name, COUNT(*) as Employee_count_by_departmentfrom Employee50 as Ejoin  Department5 as D  on E.DEPARTMENT_ID=D.Department_IdGROUP BY D.Name--5. How many employees are working in the sales department?Select D.Name, COUNT(*) as Employee_count_by_departmentfrom Employee50 as Ejoin  Department5 as D  on E.DEPARTMENT_ID=D.Department_IdWHERE D.NAME='Sales'GROUP BY D.Name--6.Which is the department having greater than or equal to 3 employees and display the department names in ascending orderSelect D.Name, COUNT(*) as Employee_count_by_departmentfrom Employee50 as Ejoin  Department5 as D  on E.DEPARTMENT_ID=D.Department_IdGROUP BY D.NameHAVING COUNT(*) > =3--7. How many employees are working in 'Dallas'?select L.City , count(*) AS COUNT_EMPLOYEE fromEmployee50 as Ejoin Department5 as Don E.DEPARTMENT_ID=D.Department_Idjoin LOCATION5 as L on D.Location_Id=L.Location_IDWHERE City='Dallas' GROUP BY L.City--8. Display all employees in sales or operation departments.select E.Employee_ID, D.Namefrom EMPLOYEE50 as Ejoin DEPARTMENT5 as D on E.DEPARTMENT_ID=D.Department_Idwhere D.Name in ('Sales','Operations')------------------------------------------------------------------------------------------------------------------------------------------CONDITIONAL STATEMENT--1. Display the employee details with salary grades. Use conditional statement to create a grade columnselect Employee_ID, First_Name, Last_Name, Salary, CASE   WHEN Salary < 1000 THEN  'Grade A'  WHEN Salary between 1000 and 2000 THEN 'Grade B'  WHEN Salary between 2000 and 3000 THEN 'Grade C'  ELSE 'Grade D' END AS Salary_GradeFROM Employee50--2. List out the number of employees grade wise. Use conditional statement to create a grade column.SELECT 
    CASE
        WHEN Salary < 1000 THEN 'Grade C'
        WHEN Salary BETWEEN 1000 AND 2000 THEN 'Grade B'
        WHEN Salary BETWEEN 2001 AND 3000 THEN 'Grade A'
        ELSE 'Grade S'
    END AS Salary_Grade,
    COUNT(*) AS Number_of_Employees
FROM Employee50
GROUP BY 
    CASE
        WHEN Salary < 1000 THEN 'Grade C'
        WHEN Salary BETWEEN 1000 AND 2000 THEN 'Grade B'
        WHEN Salary BETWEEN 2001 AND 3000 THEN 'Grade A'
        ELSE 'Grade S'
    END
ORDER BY Salary_Grade;
--3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.SELECT 
    CASE
        WHEN Salary < 1000 THEN 'Grade C'
        WHEN Salary BETWEEN 1000 AND 2000 THEN 'Grade B'
        WHEN Salary BETWEEN 2001 AND 3000 THEN 'Grade A'
        ELSE 'Grade S'
    END AS Salary_Grade,
    COUNT(*) AS Number_of_Employees
FROM Employee50
WHERE Salary BETWEEN 2000 AND 5000
GROUP BY 
    CASE
        WHEN Salary < 1000 THEN 'Grade C'
        WHEN Salary BETWEEN 1000 AND 2000 THEN 'Grade B'
        WHEN Salary BETWEEN 2001 AND 3000 THEN 'Grade A'
        ELSE 'Grade S'
    END
ORDER BY Salary_Grade;
-------------------------------------------------------------------------------------------------------------------------------------------SUBQUERIES:--1. Display the employees list who got the maximum salary.select * from Employee50where salary=(select max(salary) from Employee50)--2. Display the employees who are working in the sales department.select * fromEmployee50where Department_ID=(select Department_ID from Department5 where Name='Sales')--3. Display the employees who are working as 'Clerk'.select * from Employee50 where Job_ID =(select Job_ID from JOB5where Designation='CLERK')--4. Display the list of employees who are living in 'Boston'.select * fromEmployee50 as E join Department5 as Don E.DEPARTMENT_ID=d.DEPARTMENT_IDwhere D.Location_Id=(select Location_Id from LOCATION5 where City='Boston')--5. Find out the number of employees working in the sales department.Select count(*) as count_employees_sales from Employee50 where Department_ID = (select Department_Id from Department5 where Name='Sales')--6. Update the salaries of employees who are working as clerks on the basis of 10%.Update Employee50 set salary= (salary *0.10)+salarywhere Job_ID=(select Job_ID from JOB5 where Designation='CLERK')--7. Display the second highest salary drawing employee details.select * from Employee50 where salary=(select max(salary) from Employee50 where salary < (select max(salary) from Employee50)--8. List out the employees who earn more than every employee in department 30.select * from Employee50 where salary > (select max(salary) from Employee50 where Department_ID=30)--9. Find out which department has no employeesselect * from DEPARTMENT5where Department_ID not in (select Distinct Department_Id from Employee50)--10. Find out the employees who earn greater than the average salary for their department.select * from Employee50 where salary > (select avg(salary) from Employee50)













































