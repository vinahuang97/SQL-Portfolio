# Layoffs SQL Portfolio
## Outline
[Data Background](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#data-background)</br>
[Data Cleaning](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#data-cleaning) </br>
  * [Remove Duplicates](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#1-remove-duplicates)</br>
  * [Standardize the Data](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#2-standardize-the-data)</br>
  * [Null Values or Blank Values](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#3-null-values-or-blank-values)</br>
  * [Remove any unecessary Columns or Rows](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#4-remove-any-columns-or-rows)</br>
 
[Exploratory Data Analysis (EDA)](ttps://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#exploratory-data-analysis-eda) </br>
 * [Identify the maximum values for both total_laid_off and percentage_laid_off across the dataset](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#identify-the-maximum-values-for-both-total_laid_off-and-percentage_laid_off-across-the-dataset)</br>
 * [Identify the total layoffs for each company]</br>
 * [Identify the total layoffs for each industry]</br>
 * [Identify the total layoffs for each country]</br>
 * [Identify the total layoffs for each state]</br>
 * [Identify the average percentage laid off for each company]</br>
 * [Identify the earliest and latest layoff dates recorded in the dataset]</br>
 * [Identify the total layoffs for each year]</br>
 * [Calculae the total layoffs per month, along with the cumulative (rolling) total over the specified time period]</br>
 * [Identify the total layoffs for each company in each year]</br>
 * [Rank companies by total layoffs each year and retrieve the top 5 companies with the highest layoffs for each year]</br>

</br>
</br>

## Data Background
Tech firms around the globe are fighting the economic slowdown. The slow consumer spending, higher interest rates by central banks and strong dollars overseas are hinting towards possible recession and tech firms have started laying employees off. This economic slowdown has made Meta recently fire 13% of its workforce, which amounts to more than 11,000 employees.</br>

The data availability is from when COVID-19 was declared as a pandemic i.e. 11 March 2020 to 06 March 2023.

## Data Cleaning
Before cleaning the data, I duplicated the table and named it layoffs_staging. This ensures that if I make any mistakes, I can always revert to the original data and start over.

### 1 Remove Duplicates

- <b> cannot delete using the cte row number method, so I make new table [layoffs_staging2] with additional new rows for row_num </b> </br>

- <b> Inserts data from the "layoffs_staging" table into the "layoffs_staging2" table.</br>
While doing so, it adds a "row_num" column that generates a unique row number for each group of records with the same combination columns.</br>
The ROW_NUMBER() function ensures that if there are multiple records with the same values in those columns, each will be assigned a unique number starting from 1.</b></br>

    insert into layoffs_staging2 </br>
    SELECT *,</br>
    ROW_NUMBER() OVER(</br>
    PARTITION BY company, location, industry, </br>
    total_laid_off, percentage_laid_off, `date`, stage, </br>
    country, funds_raised_millions</br>
    ) as row_num</br>
    FROM layoffs_staging;</br>

- </b> check how much the duplicate columns</b></br>
    select *</br>
    from layoffs_staging2</br>
    where row_num > 1 ;</br>
  
![Duplicate Columns](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/pict/duplicate%20columns.png)


- <b> Delete Duplicate Columns</b></br>

   DELETE</br>
   from layoffs_staging2</br>
   where row_num > 1 ;

### 2 Standardize the Data

- Trim company column (remove the unuseable space in the column)</br>
- Cleaning up the industry column that begin with "Crypto" (including variations like "Crypto Currency" or "Cryptocurrency") are standardized to just 'Crypto'.</br>
- Delete . from United States. in Country Column using trim and trailing.</br>
- Change date column to 'date' format.</br>

### 3 Null Values or blank Values
- Check the null/blank values for each columns</br>
- Fill the values for Industry, if we have the same data (example : Airbnb has 2 data : "Travel" and "Null", we can fill the "Null" with "Travel")</br>
- Delete the rows with null or blank values in the total_laid_off and percentage_laid_off columns, as we won't use those columns if there is no data for layoffs.</br>

### 4 Remove any Unecessary Columns or Rows
- Drop the row_num column so that the data returns to its original format.</br>
</br>

## Exploratory Data Analysis (EDA)
### Identify the maximum values for both total_laid_off and percentage_laid_off across the dataset

![maximum values for both total_laid_off & percentage_laid_off](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/pict/max%20total%20%26%20precentage%20laid%20off.png)


- Identify the total layoffs for each company.
- Identify the total layoffs for each industry.
- Identify the total layoffs for each country.
- Identify the total layoffs for each state.
- Identify the average percentage laid off for each company.
- Identify the earliest and latest layoff dates recorded in the dataset.
- Identify the total layoffs for each year.
- Calculae the total layoffs per month, along with the cumulative (rolling) total over the specified time period.
- Identify the total layoffs for each company in each year.
- Rank companies by total layoffs each year and retrieve the top 5 companies with the highest layoffs for each year.



