/*
 Instructions:
    - Create a branch named "wine"
    - Solve the data-requests from this file using SQL.
    - Add/Commit/Push your changes to github (individual).
 Note: You can work along with your project team.
 */

-- EX.1) Get the top 10 countries with more population density
SELECT name FROM country WHERE area_km2 = 0;
SELECT
       name,
       -- population/area_km2 density
       DIV(population, area_km2) AS "density"
FROM
    country
WHERE area_km2 > 0
ORDER BY "density" DESC
LIMIT 10;

-- EX.2) Get the count of male/female tasters.
SELECT DISTINCT  gender FROM  taster; --Valores unicos
SELECT
    gender,
       count(*)
FROM
    taster
WHERE
    lower(gender) IN ('male','female')
    --LOWER(gender) NOT LIKE 'undef%'
    --LOWER(gender) LIKE '%male'
GROUP BY
    gender;

-- EX.3) Get the percentage of male/female tasters.
WITH taster_valid AS (
    SELECT
        *
    FROM
        taster
    WHERE
        LOWER(gender) IN ('male', 'female')
    ), taster_gender_agg AS (
        SELECT
            gender,
               count(*)::numeric(7,2)gender_sum --:: CAMBIAR TIPO DE DATO 7=INT, 2=#DECIMALES
        FROM
            taster_valid
        GROUP BY
        gender
    ), taster_total AS (
        SELECT count(*)::numeric(7,2) total
        FROM
            taster_valid
    )
SELECT
    gender,
       trunc(100*gender_sum/total,2)  percentage
FROM
     taster_gender_agg,
     taster_total
;

-- EX.4) How many countries share the same first digit on their country-code?
-- Show only those digits with more than 20 countries.
SELECT DISTINCT left(code,1) FROM country;

SELECT
    LEFT(code,1) first_digit,
       count(*) country_count
FROM
    country
GROUP BY
    first_digit
HAVING
    count(*) > 20
;

-- EX.5) Get the % of countries are not labeled as a trillion usd gdp and
-- do have a null happiness_score.
SELECT * FROM country;

SELECT 100 * count(*) / max(t.total) Percentage
FROM country,
     (SELECT count(*) total FROM country) t
WHERE
  --lower(split_part(gdp_usd,' ',2)) !='trillion'
    LOWER(gdp_usd) NOT LIKE '%trillion'
  AND happiness_score IS NULL;

-- COUNTRY ANALYSIS

-- A) Get the average happiness_score of the countries labeled with a GDP
-- of "billion" and "trillion".
SELECT gdp_usd from country;
select happiness_score from country;


SELECT
    AVG(happiness_score)
FROM
    country
WHERE
    LOWER(gdp_usd) NOT LIKE 'million'
    AND gdp_usd IS NOT NULL
;

-- B) Show a table with the country name, population, area, gdp, and happiness core of the
-- the G7 countries (i.e., `Canada`, `France`, `Germany`, `Italy`, `Japan`, `United Kingdom`, `United States`)
-- order by happiness_score (DESC).
SELECT name from country;
SELECT
    name, population, area_km2, gdp_usd, happiness_score
FROM
    country
WHERE
    lower(name) like 'canada'
    or lower(name) like 'france'
    or lower(name) like 'germany'
    or lower(name) like 'italy'
    or lower(name) like 'japan'
    or lower(name) like 'united kingdom'
    or lower(name) like 'united states'
;

-- C) Create a custom score called "score" using this formula: happiness_score * density
-- Where `density` is population / area_km2. Show the top 10 countries (name) with greater score.
select happiness_score FROM country
select area_km2 from country
SELECT
       name,
       trunc(numeric_mul(happiness_score,DIV(population,area_km2)),2)  AS "score"
FROM
    country
WHERE area_km2 > 0 AND happiness_score IS NOT NULL
ORDER BY "score"  DESC
    LIMIT 10;

-- WINE ANALYSIS

-- D) Get the number of wines per variety, ordered by the latter (desc)
SELECT DISTINCT variety from wine;
SELECT
    w.variety AS "Variety",
    count(*) AS "Total variety"
FROM
    country c INNER JOIN wine w ON c.id = w.country_id
GROUP BY
    w.variety
ORDER BY
    "Total variety" DESC
;

-- E) How many wines are registered per country? Show country name and number of wines, ordered by the latter (desc).
SELECT
    c.name AS "Country",
    count(*) AS "Total wine variety"
FROM
    country c INNER JOIN wine w ON c.id = w.country_id
GROUP BY
    c.name
ORDER BY
    "Total wine variety" DESC
;


-- REVIEW ANALYSIS

-- F) What's the average wine price and points per province?
-- Show the province, avg-price, avg-points when the avg-points are grater than 85.
-- Ordered by avg-price and then by avg-points.
SELECT DISTINCT province from wine;
SELECT
    w.province AS "Province",
    AVG(r.price)::numeric(7,2) AS "Average wine price",
    AVG(r.points)::numeric(7,2) AS "Average wine points"
FROM
    country c INNER JOIN wine w ON c.id = w.country_id INNER JOIN review r ON w.id = r.wine_id
GROUP BY
    w.province
ORDER BY
    "Average wine price",
    "Average wine points"
;

-- G) What's the average wine price and points of the countries with more than a 7 in their happiness score?
-- Show the country, avg-price, avg-points.
-- Ordered by avg-points and then by avg-price.
SELECT DISTINCT happiness_score, name from country ;
SELECT
    c.name AS "Country",
    AVG(r.price)::numeric(7,2) AS "Average wine price",
    AVG(r.points)::numeric(7,2) AS "Average wine points"
FROM
    country c INNER JOIN wine w ON c.id = w.country_id INNER JOIN review r ON w.id = r.wine_id
WHERE
    c.happiness_score > 7
GROUP BY
    c.happiness_score,
    c.name
ORDER BY
    "Average wine points",
    "Average wine price"
;

-- H) What's the min, avg, and max wine points per taster gender (excluding undefined) and wine variety starting with "Cabernet".
-- Order by: variety, gender
SELECT
    t.gender,
    max(r.points),
    min(r.points),
    avg(r.points)
FROM
    review r INNER JOIN taster t ON r.taster_id = t.id INNER JOIN wine w ON r.wine_id = w.id
WHERE
    LOWER(t.gender) NOT LIKE 'undef%'
    AND LOWER(w.variety) LIKE 'cabernet'
GROUP BY
    t.gender;

-- I) Create the following custom score called "wine_quality_and_happiness_index": happiness_score * avg(points) / 100
-- Get the score per country and order by the value (desc).
SELECT
    c.name,
       trunc(c.happiness_score*avg(r.points)/100,2) AS  "wine_quality_and_happiness_index"
FROM
    country c INNER JOIN wine w ON c.id = w.country_id INNER JOIN review r ON w.id = r.wine_id
GROUP BY
    r.points, c.happiness_score, c.name
ORDER BY
    "wine_quality_and_happiness_index" DESC;



SELECT
    c.name,
    c.happiness_score,r.points
FROM
    country c INNER JOIN wine w ON c.id = w.country_id INNER JOIN review r ON w.id = r.wine_id
GROUP BY
   r.points, c.happiness_score, c.name;