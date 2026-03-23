--4.

SELECT USERID
FROM s_emp
where id = 23;

--5.
select Employees, dept_id
from (
    SELECT last_name || first_name as Employees, dept_id
from s_emp
where dept_id = 10
union
SELECT last_name || first_name as Employees, dept_id
from s_emp
where dept_id = 50
)
order by Employees DESC;

--6.
SELECT *
from s_emp
where last_name || first_name like '%S%';

--7. 
SELECT USERID,START_DATE
FROM s_emp
where start_date BETWEEN to_date('14-05-1990', 'dd-mm-yyyy') AND to_date('26-05-1991', 'dd-mm-yyyy');

--8.
SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME, SALARY
from s_emp
where salary BETWEEN 1000 AND 2000;

--9. 
select FIRST_NAME || ' ' || LAST_NAME AS "Employee Name", SALARY as "Monthly Salary"
from s_emp 
where dept_id IN (31, 42, 50)
and salary > 1350;

--10. 
select FIRST_NAME || ' ' || LAST_NAME AS "Name", START_DATE
from s_emp
where START_DATE <= to_date('31-12-1990', 'dd-mm-yyyy')
and start_date >= to_date('01-01-1990', 'dd-mm-yyyy');

--11. 
select USERID,FIRST_NAME || ' ' || LAST_NAME AS "Employee Name", SALARY * 1.15 AS "New Salary"
from s_emp;

--12. 
select FIRST_NAME || ' ' || LAST_NAME AS "Employee Name",
         START_DATE,
        next_day(add_months(START_DATE, 6), 'monday') AS "Review Date"
from s_emp;

--13. 
select name
from s_products
where lower(name) like '%ski%';

--14.
SELECT last_name, ROUND(MONTHS_BETWEEN(SYSDATE, start_date)) AS "So_thang_tham_nien"
FROM s_emp
ORDER BY "So_thang_tham_nien" ASC;

--15. 
select count(distinct MANAGER_ID) as "So_nguoi_quan_ly"
from s_emp;

--16.
select max(total) as "Highest", min(total) as "Lowest"
from s_ord;

--17.
select p.name, p.ID, i.QUANTITY as "ORDERED"
from s_product p 
join s_item i on p.id = i.product_id
where i.ORD_ID = 101;

--18.
SELECT c.id, o.id
FROM s_customer c
LEFT JOIN s_ord o ON c.id = o.customer_id
ORDER BY c.id;

--19.
SELECT o.CUSTOMER_ID, i.PRODUCT_ID, i.QUANTITY
from s_ord o
join s_item i on o.id = i.ord_id
where o.total > 100000;