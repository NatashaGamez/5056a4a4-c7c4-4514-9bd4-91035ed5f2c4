
-- load country table
\copy country FROM './data/country.csv' DELIMITER ',' CSV HEADER;

-- load wine table
\copy wine FROM './data/wine.csv' DELIMITER ',' CSV HEADER;

-- load taster table
\copy taster FROM './data/taster.csv' DELIMITER ',' CSV HEADER;

-- load review table
\copy review FROM './data/review.csv' DELIMITER ',' CSV HEADER;
