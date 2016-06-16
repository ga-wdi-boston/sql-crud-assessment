DROP DATABASE IF EXISTS "sql-crud-assessment";
CREATE DATABASE "sql-crud-assessment";
\pset pager 0
\c "sql-crud-assessment"

-- Question 1. Create a table called `licensees` to hold data in columns surname,
 -- given_name, gender, height, weight, born_on, eye_color, hair_color.  See `data/licensees.csv` for example data.  Don't forget that all tables should have an id column as a unique identifier for a row.

CREATE TABLE licensees (
  surname varchar,
  given_name varchar,
  gender varchar,
  height integer,
  weight integer,
  born_on date,
  eye_color varchar,
  hair_color varchar
);

-- Question 2. Add `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.

INSERT INTO licensees
(surname, given_name, gender, height, weight, born_on, eye_color, hair_color)
VALUES
('Bishop', 'Caren', 'f', 63, 132, '1943-09-26', 'Brown', 'Black');

-- After completing questions 1 and 2 uncomment the following to load data from `data/licensees.csv` into the `licensees` table.

\copy licensees(surname,given_name,gender,height,weight,born_on,eye_color,hair_color) FROM './data/licensees.csv' WITH (FORMAT csv, HEADER true)

-- Question 3. Write a query to get all attributes of licensees with Hazel eye color and Brown or Black hair color.

select from licensees WHERE eye_color = 'hazel' and WHERE hair_color = 'black' or 'brown';

-- Question 4. Make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.
ALTER TABLE licensees  where surname = Marilynn and given_name = Escobar set height = height - 1 ;

ALTER TABLE licensees  where surname = Chris and given_name = Whaley set height = height - 1 ;

-- Question 5. Remove Dylan Rich and Teresita Myers from the table of licensees.

DELETE FROM licensees where surname = Dylan and given_name = Rich

DELETE FROM licensees where surname = Teresita and given_name = Myers


-- your code here
