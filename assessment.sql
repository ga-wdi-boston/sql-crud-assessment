DROP DATABASE IF EXISTS "sql-crud-assessment";
CREATE DATABASE "sql-crud-assessment";
\pset pager 0
\c "sql-crud-assessment"

-- Question 1. Create a table called `licensees` to hold data in columns surname,given_name,gender,height,weight,dob,eye_color,hair_color.  See `data/licensees.csv` for example data.  Don't forget that all tables should have an id column as a unique identifier for a row.

-- CREATE TABLE licensees(
  --in: create_table/licensees.sql
id SERIAL PRIMARY KEY,
surname CHARACTER VARYING,
given_name CHARACTER VARYING,
gender CHARACTER (1),
height INTEGER,
weight INTEGER,
dob DATE,
eye_color CHARACTER VARYING,
hair_color CHARACTER VARYING
);
--in psql --in psql: \i scripts/create_table/licensees.sql
-- Question 2. Add `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.
--in insert_data/licensees.sql--
INSERT INTO licensees(surname,given_name, gender, height, weight, dob, eye_color, hair_color)
VALUES (`Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black`);
--in psql \i scripts/insert_into/licensees.sql

-- Question 3. Load the data from `data/licensees.csv` into the `licensees` table.

-- bulk load licensee data
\copy licensees(surname,given_name, gender, height, weight, dob, eye_color, hair_color)FROM 'data/licensees.csv' WITH (HEADER true, FORMAT csv)
--psql \i scripts/bulk_load/licensees.sql
-- Question 4. Write a query to get all attributes of licensees with Hazel eye color and Brown or Black hair color.
--in psql:
SELECT * FROM licensees WHERE eye_color IS 'Hazel', 'Brown','Black';
--in select_from/licensees.sql:
SELECT count(*), eye_color
FROM licensees
WHERE eye_color IS 'Hazel',
WHERE eye_color IS 'Brown',
WHERE eye_color IS 'Black'

;
--psql \i scripts/select_from/licensees.sql

-- Question 5. Make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

--UPDATE licensees
--imaginaryfolder_update/licensees.sql
SET height = height - 1
WHERE given_name is 'Marilynn Escobar',
WHERE given_name is 'Marilynn Escobar'
;

--psql \i scripts/insert_into/licensees.sql
-- Question 6. Remove Dylan Rich and Teresita Myers from the table of licensees.

-- your code here
