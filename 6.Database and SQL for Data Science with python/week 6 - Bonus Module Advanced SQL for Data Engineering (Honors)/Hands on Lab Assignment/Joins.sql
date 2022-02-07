-- Problem: 1 Select the names and job start dates of all employees who work for the department number 5. --
use student_info

select E.F_NAME,E.L_NAME, JH.START_DATE 
from EMPLOYEES as E 
INNER JOIN JOB_HISTORY as JH on E.EMP_ID=JH.EMPL_ID 
where E.DEP_ID ='5';

-- Problem: 2 Select the names, job start dates, and job titles of all employees who work for the department number 5. --
select E.F_NAME,E.L_NAME, JH.START_DATE, J.JOB_TITLE 
from EMPLOYEES as E 
INNER JOIN JOB_HISTORY as JH on E.EMP_ID=JH.EMPL_ID 
INNER JOIN JOBS as J on E.JOB_ID=J.JOB_IDENT
where E.DEP_ID ='5';

 -- Problem: 3 Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT tables and select employee id, last name, department id and department name for all employees. --
 select E.EMP_ID,E.L_NAME,E.DEP_ID,D.DEP_NAME
from EMPLOYEES AS E 
LEFT OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP;

-- Problem: 4 Re-write the previous query but limit the result set to include only the rows for employees born before 1980.
select E.EMP_ID,E.L_NAME,E.DEP_ID,D.DEP_NAME
from EMPLOYEES AS E 
LEFT OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP 
where YEAR(E.B_DATE) < 1980;

-- Problem: 5 Re-write the previous query but have the result set include all the employees but department names for only the employees who were born before 1980. --
select E.EMP_ID,E.L_NAME,E.DEP_ID,D.DEP_NAME
from EMPLOYEES AS E 
LEFT OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP 
AND YEAR(E.B_DATE) < 1980;

-- Problem: 6 Perform a Full Join on the EMPLOYEES and DEPARTMENT tables and select the First name, Last name and Department name of all employees. --
select EMPLOYEES.F_NAME,EMPLOYEES.L_NAME,DEPARTMENTS.DEP_NAME 
from EMPLOYEES
FULL JOIN  DEPARTMENTS 
ON EMPLOYEES.DEP_ID = DEPARTMENTS.DEPT_ID_DEP;



-- Problem: 7 Re-write the previous query but have the result set include all employee names but department id and department names only for male employees. --

select E.F_NAME,E.L_NAME,D.DEPT_ID_DEP, D.DEP_NAME
from EMPLOYEES AS E 
FULL JOIN  DEPARTMENTS  AS D ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M';