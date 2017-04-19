DROP DATABASE IF EXISTS "sql-diagnostic";
CREATE DATABASE "sql-diagnostic";
\pset pager 0
\c "sql-diagnostic"

-- Question 1. Create a table called `licensees` to hold data in columns surname, given_name, gender, height, weight, born_on, eye_color, hair_color.  See `data/licensees.csv` for example data.  Don't forget that all tables should have an id column as a unique identifier for a row.

CREATE TABLE licensees (
  surname = text
  given_name = text
  gender = text
  height = integer
  weight = integer
  born_on = date
  eye_color = text
  hair_color = text
);
-- Question 2. Add `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.

INSERT INTO licensees (surname, given_name, gender, height, weight, born_on, eye_color, hair_color) VALUES ('Bishop', 'Caren', 'f', 63, 132, '1943-09-26', 'Brown', 'Black')

-- After completing questions 1 and 2 uncomment the following to load data from `data/licensees.csv` into the `licensees` table.

\copy licensees(surname,given_name,gender,height,weight,born_on,eye_color,hair_color) FROM './data/licensees.csv' WITH (FORMAT csv, HEADER true)

-- Question 3. Write a query to get all attributes of licensees with Hazel eye color and Brown or Black hair color.

SELECT * FROM licensees WHERE eye_color='Hazel' AND hair_color=('Brown || Black')

-- Question 4. Make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

UPDATE licensees SET height = height-1 WHERE surname='Escobar' AND given_name='Marilyn'
UPDATE licensees SET height = height-1 WHERE surname='Whaley' AND given_name='Chris'

-- Question 5. Remove Dylan Rich and Teresita Myers from the table of licensees.

DELETE FROM licensees WHERE surname='Rich' AND given_name='Dylan'
DELETE FROM licensees WHERE surname='Myers' AND given_name='Teresita'
