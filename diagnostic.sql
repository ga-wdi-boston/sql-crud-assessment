DROP DATABASE IF EXISTS "sql-crud-assessment";
CREATE DATABASE "sql-crud-assessment";
\pset pager 0
\c "sql-crud-assessment"

-- Question 1. Create a table called `licensees` to hold data in columns surname, given_name, gender, height, weight, born_on, eye_color, hair_color.  See `data/licensees.csv` for example data.  Don't forget that all tables should have an id column as a unique identifier for a row.

create database "sql-crud-assessment";
\c "sql-crud-assessment"
\i scripts/licensees.sql

create table licensees (
  id serial primary key,
  surname text,
  given_name text,
  gender text,
  height double precision,
  weight double precision,
  born_on date,
  eye_color text,
  hair_color text
);

-- Question 2. Add `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.

\i scripts/insert_into.sql

insert into licensees(surname,given_name,gender,height,weight,born_on,eye_color,hair_color)
values
('Bishop', 'Caren', 'f', 63, 132, '1943-09-26', 'Brown', 'Black');

-- After completing questions 1 and 2 uncomment the following to load data from `data/licensees.csv` into the `licensees` table.

\copy licensees(surname,given_name,gender,height,weight,born_on,eye_color,hair_color) FROM './data/licensees.csv' WITH (FORMAT csv, HEADER true)

-- Question 3. Write a query to get all attributes of licensees with Hazel eye color and Brown or Black hair color.

\i scripts/select_from.sql
select count(*), gender
from licensees
where eye_color = 'Hazel'
where hair_color = 'Brown' OR 'Black'
;

-- Question 4. Make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

\i scripts/update.sql
update licensees
set height = height + 1
where surname = 'Escobar'
;

update licensees
set height = height - 1
where surname = 'Whaley'
;

-- Question 5. Remove Dylan Rich and Teresita Myers from the table of licensees.

DELETE FROM licensees WHERE surname = 'Rich';
DELETE FROM licensees WHERE surname = 'Myers';
