-- drop test user if exists

DROP USER IF EXISTS 'whatabook_user'@'localhost';

 

-- create whatabook_user and grant them all privileges to the whatabook database

CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MYSQL8IsGreat!';

 

-- grant all privileges to the whatabook database to user whatabook_user on localhost


GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

 

-- drop contstraints if they exist

ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

-- drop tables if they exist

DROP TABLE IF EXISTS store;

DROP TABLE IF EXISTS book;

DROP TABLE IF EXISTS wishlist;

DROP TABLE IF EXISTS user;

 --   Create table(s)

 

CREATE TABLE user (

    user_id         INT         NOT NULL    AUTO_INCREMENT,

    first_name      VARCHAR(75) NOT NULL,

    last_name       VARCHAR(75) NOT NULL,

    PRIMARY KEY(user_id)

);

 

CREATE TABLE book (

    book_id     INT             NOT NULL    AUTO_INCREMENT,

    book_name   VARCHAR(200)    NOT NULL,

    author      VARCHAR(200)    NOT NULL,

    details     VARCHAR(500),

    PRIMARY KEY(book_id)

);

 

CREATE TABLE wishlist (

    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,

    user_id         INT         NOT NULL,

    book_id         INT         NOT NULL,

    PRIMARY KEY (wishlist_id),

    CONSTRAINT fk_book

    FOREIGN KEY (book_id)

        REFERENCES book(book_id),

    CONSTRAINT fk_user

    FOREIGN KEY (user_id)

        REFERENCES user(user_Id)

);

 

CREATE TABLE store (

    store_id    INT             NOT NULL    AUTO_INCREMENT,

    locale      VARCHAR(500)    NOT NULL,

    PRIMARY KEY(store_id)

);

 

 --   insert store record

 

INSERT INTO store(locale)

    VALUES('1611 Hill St, Little Rock, AR 75050');

 

 --   insert book records

 

INSERT INTO book(book_name, author, details)

    VALUES('The Martian', 'Andy Weir', 'Science Fiction');

 

INSERT INTO book(book_name, author, details)

    VALUES('The Alchemist', 'Paulo Coelho', "Story of Santiago a Youthful Spanish Shepherd");

 

INSERT INTO book(book_name, author, details)

    VALUES('Atomic Habits', 'James Clear', "An Easy and Proven Way to Build Good Habits");

 

INSERT INTO book(book_name, author, details)

    VALUES('The Four Agreement', 'Don Miguel Ruiz', 'A Practical Guide to Personal Freedom' );

 

INSERT INTO book(book_name, author, details)

    VALUES('The old man and the Sea', 'Ernest Hemingway','The Story Centres on an Aging Fisherman who Engages in an epic Battle to Catch a Giant Marlin');

 

INSERT INTO book(book_name, author, details)

    VALUES('The Fine Art of Small Talk', 'Debra Fine', 'How To Start a Conversation and Keep it Going');

 

INSERT INTO book(book_name, author, details)

    VALUES('The Compound Effect', 'Darren Hardy', 'Small Actions Executed Consistently can lead to successful Results');

   

INSERT INTO book(book_name, author, details)

    VALUES('IT Auditing','Mike Kegerreis, Mike Schiller, Chris Davis', 'Using Controls To Protect Information Assets');

 

INSERT INTO book(book_name, author, details)

    VALUES('Get Smart', 'Brian Tracy', 'How to Think and Act Like the Most Successful People');

 

 --   insert user

 

INSERT INTO user(first_name, last_name)

    VALUES('Ruth', 'Brown');

 

INSERT INTO user(first_name, last_name)

    VALUES('John', 'Smith');

 

INSERT INTO user(first_name, last_name)

    VALUES('Sarah', 'Jones');

 

  --  insert wishlist records

 

INSERT INTO wishlist(user_id, book_id)

    VALUES (

        (SELECT user_id FROM user WHERE first_name = 'Ruth'),

        (SELECT book_id FROM book WHERE book_name = 'Atomic Habits')

    );

 

INSERT INTO wishlist(user_id, book_id)

    VALUES (

        (SELECT user_id FROM user WHERE first_name = 'John'),

        (SELECT book_id FROM book WHERE book_name = 'The Four Agreements')

    );

 

INSERT INTO wishlist(user_id, book_id)

    VALUES (

        (SELECT user_id FROM user WHERE first_name = 'Sarah'),

        (SELECT book_id FROM book WHERE book_name = 'The Martian')

    );