/*
 SECTION: Group exercises
 DESCRIPTION: Write a valid SQL query to solve each problem.
 */


-- A) Get all the unique department names.
<<<<<<< HEAD
SELECT DISTINCT
                department
FROM
     course;

-- B) Get the top 10 female students (first_name, last_name, age, gpa) with the best GPA scores and order by age (asc).
SELECT
	first_name AS "First Name", -- "renombrar", 'cadenas de texto'
	last_name AS "Last Name",
	age AS "Age",
	gpa AS "GPA"
FROM
	student
WHERE
	gender = 'female'
ORDER BY
	gpa DESC, --descendiente
	age ASC,
	first_name ASC,
	last_name ASC
LIMIT 10 -- solo 10 personas
;

-- C) Count the number of male/female students that are at least 25 years old.
SELECT
	gender AS "Gender",
	count(gender) AS "Count" -- para que funciones tiene que haber un GROUP BY
FROM
	student
WHERE
	age >= 25
GROUP BY gender
;

-- D) Get the number of male/female students that were accepted
SELECT
    s.gender,
    count(s.gender)
FROM
    student s INNER JOIN enrollment e ON s.id = e.student_id -- INNER JOIN = product cartesiano -- s=student; e=enrollment
WHERE
    e.approved = 1
GROUP BY
    s.gender
;
-- E) Get the min, average, and max GPA of the accepted male students that are less than 20 years old.
SELECT
    MIN(s.gpa),
    AVG(s.gpa),
    MAX(s.gpa)
FROM
    student s INNER JOIN enrollment e ON s.id = e.student_id
WHERE
    s.gender = 'male' AND s.age <=20 AND e.approved = 1
;

SELECT DISTINCT
    *
FROM
    (SELECT
            gender,
            MIN(gpa),
            AVG(gpa),
            MAX(gpa)
        FROM student INNER JOIN enrollment e on student.id = e.student_id
        WHERE student.age <=20 AND e.approved = 1
        GROUP BY gender
        ) gender_aggregate
WHERE
      gender_aggregate.gender = 'male'
;
-- F) Get the number of enrollments to courses that take longer than 2 years to finalize.
SELECT
    count(*)
FROM
    course c INNER JOIN enrollment e on c.id = e.course_id
WHERE
    c.years > 2 AND e.approved = 1
;

-- G) Get the number of male/female student that will take a course from the 'Statistics' department.
-- tenemos que involucrar las 3 tablas porque enrollment tiene los id's
-- group by lo agrupa en relac. a una variable
-- where filtro que aplico al resultado
SELECT
    gender,
    c.name,
    count(*)
FROM
    student s
        INNER JOIN enrollment e on s.id = e.student_id
        INNER JOIN course c on e.course_id = c.id
WHERE
    LOWER(c.department) LIKE 'stat%' --para no tener errores de mayus o minus
-- LIKE para buscar patrones con %
GROUP BY
    gender,
    c.name
;
=======

-- B) Get the top 10 female students (first_name, last_name, age, gpa) with the best GPA scores and order by age (asc).

-- C) Count the number of male/female students that are at least 25 years old.

-- D) Get the number of male/female students that were accepted

-- E) Get the min, average, and max GPA of the accepted male students that are less than 20 years old.

-- F) Get the number of enrollments to courses that take longer than 2 years to finalize.

-- G) Get the number of male/female student that will take a course from the 'Statistics' department.
>>>>>>> upstream/master


/*
 SECTION: Individual exercises
 DESCRIPTION: Write a valid SQL query to solve each problem.
 */

-- A) Count the number of courses per department
<<<<<<< HEAD
SELECT
    count(department)
FROM
    course
;

-- B) How many male/female students were accepted?
SELECT
    s.gender,
    count(s.gender)
FROM
    student s INNER JOIN enrollment e ON s.id = e.student_id -- INNER JOIN = product cartesiano -- s=student; e=enrollment
WHERE
    e.approved = 1
GROUP BY
    s.gender
;

-- C) How many students were accepted per course?
SELECT
    c.name,
    count(c.name)
FROM
     enrollment e INNER JOIN course c ON e.course_id = c.id
WHERE
    e.approved = 1
GROUP BY
    c.name
;

-- D) What's the average age and gpa per course?
SELECT
    AVG(s.gpa) AS "Average of student's GPA",
    AVG(s.age) AS "Average of student's age"
FROM
    student s INNER JOIN enrollment e ON s.id = e.student_id
WHERE
    e.approved = 1
;
-- E) Get the average number of years the enrolled (approved) female student will study.
SELECT
    AVG(years)
FROM
    student s
        INNER JOIN enrollment e on s.id = e.student_id
        INNER JOIN course c on e.course_id = c.id
WHERE
    e.approved = 1 AND s.gender = 'female'

-- termino
=======

-- B) How many male/female students were accepted?

-- C) How many students were accepted per course?

-- D) What's the average age and gpa per course?

-- E) Get the average number of years the enrolled (approved) female student will study.

>>>>>>> upstream/master
