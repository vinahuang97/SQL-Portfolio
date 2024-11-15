CREATE TEMPORARY TABLE temp_movie_genres (
    movie_id INT,
    genre_name Text
);

INSERT INTO temp_movie_genres (movie_id, genre_name)
SELECT 
    t.movie_id,
    TRIM(t.GenrePart) AS genre_name
FROM (
    WITH RECURSIVE GenreSplit AS (
        SELECT 
            movie_id, 
            SUBSTRING_INDEX(genre, ',', 1) AS GenrePart, 
            SUBSTRING(genre, LENGTH(SUBSTRING_INDEX(genre, ',', 1)) + 2) AS RemainingGenres
        FROM imdb
        WHERE genre IS NOT NULL

        UNION ALL

        SELECT 
            movie_id, 
            SUBSTRING_INDEX(RemainingGenres, ',', 1) AS GenrePart, 
            SUBSTRING(RemainingGenres, LENGTH(SUBSTRING_INDEX(RemainingGenres, ',', 1)) + 2) AS RemainingGenres
        FROM GenreSplit
        WHERE RemainingGenres != ''
    )
    SELECT DISTINCT movie_id, TRIM(GenrePart) AS GenrePart
    FROM GenreSplit
) AS t;

select *
from temp_movie_genres;

-- genre id 

CREATE TEMPORARY TABLE temp_genre_id (
    id INT AUTO_INCREMENT primary key,
    genre_name TEXT
);

INSERT INTO temp_genre_id (genre_name)
SELECT DISTINCT genre_name
FROM temp_movie_genres;

SELECT id, movie_id, gn.genre_name
FROM temp_movie_genres gn
join
temp_genre_id id
on gn.genre_name = id.genre_name
;

-- combine both columns

create temporary table genre
(
id int,
movie_id int,
genre_name text
);

insert genre
SELECT id, movie_id, gn.genre_name
FROM temp_movie_genres gn
join
temp_genre_id id
on gn.genre_name = id.genre_name;

select *
from genre;