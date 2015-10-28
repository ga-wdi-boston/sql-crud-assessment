DROP DATABASE IF EXISTS "sql-crud-assessment";
CREATE DATABASE "sql-crud-assessment";
\pset pager 0
\c "sql-crud-assessment"

-- Question 1. Create a table called `licensees` to hold data in columns surname,given_name,gender,height,weight,dob,eye_color,hair_color.  See `data/licensees.csv` for example data.  Don't forget that all tables should have an id column as a unique identifier for a row.

Create table licensees(
  id serial primary key,
  surname character varying,
  given_name character varying,
  gender character varying(1),
  height integer,
  weight, integer,
  dob date,
  eye_color character varying,
  hair_color character varying
);
-- Question 2. Add `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.

INSERT into licensees(surname,given_name,gender,height,weight,dob, eye_color, hair_color)
VALUES('Bishop', 'Caren', 'f', 63, 132, '1943-09-26', 'Brown', 'Black')
;

-- Question 3. Load the data from `data/licensees.csv` into the `licensees` table.

-- **THIS IS PSQL BUT THIS IS HOW WE WERE TAUGHT**

\copy licensees(surname,given_name,gender,height,weight,dob, eye_color, hair_color) FROM 'data/licensees.csv' WITH( HEADER true, FORMAT csv)
;


-- Question 4. Write a query to get all attributes of licensees with Hazel eye color and Brown or Black hair color.

select *
from licensees
where eye_color = 'Hazel'
  and hair_color = 'Brown'
  or hair_color = 'Black'
  ;
-- Question 5. Make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

Update licensees
set height = height - 1
where surname = 'Marylynn'
  and given_name = 'Escobar'
  or surname = 'Chris'
  and given_name = 'Whaley'
;
-- Question 6. Remove Dylan Rich and Teresita Myers from the table of licensees.

Delete from licensees
where surname = 'Dylan'
  and given_name = 'Rick'
  or surname = 'Teresita'
  and given_name = 'Myers'
;
