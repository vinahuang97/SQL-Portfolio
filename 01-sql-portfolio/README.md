# Layoffs SQL Portfolio
## Outline
[Data Background](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#data-background)</br>
[Data Cleaning](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#data-cleaning) </br>
  * [Remove Duplicates](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#1-remove-duplicates)</br>
  * [Standardize the Data](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#2-standardize-the-data)</br>
  * [Null Values or Blank Values](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#3-null-values-or-blank-values)</br>
  * [Remove any unecessary Columns or Rows](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#4-remove-any-columns-or-rows)</br>
 
[Exploratory Data Analysis (EDA)](https://github.com/vinahuang97/Portfolio/blob/main/01-sql-portfolio/README.md#exploratory-data-analysis-eda) </br>

## Data Background
Tech firms around the globe are fighting the economic slowdown. The slow consumer spending, higher interest rates by central banks and strong dollars overseas are hinting towards possible recession and tech firms have started laying employees off. This economic slowdown has made Meta recently fire 13% of its workforce, which amounts to more than 11,000 employees.</br>

The data availability is from when COVID-19 was declared as a pandemic i.e. 11 March 2020 to 06 March 2023.

## Data Cleaning
Before cleaning the data, I duplicated the table and named it layoffs_staging. This ensures that if I make any mistakes, I can always revert to the original data and start over.

### 1 Remove Duplicates

SELECT *,</br>
ROW_NUMBER() OVER(</br>
PARTITION BY company, location, industry, </br>
total_laid_off, percentage_laid_off, `date`, stage, </br>
country, funds_raised_millions</br>
) as row_num</br>
FROM layoffs_staging</br>
</br>









### 2 Standardize the Data

### 3 Null Values or blank Values

### 4 Remove any Columns or Rows

## Exploratory Data Analysis (EDA)
