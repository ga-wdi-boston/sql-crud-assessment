DROP DATABASE IF EXISTS westeros;
CREATE DATABASE westeros;
\c westeros

-- Question 1. Create two tables:
--   `houses` has the following columns: id (serial primary key), name (text), motto (text), and sigil (text)
--   `people` has an id ( serial primary key), name (text), title (text), quote (text), image (text), and age (integer)

CREATE TABLE houses (id SERIAL PRIMARY KEY, name TEXT, motto TEXT, sigil TEXT);

CREATE TABLE people (id SERIAL PRIMARY KEY, name TEXT, title TEXT, quote TEXT, image TEXT, age INTEGER);

-- Question 2. Load the data from `westeros/houses.csv` into the `houses` table and the data from `westeros/people.csv` into the `people` table.

\copy houses(name, motto, sigil) FROM './westeros/houses.csv' WITH (FORMAT csv, HEADER true);

\copy people(name, title, quote, image, age) FROM './westeros/people.csv' WITH (FORMAT csv, HEADER true);

-- Question 3. Insert `Cersei Baratheon,King Mother and Lady of Casterly Rock,"The gods have no mercy, that’s why they’re gods.",http://i.imgur.com/jYeeCJ3.jpg,40`
-- into the people table, and `House Baratheon,Ours is the fury.,http://i.imgur.com/iJtBKIR.png`
-- into the houses table

INSERT INTO people(name, title, quote, image) VALUES ('Cersei Baratheon', 'King Mother and Lady of Casterly Rock', '"The gods have no mercy, that’s why they’re gods."', 'http://i.imgur.com/jYeeCJ3.jpg,40');

INSERT INTO houses (name, motto, sigil) VALUES ('House Baratheon', 'Ours is the fury.', 'http://i.imgur.com/iJtBKIR.png');

-- Question 4. Write a query to get all attributes of people greater than a certain age *or* having a specific title.

SELECT *
FROM people
WHERE age > 11
  OR title = 'Princess'
ORDER BY age ASC;


-- Question 5. Change the motto of one of your houses. Look it up by its name.

UPDATE houses
SET motto = 'New motto, who dis?'
WHERE name = 'House Stark';


-- Question 6. Kill off, er, I mean delete one of the people. Look them up by their title.

DELETE FROM people
WHERE title = 'Wormchow';
