DROP DATABASE IF EXISTS westeros;
CREATE DATABASE westeros;
\c westeros

-- Question 1. Create two tables:
--   `houses` has the following columns: id (serial primary key), name (text), motto (text), and sigil (text)
--   `people` has an id ( serial primary key), name (text), title (text), quote (text), image (text), and age (integer)

-- your code starts here
CREATE TABLE houses (id SERIAL PRIMARY KEY, name TEXT, motto TEXT, sigil TEXT);

CREATE TABLE people (id SERIAL PRIMARY KEY, name TEXT, title TEXT, quote TEXT, image TEXT, age INTEGER);
-- your code ends here

-- Question 2. Load the data from `westeros/houses.csv` into the `houses` table and the data from `westeros/people.csv` into the `people` table.

-- your code starts here
\copy houses(name, motto, sigil) FROM './westeros/houses.csv' WITH (FORMAT csv, HEADER true)

\copy people(name, title, quote, image, age) FROM './westeros/people.csv' WITH (FORMAT csv, HEADER true)

-- your code ends here

-- Question 3. Insert `Cersei Baratheon,King Mother and Lady of Casterly Rock,"The gods have no mercy, that’s why they’re gods.",http://i.imgur.com/jYeeCJ3.jpg,40`
-- into the people table, and `House Baratheon,Ours is the fury.,http://i.imgur.com/iJtBKIR.png`
-- into the houses table

-- your code starts here

INSERT INTO people(name, title, quote, image, age)
  VALUES ('Cersei Baratheon','King Mother and Lady of Casterly Rock','The gods have no mercy, that’s why they’re gods.', 'http://i.imgur.com/jYeeCJ3.jpg,40')

INSERT INTO houses(name, motto, sigil)
  VALUES ('Baratheon', 'Ours is the fury.', 'http://i.imgur.com/iJtBKIR.png')

-- your code ends here

-- Question 4. Write a query to get all attributes of people greater than a certain age *or* having a specific title.

-- your code starts here
SELECT *
FROM people
WHERE age > 14
  OR title = 'Deceased'
ORDER BY age;
-- your code ends here

-- Question 5. Change the motto of one of your houses. Look it up by its name.

-- your code starts here
UPDATE houses
SET motto = 'WEDDING ARE A BITCH'
WHERE name = 'Robb Stark'
-- your code ends here

-- Question 6. Kill off, er, I mean delete one of the people. Look them up by their title.

-- your code starts here
DELETE FROM people
WHERE title = 'Wormchow'
-- your code ends here
