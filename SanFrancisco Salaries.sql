create database data_new
use data_new;

-- Show all columns and rows in the table.
select * from salaries;

-- Show only the EmployeeName and JobTitle columns.
select employeename, jobtitle from salaries;

-- Show the number of employees in the table.
select count(*) from salaries;

-- Show the unique job titles in the table.
select distinct(jobtitle) from salaries;

-- Show the job title and overtime pay for all employees with overtime pay greater than 50000.
select jobtitle, overtimepay from salaries where overtimepay>50000;

-- Show the average base pay for all employees. 
select avg(basepay) from salaries;

-- Show the top 10 highest paid employees.
select * from salaries order by totalpay desc limit 10;

-- Show the average of BasePay, OvertimePay, and OtherPay for each employee:
select avg(basepay),avg(overtimepay),avg(otherpay) from salaries;

-- Show all employees who have the word "Manager" in their job title.
select * from salaries where jobtitle like '%Manager%';

-- Show all employees with a job title not equal to "Manager".
select * from salaries where jobtitle not like '%Manager%';

-- Show all employees with a total pay between 50,000 and 75,000.
select * from salaries where totalpay between 50000 and 75000;
select * from salaries where totalpay>=50000 and totalpay<=75000;

-- Show all employees with a base pay less than 50,000 or a total pay greater than 100,000.
select * from salaries where basepay<50000 or totalpay>100000;

-- Show all employees with a total pay benefits value between 125,000 and 150,000 and a job title containing the word "Director".
select * from salaries where totalpaybenefits between 125000 and 150000 and jobtitle like '%Director%';

-- Show all employees ordered by their total pay benefits in descending order.
select * from salaries order by totalpaybenefits desc;

-- Show all job titles with an average base pay of at least 100,000 and order them by the average base pay in descending order.
select jobtitle,avg(basepay) as avgbasepay from salaries group by jobtitle having avg(basepay)>=100000 order by avgbasepay desc;

-- Delete the column notes.
select * from salaries;
alter table salaries drop column notes;
select * from salaries;

-- Update the base pay of all employees with the job title containing "Manager" by increasing it by 10%.
select * from salaries; 
update salaries 
set basepay= basepay*1.1 where jobtitle like '%manager%';
select * from salaries; 

-- Delete all employees who have no OvertimePay.
select count(*) from salaries where overtimepay=0;
delete from salaries where overtimepay=0;
select count(*) from salaries where overtimepay=0;