CREATE DATABASE Albums;
USE Albums;

Create table information(
	id INT AUTO_INCREMENT PRIMARY KEY,
	album_name varchar(255),
    album_author varchar(255),
    album_cover varchar(255),
    album_stock SMALLINT
);

INSERT INTO information (album_name, album_author, album_cover, album_stock) 
VALUES ('Nectar', 'Joji', 'https://i.imgur.com/Cc822Ym.png', 777);

SELECT * FROM information;
TRUNCATE TABLE information;
DROP TABLE information;