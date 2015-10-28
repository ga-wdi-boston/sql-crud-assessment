DROP DATABASE IF EXISTS "sql-crud-assessment";
CREATE DATABASE "sql-crud-assessment";
\pset pager 0
\c "sql-crud-assessment"

-- Question 1. Create a table called `licensees` to hold data in columns surname,given_name,gender,height,weight,dob,eye_color,hair_color.  See `data/licensees.csv` for example data.  Don't forget that all tables should have an id column as a unique identifier for a row.

CREATE TABLE licensees(
  id SERIAL PRIMARY KEY,
  surname CHARACTER VARYING,
  given_name CHARACTER VARYING,
  genderCHARACTER VARYING(1),
  height INTEGER,
  weight INTEGER,
  dob DATE,
  eye_color CHARACTER VARYING,
  hair_color CHARACTER VARYING)
;

-- Question 2. Add `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.
INSERT INTO licensees(surname,given_name,gender,height,weight,dob,eye_color,hair_color)
VALUES('Bishop', 'Caren', 'f', 63, 132, '1943-09-26', 'Brown', 'Black');

-- Question 3. Load the data from `data/licensees.csv` into the `licensees` table.

--assuming we're using a bulk_load script to do this action. Purposely setting the first line of the csv file as the table header
\copy licensees(surname,given_name,gender,height,weight,dob,eye_color,hair_color) FROM 'data/licensees.csv' WITH (HEADER true, FORMAT csv)

-- Question 4. Write a query to get all attributes of licensees with Hazel eye color and Brown or Black hair color.



-- not sure of syntax for selecting multiple columns with varying values
SELECT *
FROM licensees
WHERE eye_color = 'Hazel' AND hair_color = 'Brown'
  OR hair_color = 'Black'
;

-- Question 5. Make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.


-- same here, new at multipe 'where' syntax correctness
UPDATE licensees
SET height = height - 1
WHERE surname = 'Escobar' AND given_name = 'Marilynn',
WHERE surname = 'Whaley'
  AND given_name = 'Chris'
;

-- Question 6. Remove Dylan Rich and Teresita Myers from the table of licensees.


-- still new at syntax, not finding in documentation (yet) for multiple row deletion other than writing the delete block twice..

DELETE FROM licensees
  WHERE surname = 'Rich' AND given_name = 'Dylan',
  WHERE surname = 'Myers'
  AND given_name = 'Teresita'
  ;
