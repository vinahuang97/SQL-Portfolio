# Layoffs SQL Portfolio
## Outline
[Data Background](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#data-background)</br>
[Data Cleaning](https://github.com/vinahuang97/SQL-Portfolio/tree/main/01-sql-portfolio-company-layoffs#data-cleaning) </br>
  * [Remove Duplicates](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#1-remove-duplicates)</br>
  * [Standardize the Data](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#2-standardize-the-data)</br>
  * [Null Values or Blank Values](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#3-null-values-or-blank-values)</br>
  * [Remove any unecessary Columns or Rows](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#4-remove-any-columns-or-rows)</br>
 
[Exploratory Data Analysis (EDA)](ttps://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#exploratory-data-analysis-eda) </br>
 * [Identify the maximum values for both total_laid_off and percentage_laid_off across the dataset](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#1-identify-the-maximum-values-for-both-total_laid_off-and-percentage_laid_off-across-the-dataset)</br>
 * [Identify the total layoffs for each company](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#2-identify-the-total-layoffs-for-each-company)</br>
 * [Identify the total layoffs for each industry](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#3-identify-the-total-layoffs-for-each-industry)</br>
 * [Identify the total layoffs for each country](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#4-identify-the-total-layoffs-for-each-country)</br>
 * [Identify the total layoffs for each state](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#5-identify-the-total-layoffs-for-each-state)</br>
 * [Identify the average percentage laid off for each company](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#6-identify-the-average-percentage-laid-off-for-each-company)</br>
 * [Identify the earliest and latest layoff dates recorded in the dataset](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#7-identify-the-earliest-and-latest-layoff-dates-recorded-in-the-dataset)</br>
 * [Identify the total layoffs for each year](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#8-identify-the-total-layoffs-for-each-year)</br>
 * [Calculate the total layoffs per month, along with the cumulative (rolling) total over the specified time period](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#9-calculate-the-total-layoffs-per-month-along-with-the-cumulative-rolling-total-over-the-specified-time-period)</br>
 * [Identify the total layoffs for each company in each year](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#10-identify-the-total-layoffs-for-each-company-in-each-year)</br>
 * [Rank companies by total layoffs each year and retrieve the top 5 companies with the highest layoffs for each year](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/README.md#11-rank-companies-by-total-layoffs-each-year-and-retrieve-the-top-5-companies-with-the-highest-layoffs-for-each-year)</br>

</br>
</br>

## Data Background
Tech firms around the globe are fighting the economic slowdown. The slow consumer spending, higher interest rates by central banks and strong dollars overseas are hinting towards possible recession and tech firms have started laying employees off. This economic slowdown has made Meta recently fire 13% of its workforce, which amounts to more than 11,000 employees.</br>

The data availability is from when COVID-19 was declared as a pandemic i.e. 11 March 2020 to 06 March 2023.
It has 2,361 total datas.

## Data Cleaning
Before cleaning the data, I duplicated the table and named it layoffs_staging. This ensures that if I make any mistakes, I can always revert to the original data and start over.

### 1 Remove Duplicates
  
![Duplicate Columns](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/pict/duplicate%20columns.png)

Remove 5 duplicate columns

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
### 1. Identify the maximum values for both total_laid_off and percentage_laid_off across the dataset

![maximum values for both total_laid_off & percentage_laid_off](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/pict/max%20total%20%26%20precentage%20laid%20off.png)

### 2. Identify the total layoffs for each company

![total layoffs for each company](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/pict/sum%20of%20total%20laid%20off%20by%20company.png)

### 3. Identify the total layoffs for each industry

![total layoffs for each industry](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/pict/sum%20of%20total%20laid%20off%20by%20industry.png)

### 4. Identify the total layoffs for each country

![total layoffs for each country](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/pict/sum%20of%20total%20laid%20off%20by%20country.png)

### 5. Identify the total layoffs for each state

![total layoffs for each state](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/pict/sum%20of%20total%20laid%20off%20by%20state.png)

### 6. Identify the average percentage laid off for each company

![average percentage laid off for each company](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/pict/avg%20percentage%20by%20company.png)

### 7. Identify the earliest and latest layoff dates recorded in the dataset

![earliest & lastest date](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/pict/earliest%20and%20lastest%20date.png)

### 8. Identify the total layoffs for each year.

![total layoffs for each year](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/pict/total%20laid%20off%20each%20year.png)
 
### 9. Calculate the total layoffs per month, along with the cumulative (rolling) total over the specified time period.

![total layoffs per month](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/pict/monthly%20total%20laid%20off.png)
 
### 10. Identify the total layoffs for each company in each year.

![total layoffs for company each year](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/pict/total%20laid%20off%20for%20company%20each%20year.png)
 
### 11. Rank companies by total layoffs each year and retrieve the top 5 companies with the highest layoffs for each year.

![rank companies](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio-company-layoffs/pict/Rank%20company.png)



