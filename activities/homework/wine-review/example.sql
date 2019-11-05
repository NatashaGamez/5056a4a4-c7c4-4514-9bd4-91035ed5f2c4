-- EX.1) Get the top 10 countries with more population density
SELECT
    name AS "Country Name",
    DIV(population, area_km2) AS "Population Density"
FROM
    country
WHERE
    area_km2 > 0
ORDER BY
    "Population Density" DESC,
    "Country Name"
LIMIT 10
;

-- EX.2) Get the count of male/female tasters.
SELECT DISTINCT gender FROM taster;

SELECT
    gender,
    count(*)
FROM
    taster
WHERE
    LOWER(gender) IN ('male', 'female')
    -- alternative: LOWER(gender) != 'undefined'
GROUP BY
    gender
;

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
        COUNT(*)::numeric(7,2) AS gender_sum
    FROM
        taster_valid
    GROUP BY
        gender
    ), taster_total AS (
        SELECT
            COUNT(*)::numeric(7,2) AS total
        FROM
            taster_valid
    )
SELECT
    gender,
    TRUNC(100 * gender_sum / total, 2) AS "Percentage"
FROM
    taster_gender_agg,
    taster_total
;

-- EX.4) How many countries share the same first digit on their country-code?
-- Show only those digits with more than 20 countries.

SELECT DISTINCT LEFT(code, 1) FROM country;

SELECT
    LEFT(code, 1) AS first_digit,
    COUNT(*) AS country_count
FROM
    country
GROUP BY
    first_digit
HAVING
    COUNT(*) > 20
;

-- EX.5) Get the % of countries are not labeled as a trillion usd gdp and
-- do have a null happiness_score.
SELECT
    100 * COUNT(*) / MAX(t.total) AS "%"
FROM
    country,
    (SELECT COUNT(*) AS total FROM country) t
WHERE
    LOWER(SPLIT_PART(gdp_usd, ' ', 2)) != 'trillion'
    -- alternative: LOWER(gdp_usd) NOT LIKE '%trillion'
    AND happiness_score IS null
;
