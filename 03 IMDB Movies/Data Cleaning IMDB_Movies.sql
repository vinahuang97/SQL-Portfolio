-- insert data to SQL

select *
from imdb_top_1000;

create table imdb
like imdb_top_1000;

insert imdb
select *
from imdb_top_1000;

select *
from imdb;

-- Separate the table

alter table imdb
add column movie_id int auto_increment primary key;
;

create table movies
(
	movie_id int primary key,
    Series_Title text,
    Released_Year int,
    Certificate text,
    Runtime text,
    IMDB_Rating double,
    Overview text,
    Meta_Score int,
    Director text,
    No_of_Votes int,
    Gross text,
    Poster_Link text
);

insert movies
select 
	movie_id, Series_Title, Released_Year, Certificate, Runtime,
    Genre, IMDB_Rating, Overview, Meta_Score, Director, No_of_Votes,
    Gross, Poster_Link
from imdb;

select *
from movies;

create table stars
	(
	star_id int auto_increment primary key,
	movie_id int,
	star_name text,
	foreign key (movie_id) references movies(movie_id)
	);

insert into stars (movie_id, star_name)
select movie_id, star1 from imdb where star1 is not null
union all
select movie_id, star2 from imdb where star1 is not null
union all
select movie_id, star3 from imdb where star1 is not null
union all
select movie_id, star4 from imdb where star1 is not null;

select *
from stars;

-- go to temporary table first

create table genres(
id int,
movie_id int,
genre_name text,
foreign key (movie_id) references movies(movie_id)
);

insert genres (id, movie_id, genre_name)
select id, movie_id, genre_name
from genre;

select *
from genres;


-- Data Cleaning

with duplicate_cte as(
select *,
row_number() over (
partition by Series_Title, Released_Year
) as row_num
from movies
)

select *
from duplicate_cte
where row_num > 1;

-- no duplicate data, no deleted columns 

-- 2 Standardize the Data

select Series_Title, Trim(Series_Title)
from movies;
update movies
set Series_Title = Trim(Series_Title);

select star_name, Trim(star_name)
from stars;
update stars
set star_name = Trim(star_name);

alter table movies
add column Cert_Desc text after Certificate;
update movies
set Cert_desc = Certificate;

update movies
set cert_desc = case
	when cert_desc= 'A' then 'Adult'
	when cert_desc= 'UA' then 'Under Age'
	when cert_desc= 'U' then 'Universal'
	when cert_desc= 'PG-13' then 'Parental Guidance-13'
	when cert_desc= 'R' then 'Restricted'
	when cert_desc= 'PG' then 'Parental Guidance'
	when cert_desc= 'Passed' then 'Passed'
	when cert_desc= '16' then '16+'
    when cert_desc = 'G' then 'General Audience'
	else null
end;

UPDATE movies
SET Gross = REPLACE(Gross, ',', '');

alter table movies
modify column gross int;

UPDATE movies
SET Runtime = REPLACE(Runtime, ' min', '');

alter table movies
modify column runtime int;

alter table movies
rename column runtime to runtime_min;

select *
from movies;


-- 3 is null or blank


update movies
set certificate = null
where certificate = '';

update movies
set certificate = case
	WHEN series_title = 'Seppuku' THEN 'R'
	WHEN series_title = 'Metropolis' THEN 'PG-13'
	WHEN series_title = 'Mandariinid' THEN 'PG-13'
	WHEN series_title = 'Du rififi chez les hommes' THEN 'PG'
	WHEN series_title = 'RashÃ´mon' THEN 'PG'
	WHEN series_title = 'Kis Uykusu' THEN 'R'
END
WHERE series_title IN ('Seppuku', 'Metropolis', 'Mandariinid', 'Du rififi chez les hommes', 'RashÃ´mon', 'Kis Uykusu');

update movies
set cert_desc = case
	WHEN series_title = 'Seppuku' THEN 'Restricted'
	WHEN series_title = 'Metropolis' THEN 'Parental Guidance-13'
	WHEN series_title = 'Mandariinid' THEN 'Parental Guidance-13'
	WHEN series_title = 'Du rififi chez les hommes' THEN 'Parental Guidance'
	WHEN series_title = 'RashÃ´mon' THEN 'Parental Guidance'
	WHEN series_title = 'Kis Uykusu' THEN 'Restricted'
END
WHERE series_title IN ('Seppuku', 'Metropolis', 'Mandariinid', 'Du rififi chez les hommes', 'RashÃ´mon', 'Kis Uykusu');

update movies
set cert_desc = case
	WHEN series_title = 'Modern Times' THEN 'General Audience'
	WHEN series_title = 'City Lights' THEN 'General Audience'
	WHEN series_title = "Singin' in the Rain" THEN 'General Audience'
	END
WHERE series_title IN ('Modern Times', 'City Lights', "Singin' in the Rain");



update movies
set Gross = null
where Gross = '';

-- 4 Remove unecessary column

alter table movies
drop column Overview,
drop column poster_link;

select *
from movies;
