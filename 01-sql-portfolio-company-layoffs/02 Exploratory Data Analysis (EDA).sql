-- Exploratory Data Analysis

-- Selects all columns from the layoffs_staging2 table
select * 
from layoffs_staging2;

-- Retrieves the maximum values for total_laid_off and percentage_laid_off
select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

-- Selects all records where the percentage_laid_off is 100% and sorts by total_laid_off in descending order
select * 
from layoffs_staging2 
where percentage_laid_off = 1 
order by total_laid_off desc;

-- Selects all records where the percentage_laid_off is 100% and sorts by funds_raised_millions in descending order
select * 
from layoffs_staging2 
where percentage_laid_off = 1 
order by funds_raised_millions desc;

-- Retrieves each company and the total layoffs they had, grouped by company and sorted by total_laid_off in descending order
select company, sum(total_laid_off) 
from layoffs_staging2 
group by company 
order by 2 desc;

-- Finds the earliest and latest dates of layoffs recorded in the table
select min(`date`), max(`date`) 
from layoffs_staging2;

-- Retrieves the total number of layoffs for each industry, grouped by industry and sorted in descending order
select industry, sum(total_laid_off) 
from layoffs_staging2 
group by industry 
order by 2 desc;

-- Retrieves the total number of layoffs for each country, grouped by country and sorted in descending order
select country, sum(total_laid_off) 
from layoffs_staging2 
group by country 
order by 2 desc;

-- Selects all columns from the layoffs_staging2 table (this is a duplicate of the first query)
select * 
from layoffs_staging2;

-- Retrieves the total layoffs for each year, grouped by year and sorted by total layoffs in descending order
select year(`date`), sum(total_laid_off) 
from layoffs_staging2 
group by year(`date`) 
order by 2 desc;

-- Retrieves the total layoffs for each funding stage of companies, grouped by stage and sorted in descending order
select stage, sum(total_laid_off) 
from layoffs_staging2 
group by stage 
order by 2 desc;

-- Retrieves the average percentage of layoffs for each company, grouped by company and sorted by average in descending order
select company, avg(percentage_laid_off) 
from layoffs_staging2 
group by company 
order by 2 desc;

-- Calculates the monthly total layoffs and cumulative (rolling) total over time
with rolling_total as 
(
    -- Groups by month (first 7 characters of date, i.e. YYYY-MM) and calculates the total layoffs for each month
    select substring(`date`, 1,7) as `month`, sum(total_laid_off) as total_off 
    from layoffs_staging2 
    where substring(`date`, 1,7) is not null 
    group by `month` 
    order by 1 asc
) 
-- Computes the rolling total of layoffs across months
select `month`, total_off, 
sum(total_off) over(order by `month`) as rolling_total 
from rolling_total;

-- Retrieves the total layoffs for each company in each year, grouped by company and year, and sorted by total layoffs in descending order
select company, year(`date`), sum(total_laid_off) 
from layoffs_staging2 
group by company, year(`date`) 
order by 3 desc;

-- Ranks companies based on total layoffs each year and retrieves the top 5 companies with the most layoffs per year
with company_year (company, years, total_laid_off) as 
(
    -- Retrieves the total layoffs for each company in each year
    select company, year(`date`), sum(total_laid_off) 
    from layoffs_staging2 
    group by company, year(`date`)
), company_year_rank as
(
    -- Assigns a dense rank based on total layoffs for each year
    select *, dense_rank() over(partition by years order by total_laid_off desc) as ranking 
    from company_year 
    where years is not null
) 
-- Selects records where the ranking is 5 or less, i.e., the top 5 companies for layoffs each year
select * 
from company_year_rank 
where ranking <= 5;







