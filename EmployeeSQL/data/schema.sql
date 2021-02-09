--Create database
CREATE DATABASE sql_homework;

-- Drop tables if they already exist
DROP TABLE dept_emp, departments, dept_manager, employees, salaries, titles

--Create tables corresponding to .csv files

--Departments table lists department number and name. 
--Department number is unique and designated as PK. 
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no));

--The titles table lists title id and name. 
--Title id is designated as primary key.
CREATE TABLE titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    PRIMARY KEY (title_id));
	 
--Employees table lists all employees and their personal information. 
--Employee number is unique and designated as PK.
--Title id is not unique and is a foreign key to the titles table.
CREATE TABLE employees (
    emp_no INTEGER NOT NULL,
    emp_title VARCHAR NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id),
    birthdate VARCHAR NOT NULL,
    firstname VARCHAR NOT NULL,
    lastname VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date VARCHAR NOT NULL,
    PRIMARY KEY (emp_no));	

--dept_emp lists employees and their departments.
--Employee number is not necessarily unique as one employee could belong to two or more departments.
--Department number is not unique as there are multiple employees in a single department.
--Employee number and department number are foreign keys.
CREATE TABLE dept_emp(
    emp_no INTEGER NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    dept_no VARCHAR NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no));
	
--The dept_manager table is a junction table that lists manager employee numbers and associated departments.
--The combination of dept_no and emp_no is unique and is listed as the primary key.
--Single departments have multiple managers.
CREATE TABLE dept_manager(
    dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no, emp_no));

--The salaries table lists employee numbers and their salaries.
--Employee number is a foreign key but could also be considered a primary key as it is unique in this table.
CREATE TABLE salaries(
    emp_no INTEGER NOT NULL,
    salary INTEGER   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

--Copy csv files into created tables, ignore if using pgAdmin to import csvs separately
COPY departments(dept_no, dept_name)
FROM 'C:\<copy path here>\data\departments.csv'
DELIMITER ','
CSV HEADER;

COPY titles(title_id, title)
FROM 'C:\<copy path here>\data\titles.csv'
DELIMITER ','
CSV HEADER;

COPY employees(emp_no, emp_title, birthdate, firstname, lastname, sex, hire_date)
FROM 'C:\<copy path here>\data\employees.csv'
DELIMITER ','
CSV HEADER;

COPY dept_emp(emp_no, dept_no)
FROM 'C:\<copy path here>\data\dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY dept_manager(dept_no, emp_no)
FROM 'C:\<copy path here>\dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY salaries(emp_no, salary)
FROM 'C:\<copy path here>\data\salaries.csv'
DELIMITER ','
CSV HEADER;

