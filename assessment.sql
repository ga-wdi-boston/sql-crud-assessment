DROP DATABASE IF EXISTS "sql-crud-assessment";
CREATE DATABASE "sql-crud-assessment";
\pset pager 0
\c "sql-crud-assessment"

-- Question 1. Create a table called `licensees` to hold data in columns surname,given_name,gender,height,weight,dob,eye_color,hair_color.  See `data/licensees.csv` for example data.  Don't forget that all tables should have an id column as a unique identifier for a row.

CREATE TABLE licencees(
  P_Id int NOT NULL,
  surname CHARACTER VARYING(128),
  given_name CHARACTER VARYING(128),
  gender CHARACTER VARYING(1),
  height INTEGER,
  weight INTEGER,
  dob DATE,
  eye_color CHARACTER VARYING (10),
  hair_color CHARACTER VARYING (10),
  PRIMARY KEY (P_Id)
);
-- your code here

-- Question 2. Add `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.

INSERT INTO licensees(surname,given_name,gender,height,weight,dob,eye_color,hair_color) VALUES ('Bishop', 'Caren', 'f', 63, 132, '1943-09-26', 'Brown', 'Black');
-- your code here


-- Question 3. Load the data from `data/licensees.csv` into the `licensees` table.

\copy licensees(surname,given_name,gender,height,weight,dob,eye_color,hair_color) FROM 'data/licensees.csv' WITH (HEADER true, FORMAT csv);
-- your code here


-- Question 4. Write a query to get all attributes of licensees with Hazel eye color and Brown or Black hair color.

SELECT count(*), eye_color,hair_color
FROM licensees
WHERE eye_color = 'Hazel'
AND hair_color = 'Brown'
OR hair_color = 'Black'
GROUP BY eye_color
;
-- your code here


-- Question 5. Make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

UPDATE licensees
SET height = height -1
WHERE given_name = 'Dylan Rich'
AND given_name = 'Teresita Myers'
;
-- your code here


-- Question 6. Remove Dylan Rich and Teresita Myers from the table of licensees.

DELETE FROM licensees
WHERE given_name = 'Dylan Rich'
AND given_name = 'Teresita Myers'
;
-- your code here
