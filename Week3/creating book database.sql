# SQL DAY 2
---------------------------------
## 5 BOOKS YOU HAVE READ + AUTHOR, AUTHOR COUNTRY, PAGES
DROP DATABASE IF EXISTS books;
CREATE DATABASE books;
USE books;
DROP TABLE IF EXISTS authors;
CREATE TABLE authors
(author_id INT AUTO_INCREMENT NOT NULL, name varchar(30), country varchar(20), #AUTO_INCREMENT - will create a new ID for a new author;
PRIMARY KEY(author_id)
);
DROP TABLE IF EXISTS  books;
CREATE TABLE books
(book_id INT NOT NULL, author_id INT, book_name varchar(50), pages INT NOT NULL, category varchar(20),
PRIMARY KEY (book_id)
);

## INSERTING INFO -
INSERT INTO authors(name, country)
VALUES ('CHARLES DUHIGG','USA'),('CRISTIANE CORREA', 'BRAZIL'),('JOHN GRISHAM', 'USA'),('HARLAN COBEN','USA');


