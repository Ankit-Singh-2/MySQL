create database insurance_project
use insurance_project;

-- Select all columns for all patients.
select * from insurance_data;

-- Display the average claim amount for patients in each region.
select region,round(avg(claim),2) as avg_claim_amount from insurance_data group by region; 

-- Select the maximum and minimum BMI values in the table.
select max(bmi),min(bmi)from insurance_data;

-- Select the PatientID, age, and BMI for patients with a BMI between 40 and 50.
select patientid,age,bmi from insurance_data where bmi between 40 and 50;

-- Select the number of smokers in each region.
select region,count(smoker)from insurance_data where smoker='Yes'group by region;

-- What is the average claim amount for patients who are both diabetic and smokers? 
select round(avg(claim),2) as claim_amount from insurance_data where diabetic = 'yes' and smoker='yes';

-- Retrieve all patients who have a BMI greater than the average BMI of patients who are smokers.
select patientid,bmi from insurance_data where bmi>(select avg(bmi) from insurance_data) and smoker='yes';

-- Select the average claim amount for patients in each age group. 
select case
           when age<18 then'Under 18'
           when age between 18 and 30 then '18-30'
           when age between 31 and 50 then '31-50'
           else 'Over 50'
       end as age_group,
round(avg(claim),2) from insurance_data group by age_group;   

-- Retrieve the total claim amount for each patient, along with the average claim amount across all patients. 
select *,sum(claim) over(partition by patientid) as total_claim,avg(claim) over() as avg_claim from insurance_data;

-- Retrieve the top 3 patients with the highest claim amount, along with their respective claim amounts and the total claim amount for all patients.
select *,sum(claim) over() as total_claim from insurance_data order by claim desc limit 3; 

-- Select the details of patients who have a claim amount greater than the average claim amount for their region.
select * from insurance_data t1 where claim>(select avg(claim) from insurance_data t2 where t2.region=t1.region);
select * from (select *,avg(claim) over(partition by region) as avg_claim from insurance_data) as subquery where claim>avg_claim;

-- Retrieve the rank of each patient based on their claim amount.
select *,rank() over(order by claim desc) as ranking from insurance_data;

-- Select the details of patients along with their claim amount, and their rank based on claim amount within their region.
select *,rank() over(partition by region order by claim desc) as rank_in_region from insurance_data;
