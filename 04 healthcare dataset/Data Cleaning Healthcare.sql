-- make new table

select *
from healthcare_dataset;

create table healthcare
like healthcare_dataset;

insert healthcare
select *
from healthcare_dataset;

select *
from healthcare;

-- Data Cleaning

-- 1. remove duplicates

with duplicate_cte as
(
select *,
	row_number() over
	(partition by `Name`, `Date of Admission`, hospital
	order by `Discharge Date` DESC) as row_num
from healthcare
)
select *
from duplicate_cte
where row_num > 1
;

-- cannot insert into new column so I make new table  

create table healthcare1
(
First_Name text, 
Last_Name text,
Age int, 
Gender text, 
Blood_Type text,
Medical_Condition text,
Date_of_Admission text,
Doctor text, 
Hospital text, 
Insurance_Provider text, 
Billing_Amount double, 
Room_Number int, 
Admission_Type text, 
Discharge_Date text, 
Medication text, 
Test_Results text,
row_num int
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from healthcare1;

insert into healthcare1
select SUBSTRING_INDEX(name, ' ', 1) as first_name,  SUBSTRING_INDEX(name, ' ', -1) as last_name , age, gender, `blood type`, `medical condition`, `date of admission`, doctor, hospital, `insurance provider`,
`billing amount`, `room number`, `admission type`, `discharge date`, medication, `test results`,
	row_number() over
	(partition by `Name`, `Date of Admission`, hospital
	order by `Discharge Date` DESC) as row_num
from healthcare;

select *
from healthcare1
where row_num > 1;

delete
from healthcare1
where row_num > 1;

-- 5500 duplicated rows are deleted

select *
from healthcare1;

-- 2 standardize the data

SELECT first_name,
CONCAT(
    UPPER(SUBSTRING(first_name, 1, 1)),
    LOWER(SUBSTRING(first_name, 2))
) AS first_name
FROM healthcare1;

update healthcare1
set first_name =
CONCAT(
    UPPER(SUBSTRING(first_name, 1, 1)),
    LOWER(SUBSTRING(first_name, 2))
) ;

SELECT last_name,
CONCAT(
    UPPER(SUBSTRING(last_name, 1, 1)),
    LOWER(SUBSTRING(last_name, 2))
) AS last_name
FROM healthcare1;

update healthcare1
set last_name =
CONCAT(
    UPPER(SUBSTRING(last_name, 1, 1)),
    LOWER(SUBSTRING(last_name, 2))
) ;

select date_of_admission, str_to_date(date_of_admission, '%Y-%m-%d'), 
	discharge_date, str_to_date(discharge_date, '%Y-%m-%d')
from healthcare1;


update healthcare1
set date_of_admission = str_to_date(date_of_admission, '%Y-%m-%d'), 
	discharge_date = str_to_date(discharge_date, '%Y-%m-%d');

alter table healthcare1
modify column date_of_admission date,
modify column discharge_date date;


SELECT Billing_Amount, round(billing_amount, 2)
from healthcare1;

update healthcare1
set Billing_Amount = round(billing_amount, 2);

update healthcare1
set hospital = 'Smith Group'
where hospital like '%group smith%';

update healthcare1
set hospital = 'Smith Ltd'
where hospital like '%Ltd Smith%';

update healthcare1
set hospital = 'Smith Llc'
where hospital like '%Llc Smith%';

update healthcare1
set hospital = 'Johnson Plc'
where hospital like '%Plc Johnson%';

update healthcare1
set hospital = 'Smith Plc'
where hospital like '%Plc Smith%';

update healthcare1
set hospital = 'Johnson Inc'
where hospital like '%Inc Johnson%';

update healthcare1
set hospital = 'Smith Inc'
where hospital like '%Inc Smith%';

update healthcare1
set hospital = 'Johnson Llc'
where hospital like '%llc johnson%';

update healthcare1
set hospital = 'William Plc'
where hospital like '%plc William%';

update healthcare1
set hospital = 'Brown Inc'
where hospital like '%Inc Brown%';

update healthcare1
set hospital = 'Johnson Group'
where hospital like '%Group Johnson%';

update healthcare1
set hospital = 'William Llc'
where hospital like '%llc william%';

select distinct hospital
from healthcare1
where hospital like '%inc smith%';


select *
from healthcare1;



-- 3. missing values or blank values

select *
from healthcare1;

SELECT 
    COUNT(CASE WHEN First_Name IS NULL OR First_Name = '' THEN 1 END) AS Missing_First_Name,
    COUNT(CASE WHEN Last_Name IS NULL OR Last_Name = '' THEN 1 END) AS Missing_First_Name,
    COUNT(CASE WHEN Age IS NULL THEN 1 END) AS Missing_Age,
    COUNT(CASE WHEN Gender IS NULL OR Gender = '' THEN 1 END) AS Missing_Gender,
    COUNT(CASE WHEN Blood_Type IS NULL OR Blood_Type = '' THEN 1 END) AS Missing_Blood_Type,
    COUNT(CASE WHEN Medical_Condition IS NULL OR Medical_Condition = '' THEN 1 END) AS Missing_Medical_Condition,
    COUNT(CASE WHEN Date_of_Admission IS NULL THEN 1 END) AS Missing_Date_of_Admission,
    COUNT(CASE WHEN Doctor IS NULL OR Doctor = '' THEN 1 END) AS Missing_Doctor,
    COUNT(CASE WHEN Hospital IS NULL OR Hospital = '' THEN 1 END) AS Missing_Hospital,
    COUNT(CASE WHEN Insurance_Provider IS NULL OR Insurance_Provider = '' THEN 1 END) AS Missing_Insurance_Provider,
    COUNT(CASE WHEN Billing_Amount IS NULL THEN 1 END) AS Missing_Billing_Amount,
    COUNT(CASE WHEN Room_Number IS NULL OR Room_Number = '' THEN 1 END) AS Missing_Room_Number,
    COUNT(CASE WHEN Admission_Type IS NULL OR Admission_Type = '' THEN 1 END) AS Missing_Admission_Type,
    COUNT(CASE WHEN Discharge_Date IS NULL THEN 1 END) AS Missing_Discharge_Date,
    COUNT(CASE WHEN Medication IS NULL OR Medication = '' THEN 1 END) AS Missing_Medication,
    COUNT(CASE WHEN Test_Results IS NULL OR Test_Results = '' THEN 1 END) AS Missing_Test_Results
FROM healthcare1;

-- there's no null or blank columns 

-- 4. drop unecessary column

alter table healthcare1
drop column row_num;

select *
from healthcare1;