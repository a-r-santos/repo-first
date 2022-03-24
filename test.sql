mysql -u root
create database COMPANY;
show database;
use company;

create table EMPLOYEE (
     Fname VARCHAR(50),
     Minit CHAR(1),
     Lname VARCHAR(50),
     Ssn int NOT NULL PRIMARY KEY,
     Bdate DATE,
     Address VARCHAR(100),
     Sex CHAR(1),
     Salary  FLOAT(16,4),
     Super_ssn int,
     Dno int
     );
describe employee;

create table DEPARTMENT (
     Dname VARCHAR(50),
     Dnumber int NOT NULL PRIMARY KEY,
     Mgr_ssn int,
     Mgr_start_date DATE
     );
describe department;

create table DEPT_LOCATIONS (
     Dnumber int NOT NULL REFERENCES DEPARTMENT(Dnumber),
     Dlocation VARCHAR(50)
     );
describe dept_locations;

create table PROJECT (
     Pname VARCHAR(50),
     Pnumber int NOT NULL PRIMARY KEY,
     Plocation VARCHAR(50),
     Dnum int REFERENCES DEPARTMENT(Dnumber)
     );
describe project;

create table WORKS_ON (
     Essn int  REFERENCES DEPARTMENT(Dnumber),
     Pno int REFERENCES PROJECT(Pnumberr),
     Hours FLOAT(6,2)
     );
describe works_on;

create table DEPENDENT (
     Essn int REFERENCES EMPLOYEE(Ssn),
     Dependent_name VARCHAR(50),
     Sex CHAR(1),
     Bdate DATE,
     Relationship VARCHAR(50)
     );
describe dependent;

INSERT INTO EMPLOYEE VALUES ('John', 'B', 'Smith', 123456789, '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5),
 ('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5),
 ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4),
 ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4),
 ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5),
 ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5),
 ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4),
 ('James', 'E', 'Borg', 888665555, '1937-11-10', '459 Stone, Houston, TX', 'M', 55000, NULL, 1);
select * from employee;

INSERT INTO DEPARTMENT VALUES ('Research', 5, 333445555, '1988-05-22'),
 ('Administration', 4, 987654321, '1995-01-01'),
 ('Headquarters', 1, 888665555, '1981-06-19');
select * from department;

INSERT INTO DEPT_LOCATIONS VALUES (1, 'Houston'),
 (4, 'Stafford'),
 (5, 'Bellaire'),
 (5, 'Sugarland'),
 (5, 'Houston');
select * from dept_locations;

INSERT INTO PROJECT VALUES ('ProductX', '1', 'Bellaire', '5'),
 ('ProductY', '2', 'Sugarland', '5'),
 ('ProductZ', '3', 'Houston', '5'),
 ('Computerization', '10', 'Stafford', '4'),
 ('Reorganization', '20', 'Houston', '1'),
 ('Newbenefits', '30', 'Stafford', '4');
select * from project;

INSERT INTO WORKS_ON VALUES (123456789, 1, 32.5),
 (123456789, 2, 7.5),
 (666884444, 3, 40.0),
 (453453453, 1, 20.0),
 (453453453, 2, 20.0),
 (333445555, 2, 10.0),
 (333445555, 3, 10.0),
 (333445555, 10, 10.0),
 (333445555, 20, 10.0),
 (999887777, 30, 30.0),
 (999887777, 10, 10.0),
 (987987987, 10, 35.0),
 (987987987, 30, 5.0),
 (987654321, 30, 20.0),
 (987654321, 20, 15.0),
 (888665555, 20, null);
select * from works_on;

INSERT INTO DEPENDENT VALUES (333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
 (333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
 (333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
 (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
 (123456789, 'Micheal', 'M', '1988-01-04', 'Son'),
 (123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
 (123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');
select * from dependent;