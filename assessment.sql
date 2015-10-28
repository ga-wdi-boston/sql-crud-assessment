DROP DATABASE IF EXISTS "sql-crud-assessment";
CREATE DATABASE "sql-crud-assessment";
\pset pager 0
\c "sql-crud-assessment"

-- Question 1. Create a table called `licensees` to hold data in columns surname,given_name,gender,height,weight,dob,eye_color,hair_color.  See `data/licensees.csv` for example data.  Don't forget that all tables should have an id column as a unique identifier for a row.

CREATE TABLE licensees(
  id SERIAL PRIMARY KEY,
  surname CHARACTER VARYING,
  given_name CHARACTER VARYING,
  gender CHARACTER VARYING(1),
  height INTEGER,
  weight INTEGER,
  dob DATE,
  eye_color CHARACTER VARYING,
  hair_color CHARACTER VARYING
);

-- Question 2. Add `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.

INSERT INTO licensees(surname, given_name, gender, height, weight, dob, eye_color, hair_color)
VALUES('Bishop', 'Caren', 'f', 63, 132, '1943-09-26', 'Brown', 'Black');

-- Question 3. Load the data from `data/licensees.csv` into the `licensees` table.

\copy licensees(surname, given_name, gender, height, weight, dob, eye_color, hair_color) FROM 'data/licensees.csv' WITH (HEADER true, FORMAT csv) --you don't need a semi-colon here, right?

-- Question 4. Write a query to get all attributes of licensees with Hazel eye color and Brown or Black hair color.

SELECT eye_color FROM licensees
WHERE eye_color LIKE 'Hazel'
  AND ((eye_color LIKE 'Brown') OR (eye_color LIKE 'Black')
;

-- Question 5. Make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

UPDATE licensees
SET height = height - 1
WHERE (given_name = 'Marilynn' AND surname = 'Escobar') AND (given_name = 'Chris' AND surname = 'Whaley');

-- Question 6. Remove Dylan Rich and Teresita Myers from the table of licensees.

DELETE FROM licensees
WHERE (given_name = 'Dylan' AND surname = 'Rich') AND (given_name = 'Teresita' AND surname = 'Myers')
;
