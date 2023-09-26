create database cars
use cars;

-- Read Data 
select * from car_dekho;

-- Count total no of cars 
select count(*) from car_dekho;

-- Manager asked the employee how many cars will be available in 2023?
select count(*) from car_dekho where year = 2023;

-- Manager asked the employee how many cars will be available in 2020,2021,2022?
select year,count(*) from car_dekho where year between 2020 and 2022 group by year order by year asc;

select year,count(*) from car_dekho where year in (2020,2021,2022) group by year;


select count(*) from car_dekho where year = 2020; -- 74
select count(*) from car_dekho where year = 2021; -- 7
select count(*) from car_dekho where year = 2022; -- 7

-- Client asked to print total no of available cars by year.
select year,count(year) from car_dekho group by year order by year asc;

-- Client asked to car dealer agent How many diesel cars will there be available in 2020?
select year,fuel,count(*) from car_dekho where year=2020 and fuel='Diesel';

-- -- Client asked to car dealer agent How many Petrol cars will there be available in 2021?
select year,fuel, count(*) from car_dekho where fuel='Petrol' and year=2021;

-- Print all Fuel type of cars came by year.
select year,count(*) from car_dekho where fuel='Petrol' group by year;  
select year,count(*) from car_dekho where fuel='DIESEL' group by year; 
select year,count(*) from car_dekho where fuel='CNG' group by year;

-- Manager said there were 100 cars in a given year,find the year?
select year,count(*) as total_no from car_dekho group by year having total_no>100;

-- Print all cars count list between 2015-2023.
select year,count(*) from car_dekho where year between 2015 and 2023 group by year;

-- Print all cars details list between 2015-2023.
select * from car_dekho where year between 2015 and 2023;