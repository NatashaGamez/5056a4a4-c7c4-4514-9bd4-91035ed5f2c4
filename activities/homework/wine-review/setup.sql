
-- country table definition
CREATE TABLE IF NOT EXISTS country (
    id UUID,
    name TEXT NOT NULL,
    code TEXT,
    iso TEXT,
    population NUMERIC,
    area_km2 NUMERIC,
    gdp_usd TEXT,
    happiness_score NUMERIC,
    PRIMARY KEY (id)
);

-- wine table definition
CREATE TABLE IF NOT EXISTS wine (
    id UUID,
    country_id UUID REFERENCES country(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    variety TEXT,
    winery TEXT,
    designation TEXT,
    province TEXT,
    PRIMARY KEY (id)
);

-- taster table definition
CREATE TABLE IF NOT EXISTS taster (
    id UUID,
    name TEXT NOT NULL,
    gender TEXT NOT NULL,
    PRIMARY KEY (id)
);

-- review table definition
CREATE TABLE IF NOT EXISTS review (
    id UUID,
    wine_id UUID REFERENCES wine(id) ON DELETE CASCADE,
    taster_id UUID REFERENCES taster(id) ON DELETE CASCADE,
    points NUMERIC,
    price NUMERIC,
    PRIMARY KEY (id)
);
