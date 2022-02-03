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
(book_id INT AUTO_INCREMENT NOT NULL, 
author_id INT, 
book_name varchar(100), 
pages INT NOT NULL,
category varchar(30),
PRIMARY KEY (book_id),
KEY idx_fk_author(author_id),
CONSTRAINT fk_author_id FOREIGN KEY (author_id)
REFERENCES authors(author_id) ON DELETE RESTRICT ON UPDATE CASCADE #
);

## INSERTING INFO -
INSERT INTO authors(name, country)
VALUES ('CHARLES DUHIGG','USA'),
('CRISTIANE CORREA', 'BRAZIL'),
('JOHN GRISHAM', 'USA'),
('HARLAN COBEN','USA');

INSERT INTO books(author_id,book_name, pages, category)
VALUES (1,'Power of Habit: Why we do what we do in life and business?', '371','Non-fiction'),
(2,'Sonho Grande', '264','Non-fiction'),
(3, 'The Reckoning', '480', 'Suspense'),
(4, 'Tell No One', '384', 'Suspense'),
(4, 'The Final Detal', '386', 'Suspense');

# update the table without deleting
# UPDATE books set book_name = 'Invisible Women'
# WHERE book_id = 2;

# update the table without deleting
# UPDATE books set author_id = 'Invisible Women' # only possible because author_id in this table is a FK key. Not possible when it's PK.
# WHERE book_id = 2;

SELECT b.category, count(b.book_name) as no_of_books, count(distinct a.author_id) as no_of_authors
FROM books b JOIN authors a
USING(author_id)
GROUP BY b.category;

# CREATE A DENORMALISED VIEW
CREATE OR REPLACE VIEW authorsandbooks AS
SELECT * from books JOIN authors USING (author_id)