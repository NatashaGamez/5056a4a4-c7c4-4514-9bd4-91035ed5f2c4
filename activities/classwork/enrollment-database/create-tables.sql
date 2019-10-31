-- Create student table
CREATE TABLE IF NOT EXISTS student (
    id UUID,
    first_name TEXT,
    last_name TEXT,
    gender TEXT,
    gpa NUMERIC,
    age INT,
    PRIMARY KEY (id)
);

-- Create course table
CREATE TABLE IF NOT EXISTS course (
    id UUID,
    name TEXT,
    department TEXT,
    level TEXT,
    study_mode TEXT,
    years INT,
    PRIMARY KEY (id)
);

-- Create enrollment table
CREATE TABLE IF NOT EXISTS enrollment (
    id UUID,
    student_id UUID REFERENCES student(id) ON DELETE CASCADE,
    course_id UUID REFERENCES course(id) ON DELETE CASCADE,
    application_date DATE,
    approved INT,
    PRIMARY KEY (id)
);
