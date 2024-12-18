# IMDB Movies
## Outline
[Data Background](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#data-background)</br>

[Data Cleaning](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#data-cleaning)</br>
  - [1. Duplicated Data](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#1-duplicated-data)</br>
  - [2. Standrdize the data](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#2-standardize-the-data)</br>
  - [3. null or blank values](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#3-null-or-blank-values)</br>
  - [4. Remove unnecessary column](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#4-remove-unecessary-column)</br>

[Exploratory Data Analysis (EDA)](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#exploratory-data-analysiseda)</br>
  - [1. Total Movies](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#1-total-movies)</br>
  - [2. Earliest and Lastest Released Year](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#2-earliest-and-lastest-released-year)</br>
  - [3. Avg Meta_Score and Imdb Rating](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#3-avg-meta_score-and-imdb-rating)</br>
  - [4. Highest Grossing Movies](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#4-highest-grossing-movies)</br>
  - [5. Lowest Grossing Movies](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#5-lowest-grossing-movies)</br>
  - [6. Average runtime by Certificate](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#6-average-runtime-by-certificate)</br>
  - [7. Most Common Genre](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#7-most-common-genre)</br>
  - [8. Top 5 highest-rated genres by average IMDB rating](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#8-top-5-highest-rated-genres-by-average-imdb-rating)</br>
  - [9. Relationship between genre and gross earnings](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#9-relationship-between-genre-and-gross-earnings)</br>
  - [10. Top 5 directors by average IMDB rating](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#10-top-5-directors-by-average-imdb-rating)</br>
  - [11. Most Common Actor](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#11-most-common-actor)</br>
  - [12. number of movies released per year](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/12.%20number%20of%20movies%20released%20per%20year.png)</br>
  - [13. Identify movies with unusually high/low ratings](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#13-identify-movies-with-unusually-highlow-ratings)</br>
  - [14. Identify movies with extreme gross earnings](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/README.md#14-identify-movies-with-extreme-gross-earnings)</br>


## Data Background
IMDB Dataset by IMDB Rating

## Data Cleaning
Before cleaning the data, I duplicated the data and divided the table into 3 tables Movies, Stars, and Genres.

### 1. Duplicated Data
There's no duplicated data, no data needed to be deleted

### 2. Standardize the data
- remove the unecessary spaces on Series_Title, Star_Name, 
- add certificate decription
- remove (,) on gross and change it into integer
- remove (min) in runtime, change it into integer, and change runtime name into runtime_min

### 3 null or blank values
- add certificate and certificate description into this titles ['Seppuku', 'Metropolis', 'Mandariinid', 'Du rififi chez les hommes', 'RashÃ´mon', 'Kis Uykusu']

### 4. Remove unecessary column
- drop overview and poster link columns, since I won't use that columns.

## Exploratory Data Analysis(EDA)
### 1. Total Movies

![Total Movies](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/01%20total%20movies.png)

### 2. Earliest and Lastest Released Year

![Earliest and Lastest Released Year](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/02%20earliest%20and%20lastest%20year.png)

### 3. Avg Meta_Score and Imdb Rating

![avg meta_score, avg imdb rating](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/03%20avg%20meta%20rating%20and%20imdb%20rating.png)

### 4. Highest Grossing Movies

![highest grossing movies](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/04%20Highest%20grossing%20movies.png)

### 5. Lowest Grossing Movies

![lowest grossing movies](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/05%20lowest%20grossing%20movies.png)

### 6. Average runtime by Certificate

![avg runtime by certificate](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/06%20avg%20runtime%20by%20certificate.png)

### 7. Most Common Genre

![most common genre](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/07.%20Most%20Common%20Genre.png)

### 8. Top 5 highest-rated genres by average IMDB rating

![top 5 highest rated genres by avg imdb rating](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/08%20Top%205%20highest-rated%20genres%20by%20average%20IMDB%20rating.png)

### 9. Relationship between genre and gross earnings

![relationship between genre and gross earnings](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/09%20Relationship%20between%20genre%20and%20gross%20earnings.png)

### 10. Top 5 directors by average IMDB rating.

![top 5 directors by avg imdb rating](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/10.%20Top%205%20directors%20by%20average%20IMDB%20rating..png)

### 11. Most Common Actor

![most common actor](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/11%20most%20common%20actor.png)

### 12. number of movies released per year

![number of movies released per year](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/12.%20number%20of%20movies%20released%20per%20year.png)

### 13. Identify movies with unusually high/low ratings.

![outlier movies rating](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/13.%20Identify%20movies%20with%20unusually%20highlow%20ratings.png)

### 14. Identify movies with extreme gross earnings.

![outlier gross earnings movie](https://github.com/vinahuang97/SQL-Portfolio/blob/main/03%20IMDB%20Movies/pict/14%20Identify%20movies%20with%20extreme%20gross%20earnings.png)

