DROP DATABASE IF EXISTS "sql-crud-assessment";
CREATE DATABASE "sql-crud-assessment";
\pset pager 0
\c "sql-crud-assessment"

-- Question 1. Create a table called `licensees` to hold data in columns surname,given_name,gender,height,weight,dob,eye_color,hair_color.  See `data/licensees.csv` for example data.  Don't forget that all tables should have an id column as a unique identifier for a row.

create table licensees(
  id serial primary key,
  surname character varying,
  given_name character varying,
  gender character varying(1),
  height integer,
  weight integer,
  dob date,
  eye_color character varying,
  hair_color character varying
);

-- Question 2. Add `Bishop, Caren, f, 63, 132, 1943-09-26, Brown, Black` into the table of licensees.

insert into licensees (surname, given_name, gender, height, weight, dob, eye_color, hair_color)
values ('Bishop', 'Caren', 'f', 63, 132, '1943-09-26', 'Brown', 'Black');

-- Question 3. Load the data from `data/licensees.csv` into the `licensees` table.

\copy licensees(surname, given_name, gender, height, weight, dob, eye_color, hair_color) from 'data/licensees.csv' with (header true, format csv)

-- Question 4. Write a query to get all attributes of licensees with Hazel eye color and Brown or Black hair color.

select *
from licensees
where eye_color = 'Hazel'
and (hair_color = 'Brown'
or hair_color = 'Black');

-- Question 5. Make each of Marilynn Escobar and Chris Whaley one inch shorter. Look them up by their names.

update licensees
set height = height - 1
where (given_name = 'Marilynn' and surname = 'Escobar')
or (given_name = 'Chris' and surname = 'Whaley');

-- Question 6. Remove Dylan Rich and Teresita Myers from the table of licensees.

delete from licensees
where (given_name = 'Dylan' and surname = 'Rich')
or (given_name = 'Teresita' and surname = 'Myers');
