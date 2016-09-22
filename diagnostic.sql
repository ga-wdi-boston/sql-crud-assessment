DROP DATABASE IF EXISTS "sql-crud-assessment";
CREATE DATABASE "sql-crud-assessment";
\pset pager 0
\c "sql-crud-assessment"

-- Question 1. Create a table called `licensees` to hold data in columns surname, given_name, gender, height, weight, born_on, eye_color, hair_color.  See `data/licensees.csv` for example data.  Don't forget that all tables should have an id column as a unique identifier for a row.

CREATE TABLE licensees
(
  id INTEGER PRIMARY KEY
  surname TEXT(50)
  given_name TEXT(50)
  gender CHAR(1)
  height CHAR(4)
  weight NUMBER(4)
  born_on DATE
  eye_color TEXT(50)
  hair_color TEXT(50)
);

-- Question 2. Add `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.

INSERT into licensees VALUES ('Bishop', 'Caren', 'f', 63, 132, 1943-09-26, 'Brown', 'Black');

-- After completing questions 1 and 2 uncomment the following to load data from `data/licensees.csv` into the `licensees` table.

\copy licensees(surname,given_name,gender,height,weight,born_on,eye_color,hair_color) FROM './data/licensees.csv' WITH (FORMAT csv, HEADER true)

-- Question 3. Write a query to get all attributes of licensees with Hazel eye color and Brown or Black hair color.

SELECT * FROM licensees WHERE eye_color = 'Brown' AND hair_color = 'BROWN' OR 'Black'

-- Question 4. Make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

UPDATE licensees WHERE surname = 'Escobar' OR 'Whaley' SET height = height + 1;

-- Question 5. Remove Dylan Rich and Teresita Myers from the table of licensees.

DELETE FROM licensees WHERE given_name = 'Dylan' OR 'Teresita'
