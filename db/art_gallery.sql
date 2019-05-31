DROP TABLE exhibitions;
DROP TABLE artists;



CREATE TABLE artists (
  id serial4 primary key,
  artist_name varchar(255)
);

CREATE TABLE exhibitions (
  id serial4 primary key,
  exhibition_name varchar(255),
  exhibition_date int2,
  fee int2,
  artist_id INT8 references artists(id)
);
