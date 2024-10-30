		-- DML Questions
		-----------------

-- 1. Insert your personal data to the employee table as a new employee in department number 30,
-- SSN = 102672, Superssn = 112233.
		insert into Employee (Fname, Lname, SSN, BDATE, Address, Gender, Salary, Superssn, Dno)
		values ('Aya','Gamal','223394','1985-01-01','15 Ali fahmy St.Giza','M','1800','223344','10');
		#-------------

-- 2. Insert another employee with personal data your friend as new employee in department number 30,
-- SSN = 102660, but don’t enter any value for salary or manager number to him.
		insert into Employee (Fname, Lname, SSN, BDATE, Address, Gender, Dno)
		values ('Hania','Ziad','102760','1985-04-01','15 Ali fahmy St.Giza','M','30');
		#-------------

-- 3. In the department table insert new department called "DEPT IT", with dnum = 100, employee with SSN = 112233 
-- as a manager for this department. The start date for this manager is '1-11-2006'
		insert into department (Dname, DNum, MGRSSN, `MGRStart Date`)
		values ('DEPT IT','100','112233','2006-11-01');
		#-------------

-- 4. Do what is required if you know that : Mrs.Noha Mohamed(SSN=968574) moved to be the manager of the new department 
-- (id = 100), and they give you(use your SSN from question1) her position (Dept. 20 manager):
-- a. First try to update her record in the department table
		Update department set mgrssn = 968574 where dnum = 100;
-- b. Update the department record so you could be department 20 manager.
		Update department set mgrssn = 102672 where dnum =20;
-- c. Update your friend data(entered in question2) to be in your team (supervised by you)
		Update employee set Superssn = 112233 where ssn= 102660;
		#-------------

-- 5. Unfortunately the company ended the contract with Mr. Kamel Mohamed (SSN=223344) so try to delete his data 
-- from your database in case you know that you will be temporarily in his position.
-- Hint:(Check if Mr. Kamel has dependents, works as a department manager, supervises any employees or works 
-- in any projects and handle these cases).
		delete from dependent where essn = 223344;
		Update department set mgrssn = 102672 where mgrssn= 223344;
		Update employee set superssn = 102672 where  superssn = 223344;
        Update works_on set essn = 102672 where essn = 223344;
		#-------------

-- 6. And your salary has been upgraded by 20 present of its last value.
		Update employee set salary = 0.20* salary where ssn =102672;
		#-------------

-- 1. Display all the employees Data.
		select * from employee;
		#-------------

-- 2. Display the employee First name, last name, Salary and Department number.
		select fname, lname, salary, dno 
        from employee;
        #-------------

-- 3. Display all the projects names, locations and the department which is responsible about it.
		select pname , pnumber, dnum
        from project;
        #-------------

-- 4. If you know that the company policy is to pay an annual commission for each employee with specific percent 
-- equals 10% of his/her annual salary .Display each employee full name and his annual commission 
-- in an ANNUAL COMM column (alias).
		select concat(fname , lname) as `Full Name`, 0.10*salary*12 as `ANNUAL COMM `
		from employee;
		#-------------

-- 5. Display the employees Id, name who earns more than 1000 LE monthly.
		select ssn, fname, lname,salary
		from employee
		where salary>1000;
		#-------------
        
-- 6. Display the employees Id, name who earns more than 10000 LE annually. 
		select ssn, fname, lname,salary
		from employee
		where salary*12>10000;
		#-------------
        
-- 7. Display the names and salaries of the female employees 
		select fname , salary, gender
		from employee
		where gender= 'M';
		#-------------
        
-- 8. Display each department id, name which managed by a manager with id equals 968574.
		select *
		from department
		where mgrssn=968574;
		#-------------
        
-- 9. Dispaly the ids, names and locations of  the pojects which controled with department 10.
		select *
		from project 
		where dnum =10;