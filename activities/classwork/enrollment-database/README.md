# Enrollment Database

The enrollment-database contains data resembling the following: 

* `student`

| id | first_name | last_name  | gender | gpa | age |
|----|------------|------------|--------|-----|-----|
| 1  | Amelia     | O'Sullivan | female | 3.7 | 20  |
| 2  | Rachel     | Stevens    | female | 3.5 | 25  |
| 3  | Sarah      | Dunn       | female | 3.2 | 23  |
| 4  | Liam       | Baker      | male   | 3.3 | 24  |
| 5  | Andrew     | Owens      | male   | 3.0 | 24  |

* `course`

| id | name                                               | department  | level     | study_mode | years |
|----|----------------------------------------------------|-------------|-----------|------------|-------|
| 1  | Mathematical and Computational Finance             | Mathematics |MSc       | Full time  | 1     |
| 2  | Modern Statistics and Statistical Machine Learning | Mathematics |EPSRC CDT | Part time  | 8     |
| 3  | Particle Physics                                   | Mathematics |DPhil     | Full time  | 4     |

* `enrollment`

| id | student_id | course_id | application_date | approved |
|----|------------|-----------|------------------|----------|
| 1  | 3          | 2         | 2019-01-01       | 1        |
| 2  | 2          | 2         | 2019-01-05       | 1        |
| 3  | 4          | 1         | 2019-01-05       | 0        |
| 4  | 1          | 2         | 2019-01-07       | 1        |


## Setup

Install docker & docker-compose and run the setup script: 

```commandline
$ bash setup.sh
```

Load the environment variables: `export $(cat .env | xargs)`

Start the application: `docker-compose up -d`

Check out the logs: 

```commandline
$ docker logs -f enrollment-database
```

Create tables: 

```commandline
$ psql $ITESO_DATABASE_LOCAL_URL -f create-tables.sql
```

Load data command for `student` table: 

```commandline
$ psql $ITESO_DATABASE_LOCAL_URL -c "\copy student FROM './data/student.csv' DELIMITER ',' CSV HEADER;"
``` 

Load data command for `course` table: 

```commandline
$ psql $ITESO_DATABASE_LOCAL_URL -c "\copy course FROM './data/course.csv' DELIMITER ',' CSV HEADER;"
```

Load data command for `enrollemnt` table: 

```commandline
$ psql $ITESO_DATABASE_LOCAL_URL -c "\copy enrollment FROM './data/enrollment.csv' DELIMITER ',' CSV HEADER;"
```

## Usage

Start the application with: `docker-compose up -d`


You can use a `psql` client to enter the database: 

```commandline
$ psql $ITESO_DATABASE_LOCAL_URL 
```

Or use the `pgadmin` web-app at: http://localhost:80 

## Shutdown

To shutdown the application, run: `docker-compose down` 