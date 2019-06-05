DROP TABLE exhibitions;
DROP TABLE artists;



CREATE TABLE artists (
  id serial4 primary key,
  name varchar(255)
);

CREATE TABLE exhibitions (
  id serial4 primary key,
  name varchar(255),
  opening varchar(225),
  closing varchar(225),
  artist_id INT2 REFERENCES artists(id) ON DELETE CASCADE,
  entry_fee INT2
);
