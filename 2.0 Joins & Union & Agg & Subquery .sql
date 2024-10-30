
-- Q1.	Display the Department id, name and id and the name of its manager.
		select d.dnum, d.dname, e.fname, d.mgrssn
		from employee e, department d
		where d.mgrssn=e.ssn;
-----------
-- Q2.	Display the name of the departments and the name of the projects under its control
		select d.dname,p.pname
		from department d,project p
		where d.dnum=p.dnum;
----------
-- Q3.	Display the full data about all the dependence associated with
-- the name of the employee they depend on him/her
		select concat(e.fname,' ',e.lname) as `Their Father`, d.* 
		from dependent d, employee e
		where d.essn=e.ssn;
----------
-- Q4.	Display the full names and gender of all the employees,
-- union with the names and genders of the dependents
		select concat(fname,' ',lname) as `Full Name` , gender
		from employee
		union
		select dependent_name, gender
		from dependent;
---------
-- Q5.	Display the Id, name and location of the projects in Cairo or Alex city
		select pnumber, pname, plocation
		from project 
		where city='Alex' or city= 'Cairo';
----------
-- Q6.	Display the Projects full data of the projects with a name starts with "a" letter
		select * 
		from project
		where pname like 'a_%';
------------
-- Q7.	display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
		select *
		from employee 
		where dno = 30
		and salary between 1000 and 2000;
-------------
-- Q8.	Retrieve the names of all employees in department 20 
-- who work more than or equal to 10 hours per week on "Al Rawdah" project
		select concat(e.fname,' ',e.lname) as `Full Name`, e.dno, w.weekly_hours, p.pname
		from employee e, works_on w, project p
		where e.ssn= w.essn and p.pnumber= w.pno
		and e.dno = 20
		and w.weekly_hours >= 10
		and p.pname= 'Al Rawdah';
------------
		select *
		from employee e join works_on w
		on e.ssn = w.essn
		join project p
		on p.pnumber = w.pno
		where e.dno = 20
		and p.pname = 'Al Rawdah'
		and w.weekly_hours >= 10;
----------
-- Q9.	Find the names of the employees who directly supervised with Amr Omran
		select concat(e.fname,' ',e.lname) as `Full Name`, s.fname as `Supervisor`
		from employee e, employee s
		where e.superssn= s.ssn
		and s.fname= 'Amr' and s.lname='Omran';
----------
-- Q10.	For each project, list the project name 
-- and the total hours per week (for all employees) spent on that project
		select p.pname, sum(w.weekly_hours) as `Total Hours`
		from project p, works_on w
		where p.pnumber = w.pno
		group by p.pname;
---------
-- Q11.	Retrieve the names of all employees and the names of the projects 
-- they are working on, sorted by the project name
		select concat(e.fname,' ',e.lname) as `Full Name`, p.pname
		from employee e, works_on w, project p
		where e.ssn= w.essn and w.pno=p.pnumber
		order by p.pname;
------
-- Q12.	Display all the data of the department which has the smallest employee ID over all employees' ID
		select d. *
		from department d, employee e
		where d.dnum=e.dno
		and e.ssn = (select min(ssn) from employee);
------
-- Q13.	For each department, retrieve the department name and the maximum,
--  minimum and average salary of its employees
		select d.dname, max(salary), min(salary), avg(Salary)
		from department d, employee e
		where d.dnum= e.dno
		group by d.dname;
-------
-- Q14.	List the last name of all managers who have no dependents
		select e.lname
		from employee e, department d
		where d.mgrssn=e.ssn 
		and e.ssn not in (select essn from dependent);
---------------------------
-- Q15.	For each department if its average salary is less than the average salary of all employees
-- display its number, name and number of its employees
		select d.dname, d.dnum, count(ssn) as `Numbers of Employees`
		from employee e, department d
		where e.dno=d.dnum
		group by d.dname, d.dnum
		having avg(e.salary) < (select avg(salary) from employee);
----------------
-- Q16.etrieve a list of employees and the projects they are working on ordered by department 
-- and within each department, ordered alphabetically by last name, first name
		select concat(e.fname,' ',e.lname) as `Full Name`, p.pname
		from employee e, project p, works_on w
		where e.ssn=w.essn and w.pno=p.pnumber
		order by e.dno, e.fname, e.lname;
--------------
-- Q17. For each project located in Cairo City, find the project number,
-- the controlling department name, the department manager’s last name, address, and birthdate.
		select p.dnum, d.dname, e.lname, e.address, e.bdate
		from project p, department d , employee e
		where p.dnum=d.dnum and d.mgrssn=e.ssn
		and p.city='Cairo';