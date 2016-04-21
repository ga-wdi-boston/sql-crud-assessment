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
