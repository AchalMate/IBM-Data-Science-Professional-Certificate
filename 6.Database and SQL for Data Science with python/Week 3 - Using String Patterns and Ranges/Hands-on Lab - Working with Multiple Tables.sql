CREATE DATABASE SQL_PRATICE
-- ----------------------------------------
-- DDL statement for table 'HR' database--
-- ------------------------------------------

-- Drop the tables in case they exist ---------

DROP TABLE EMPLOYEES;
DROP TABLE JOB_HISTORY;
DROP TABLE JOBS;
DROP TABLE DEPARTMENTS;
DROP TABLE LOCATIONS;

-- Create the tables -- 

CREATE TABLE EMPLOYEES (
                          EMP_ID CHAR(9) NOT NULL,
                          F_NAME VARCHAR(15) NOT NULL,
                          L_NAME VARCHAR(15) NOT NULL,
                          SSN CHAR(9),
                          B_DATE DATE,
                          SEX CHAR,
                          ADDRESS VARCHAR(30),
                          JOB_ID CHAR(9),
                          SALARY DECIMAL(10,2),
                          MANAGER_ID CHAR(9),
                          DEP_ID CHAR(9) NOT NULL,
                          PRIMARY KEY (EMP_ID)
                        );

CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL,
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID)
                          );

CREATE TABLE JOBS (
                    JOB_IDENT CHAR(9) NOT NULL,
                    JOB_TITLE VARCHAR(15) ,
                    MIN_SALARY DECIMAL(10,2),
                    MAX_SALARY DECIMAL(10,2),
                    PRIMARY KEY (JOB_IDENT)
                  );

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL,
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP)
                          );

CREATE TABLE LOCATIONS (
                          LOCT_ID CHAR(9) NOT NULL,
                          DEP_ID_LOC CHAR(9) NOT NULL,
                          PRIMARY KEY (LOCT_ID,DEP_ID_LOC)
                        );
                        
 /*----------------------------------------------------------*/                       
----- Exercise 1: Accessing Multiple Tables with Sub-Queries
----- Problem: 1 Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.

select * from employees where JOB_ID IN (select JOB_IDENT from jobs);

----- Problem: 2 Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.

select * from employees where JOB_ID IN (select JOB_IDENT from jobs where JOB_TITLE= 'Jr. Designer');

----- Problem: 3 Retrieve JOB information and who earn more than $70,000.

select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from jobs where JOB_IDENT IN (select JOB_ID from employees where SALARY > 70000 );


----- Problem: 4 Retrieve JOB information and whose birth year is after 1976.

select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from jobs where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 );

----- Problem: 5 Retrieve JOB information for female employees whose birth year is after 1976.

select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from jobs where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 and SEX='F' );

----- Exercise 2: Accessing Multiple Tables with Implicit Joins
----- Problem: 1 Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.

select * from employees, jobs;

----- Problem: 2 Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.

select * from employees, jobs where employees.JOB_ID = jobs.JOB_IDENT;

----- Problem: 3 Redo the previous query, using shorter aliases for table names.

select * from employees E, jobs J where E.JOB_ID = J.JOB_IDENT;

----- Problem: 4 Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.

select EMP_ID,F_NAME,L_NAME, JOB_TITLE from employees E, jobs J where E.JOB_ID = J.JOB_IDENT;

----- Problem: 5 Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.

select E.EMP_ID,E.F_NAME,E.L_NAME, J.JOB_TITLE from employees E, jobs J where E.JOB_ID = J.JOB_IDENT;

