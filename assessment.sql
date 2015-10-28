DROP DATABASE IF EXISTS "sql-crud-assessment";
CREATE DATABASE "sql-crud-assessment";
\pset pager 0
\c "sql-crud-assessment"

-- Question 1. Create a table called `licensees` to hold data in columns surname,given_name,gender,height,weight,dob,eye_color,hair_color.  See `data/licensees.csv` for example data.  Don't forget that all tables should have an id column as a unique identifier for a row.

CREATE TABLE licensees (id SERIAL PRIMARY KEY,
  surname CHARACTER VARYING,
  given_name CHARACTER VARYING,
  gender CHARACTER VARYING,
  height CHARACTER VARYING,
  weight CHARACTER VARYING,
  dob CHARACTER VARYING,
  eye_color CHARACTER VARYING,
  hair_color CHARACTER VARYING
  );

Created Database, Created Table, Bulk Loaded Data

-- Question 2. Add `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.

INSERT INTO licensees (surname,given_name,gender,height,weight,dob,eye_color,hair_color)
VALUES ('Bishop', 'Caren', 'f', 63, 132, '1943-09-26', 'Brown', 'Black');

It worked!
SELECT * FROM licensees;
...
16 | Bishop    | Caren      | f      | 63     | 132    | 1943-09-26 | Brown     | Black

-- Question 3. Load the data from `data/licensees.csv` into the `licensees` table.

Opps! I did this step before I added Caren
\copy licensees(surname,given_name,gender,height,weight,dob,eye_color,hair_color) FROM './data/licensees.csv' WITH (FORMAT csv, HEADER true)

-- Question 4. Write a query to get all attributes of licensees with Hazel eye color and Brown or Black hair color.

It is telling me my syntax is wrong
SELECT * FROM licensees WHERE eye_color = Hazel WHERE hair_color = Brown WHERE hair_color = Black;

-- Question 5. Make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

-- your code here

-- Question 6. Remove Dylan Rich and Teresita Myers from the table of licensees.

-- your code here
