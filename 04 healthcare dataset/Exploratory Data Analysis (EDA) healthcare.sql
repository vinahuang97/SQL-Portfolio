-- 1. get total numbers of rows
select count(*) 
as total_rows 
from healthcare1;

-- 2 get unique values for each column
select
	count(distinct concat(first_name,last_name)) as unique_name,
	count(distinct gender) as unique_gender,
	count(distinct blood_type) as unique_blood_type,
	count(distinct medical_condition) as unique_medical_condition,
	count(distinct doctor) as unique_doctor,
	count(distinct hospital) as unique_hospitals,
	count(distinct insurance_provider) as unique_insurance_providers
from healthcare1;

-- 3  min, max, avg age

select
	min(age) as min_age,
	max(age) as max_age,
	avg(age) as avg_age
from healthcare1;


-- 4  Age group distribution

select
	case
		when age < 18 then '<18'
        when age between 18 and 29 then '18-29'
        when age between 30 and 39 then '30-39'
		when age between 40 and 49 then '40-49'
        when age between 50 and 59 then '50-59'
		when age >= 60 then '60+'
	end as age_group,
	count(*) as count
from healthcare1
group by age_group 
order by age_group asc ;

-- 5 gender distribution
select gender, count(*) as count
from healthcare1
group by gender
order by count desc;

-- 6 blood type distribution
select blood_type, count(*) as count
from healthcare1
group by blood_type
order by count desc;

-- 7 medical condition distribution
select medical_condition, count(*) as count
from healthcare1
group by medical_condition
order by count desc;

-- 8 hospital distribution
select hospital, count(*) as count
from healthcare1
group by hospital
order by count desc
limit 10;

-- 9 insurance provider distribution
select insurance_provider, count(*) as count
from healthcare1
group by Insurance_Provider
order by count desc;

-- 10 min, max, avg billing amount 
select
	min(billing_amount) as min_billing_amount,
    max(billing_amount) as max_billing_amount,
    avg(billing_amount) as avg_billing_amount
from healthcare1;

-- 11 room number frequency
select room_number, count(*) as count
from healthcare1
group by room_number
order by count desc;

-- 12 admission and discharge information
select
	avg(datediff(discharge_date, date_of_admission)) as avg_length_of_stay
from healthcare1
where discharge_date is not null and date_of_admission is not null;

-- 13 admission type distribution
select admission_type, count(*) as count
from healthcare1
group by admission_type
order by count desc;

-- 14 medication frequency
select medication, count(*) as count
from healthcare1
group by medication
order by count desc;

-- 15 test results frequency
select Test_Results, count(*) as count
from healthcare1
group by test_results
order by count desc;

-- 16 top doctors
select doctor, count(*) as count
from healthcare1
group by doctor
order by count desc;

-- 17 billing amount outliers
select *
from healthcare1
where billing_amount > 
(select avg(billing_amount) + 3 * stddev(billing_amount) from healthcare1);
