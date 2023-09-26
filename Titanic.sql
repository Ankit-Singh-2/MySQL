create database titanic_ship
use titanic_ship;

select * from titanic;

-- Show the first 10 rows of the dataset.
select * from titanic limit 10;

-- Find the number of passengers who survived.
select count(survived) from titanic where survived=1;

-- Find the average age of all passengers.
select round(avg(age)) from titanic;

-- Find the number of passengers in each class.
select Pclass,count(*) as no_of_Passenger from titanic group by Pclass;

-- Find the first 10 rows of the dataset sorted by passenger class in descending order.
select * from titanic order by Pclass desc limit 10;

-- Find the number of passengers in each class sorted by class in ascending order.
select Pclass, count(*) as no_of_Passenger from titanic group by Pclass order by Pclass;
select Pclass, count(*) as no_of_Passenger from titanic group by Pclass order by no_of_Passenger asc;

-- Find the average fare paid by passengers in each class.
select Pclass, round(avg(fare),2) from titanic group by Pclass;

-- Find the name of the passenger with the highest fare.
select name,fare from titanic where fare = (select max(fare) from titanic);

-- Find the name of the passenger who had the highest age among the survivors.
select name,age from titanic where survived = 1 and age=(select max(age) from titanic);
select name,age from titanic where age= (select max(age) from titanic where Survived = 1);

-- Find the number of passengers who paid more than the average fare.
select count(*) from titanic where fare>(select avg(fare) from titanic);

-- Find the name of the passenger who had the most parents or children on board.
select * from titanic where Parch=(select max(parch) from titanic);

-- Find the number of male and female passengers who survived, and order the results by sex in ascending order:
select sex,count(*) as total_surviver from titanic where survived = 1 group by sex order by sex;

-- Find the name, age, and fare of the oldest passenger who survived.
select name,age,fare from titanic where survived =1 and age=(select max(age) from titanic);

-- Find the name and age of the youngest female passenger who survived in third class.
select name, age from titanic where sex='female' and pclass=3 and survived=1 
and age=(select min(age) from titanic where sex='female' and pclass=3 and survived=1);

-- Find Number of male and female passengers.
select sex,count(*) from titanic group by sex;

select 
sum(case when Sex = "male" then 1 else 0 end) as no_of_male,
sum(case when Sex = "female" then 1 else 0 end) as no_of_female 
from titanic;

-- Select all passengers who traveled in a cabin that was not shared by other passengers.
select * from titanic where cabin not in 
(select Cabin from titanic group by cabin having count(*) > 1);

