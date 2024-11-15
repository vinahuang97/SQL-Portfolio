-- Exploratory Data Analysis (EDA)

-- 1. total movies
select count(*) as total_movies
from movies;

-- 2 earliest and lastest released year
select min(Released_Year) as earliest_year, max(Released_Year) as lastest_year
from movies;

-- 3 avg meta score and imdb rating
select avg(Meta_Score) as avg_Meta_Score, avg(IMDB_Rating) as avg_IMDB_Rating
from movies;

-- 4 Highest grossing movies
select Series_Title, gross
from movies
order by gross desc
limit 1;

-- 5 lowest grossing movies
select Series_Title, gross
from movies
where gross is not null
order by gross asc
limit 1;

-- 6 average runtime by Certificate
select certificate, cert_desc, avg(runtime)
from movies;

-- 7 avg runtime by certificate
select Certificate, Cert_Desc, avg(runtime_min) as avg_runtime_min
from movies
group by certificate, Cert_Desc;

-- 8 most common genre
select genre_name, count(genre_name) as movie_count
from genres
group by genre_name
order by movie_count desc
limit 10;

-- 9 Top 5 highest-rated genres by average IMDB rating
select genre_name, avg(IMDB_Rating) as avg_imdb_rating
from genres g
join movies m
on g.movie_id = m.movie_id
group by genre_name
order by avg_imdb_rating desc
limit 5;


-- 10 Relationship between genre and gross earnings.
select genre_name, avg(gross) as avg_gross
from genres g
join movies m
on g.movie_id = m.movie_id
group by genre_name
order by avg_gross desc;

-- 11 Top 5 directors by average IMDB rating.
select director, avg(IMDB_Rating) as avg_imdb_rating
from movies
group by director
order by avg_imdb_rating desc
limit 5;

-- 12 most common actors
select star_name, count(star_name) as movie_count
from stars
group by star_name
order by movie_count desc
limit 10;

-- 13 number of movies released per year
select released_year, count(series_title) as total_movies
from movies
group by released_year
order by Released_Year desc;

-- 14 Identify movies with unusually high/low ratings.
SELECT Series_Title, IMDB_Rating
FROM Movies
WHERE IMDB_Rating > 9 OR IMDB_Rating < 3;

-- 15 Identify movies with extreme gross earnings.
SELECT Series_Title, Gross
FROM Movies
WHERE Gross > (SELECT AVG(Gross) + 3 * STDDEV(Gross) FROM Movies)
   OR Gross < (SELECT AVG(Gross) - 3 * STDDEV(Gross) FROM Movies);






select *
from movies;