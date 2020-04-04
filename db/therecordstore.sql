DROP TABLE records;
DROP TABLE artists;
DROP TABLE labels;

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  contact VARCHAR(255)
);

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  label_id INT REFERENCES labels(id) ON DELETE CASCADE
);

CREATE TABLE records (
  id SERIAL PRIMARY KEY,
  record_name VARCHAR(255),
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE,
  genre VARCHAR (255),
  stock INT,
  buying_cost INT,
  selling_price INT
);
