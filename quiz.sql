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
INSERT INTO houses(name, moto, sigil) VALUES('Bolton', 'Our blades are sharp.', 'http://i.imgur.com/uPoc9Jh.jpg');
INSERT INTO people(name, title, quote, image, age VALUES(Daenerys Targaryen, Queen of Meereen and Mother of Dragons, "I will take what is mine with blood and fire.", 'http://i.imgur.com/DjHJq4E.jpg', '18')
-- your code ends here

-- Question 3. Insert `Cersei Baratheon,King Mother and Lady of Casterly Rock,"The gods have no mercy, that’s why they’re gods.",http://i.imgur.com/jYeeCJ3.jpg,40`
-- into the people table, and `House Baratheon,Ours is the fury.,http://i.imgur.com/iJtBKIR.png`
-- into the houses table

-- your code starts here
INSERT INTO people(name, motto, sigil) VALUES('Cersei Baratheon', 'King Mother and Lady of Casterly Rock', "The gods have no mercy, that''s why they''re gods.", 'http://i.imgur.com/jYeeCJ3.jpg', '40');

INSERT INTO houses(name, motto, sigil) VALUES('House Baratheon', 'Ours is the fury.', 'http://i.imgur.com/iJtBKIR.png');
-- your code ends here

-- Question 4. Write a query to get all attributes of people greater than a certain age *or* having a specific title.

-- your code starts here
SELECT *
FROM people
WHERE age > ''
  OR title = ''
  AND gender = 'f'
-- your code ends here

-- Question 5. Change the motto of one of your houses. Look it up by its name.

-- your code starts here
UPDATE houses
SET motto = 'Second motto'
WHERE motto = 'Our blades are sharp'
  AND given_name = 'Bolton';
-- your code ends here

-- Question 6. Kill off, er, I mean delete one of the people. Look them up by their title.

-- your code starts here

-- your code ends here
