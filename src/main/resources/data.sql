-- DROP TABLE
DROP TABLE failure;
DROP TABLE overdue;
DROP TABLE wishbook;
DROP TABLE RESERVE;
DROP TABLE notification;
DROP TABLE user_penalty;
DROP TABLE loan;
DROP TABLE own_book;
DROP TABLE book;
DROP TABLE users;
-- -- -- --
-- -- -- -- -- DROP SEQUENCE
DROP SEQUENCE users_seq;
DROP SEQUENCE failure_seq;
DROP SEQUENCE loan_seq;
DROP SEQUENCE overdue_seq;
DROP SEQUENCE wishbook_seq;
DROP SEQUENCE reserve_seq;
DROP SEQUENCE notification_seq;
DROP SEQUENCE own_book_seq;
DROP SEQUENCE book_seq;
DROP SEQUENCE user_penalty_seq;

-- CREATE TABLE
CREATE SEQUENCE users_seq;
CREATE SEQUENCE failure_seq;
CREATE SEQUENCE loan_seq;
CREATE SEQUENCE overdue_seq;
CREATE SEQUENCE wishbook_seq;
CREATE SEQUENCE reserve_seq;
CREATE SEQUENCE notification_seq;
CREATE SEQUENCE own_book_seq;
CREATE SEQUENCE book_seq;
CREATE SEQUENCE user_penalty_seq;



CREATE TABLE users (
                       user_id NUMBER PRIMARY KEY,
                       id VARCHAR2(100),
                       password VARCHAR2(500),
                       name VARCHAR2(20),
                       email VARCHAR2(50),
                       created_at DATE,
                       birth VARCHAR2(20),
                       address VARCHAR2(100),
                       phone NUMBER,
                       role VARCHAR2(20),
                       address_checked NUMBER(1)
);

INSERT INTO users (user_id, id, password, name, email, created_at, birth, address, phone, role, address_checked) VALUES (users_seq.nextval, 'john_doe', 'hashedpassword123', 'John Doe', 'john.doe@example.com', SYSDATE, '1990-01-01', '123 Main St, City', 1234567890, 'ROLE_USER', 1);
INSERT INTO users (user_id, id, password, name, email, created_at, birth, address, phone, role, address_checked) VALUES (users_seq.nextval, 'jane_smith', 'anothersecurepassword', 'Jane Smith', 'jane.smith@example.com', SYSDATE, '1985-05-15', '456 Second St, City', 2345678901, 'ROLE_ADMIN', 0);
INSERT INTO users (user_id, id, password, name, email, created_at, birth, address, phone, role, address_checked) VALUES (users_seq.nextval, 'alice_jones', 'yetanotherpassword', 'Alice Jones', 'alice.jones@example.com', SYSDATE, '1992-08-25', '789 Third St, City', 3456789012, 'ROLE_USER', 1);

CREATE TABLE book (
                      isbn NUMBER PRIMARY KEY,
                      title VARCHAR2(200),
                      author VARCHAR2(3000),
                      publisher VARCHAR2(100),
                      publication_year DATE,
                      page_size NUMBER,
                      category_number VARCHAR2(100),
                      contents CLOB,
                      book_index CLOB,
                      image_url VARCHAR2(400)
);

INSERT INTO book (isbn, title, author, publisher, publication_year, page_size, category_number, contents, book_index, image_url) VALUES (1234567890, 'Sample Book', 'Jane Austen', 'Penguin', TO_DATE('2005-01-01', 'YYYY-MM-DD'), 300, 1, 'A large CLOB here...', 'Index of the book', 'http://example.com/image.jpg');
INSERT INTO book (isbn, title, author, publisher, publication_year, page_size, category_number, contents, book_index, image_url) VALUES (2345678901, 'Another Book', 'Leo Tolstoy', 'Vintage', TO_DATE('2010-01-01', 'YYYY-MM-DD'), 350, 2, 'Another large CLOB...', 'Index of second book', 'http://example.com/image2.jpg');
INSERT INTO book (isbn, title, author, publisher, publication_year, page_size, category_number, contents, book_index, image_url) VALUES (3456789012, 'Yet Another Book', 'Mark Twain', 'Harper', TO_DATE('2015-01-01', 'YYYY-MM-DD'), 280, 3, 'Yet another large CLOB...', 'Index of third book', 'http://example.com/image3.jpg');

CREATE TABLE own_book (
                          call_number VARCHAR2(50) PRIMARY KEY,
                          receipt_at DATE,
                          status VARCHAR2(20),
                          isbn NUMBER REFERENCES book(isbn) ON DELETE CASCADE
);

INSERT INTO own_book (call_number, receipt_at, status, isbn) VALUES ('1001', SYSDATE, 'Available', 1234567890);
INSERT INTO own_book (call_number, receipt_at, status, isbn) VALUES ('1002', SYSDATE, 'Loaned', 2345678901);
INSERT INTO own_book (call_number, receipt_at, status, isbn) VALUES ('1003', SYSDATE, 'In repair', 3456789012);


CREATE TABLE failure (
                         failure_id NUMBER PRIMARY KEY,
                         details VARCHAR2(500),
                         failure_at DATE,
                         compensation_amount NUMBER,
                         status VARCHAR2(20),
                         user_id NUMBER REFERENCES users(user_id) ON DELETE CASCADE,
                         call_number VARCHAR2(50) REFERENCES own_book(call_number) ON DELETE CASCADE
);

INSERT INTO failure (failure_id, details, failure_at, compensation_amount, status, user_id, call_number) VALUES (failure_seq.nextval, 'Missing pages', SYSDATE, 1500, 'Reported', 1, '1001');
INSERT INTO failure (failure_id, details, failure_at, compensation_amount, status, user_id, call_number) VALUES (failure_seq.nextval, 'Damaged cover', SYSDATE, 500, 'Pending', 2, '1002');
INSERT INTO failure (failure_id, details, failure_at, compensation_amount, status, user_id, call_number) VALUES (failure_seq.nextval, 'Loose binding', SYSDATE, 800, 'Resolved', 3, '1003');

CREATE TABLE loan (
                      loan_id NUMBER PRIMARY KEY,
                      started_at DATE,
                      ended_at DATE,
                      is_returned NUMBER(1),
                      extention_count NUMBER,
                      user_id NUMBER REFERENCES users(user_id) ON DELETE CASCADE,
                      call_number VARCHAR2(50) REFERENCES own_book(call_number) ON DELETE CASCADE
);

INSERT INTO loan (loan_id, started_at, ended_at, is_returned, extention_count, user_id, call_number) VALUES (loan_seq.nextval, SYSDATE, SYSDATE + 14, 0, 0, 1, '1001');
INSERT INTO loan (loan_id, started_at, ended_at, is_returned, extention_count, user_id, call_number) VALUES (loan_seq.nextval, SYSDATE, SYSDATE + 14, 0, 1, 2, '1002');
INSERT INTO loan (loan_id, started_at, ended_at, is_returned, extention_count, user_id, call_number) VALUES (loan_seq.nextval, SYSDATE, SYSDATE + 14, 0, 2, 3, '1003');

CREATE TABLE overdue (
                         loan_id NUMBER,
                         started_at DATE,
                         ended_at DATE,
                         late_fee NUMBER,
                         PRIMARY KEY (loan_id),
                         FOREIGN KEY (loan_id) REFERENCES loan(loan_id) ON DELETE CASCADE
);

INSERT INTO overdue (loan_id, started_at, ended_at, late_fee) VALUES (1, SYSDATE + 15, SYSDATE + 25, 100);
INSERT INTO overdue (loan_id, started_at, ended_at, late_fee) VALUES (2, SYSDATE + 16, SYSDATE + 26, 150);
INSERT INTO overdue (loan_id, started_at, ended_at, late_fee) VALUES (3, SYSDATE + 17, SYSDATE + 27, 200);

CREATE TABLE wishbook (
                          wishbook_id NUMBER PRIMARY KEY,
                          title VARCHAR2(100),
                          author VARCHAR2(30),
                          publisher VARCHAR2(30),
                          publication_year DATE,
                          request_at DATE,
                          status VARCHAR2(20),
                          user_id NUMBER REFERENCES users(user_id) ON DELETE CASCADE
);

INSERT INTO wishbook (wishbook_id, title, author, publisher, publication_year, request_at, status, user_id) VALUES (wishbook_seq.nextval, 'Dreams of Space', 'Neil Armstrong', 'SpaceBooks', TO_DATE('2022-01-01', 'YYYY-MM-DD'), SYSDATE, 'Pending', 1);
INSERT INTO wishbook (wishbook_id, title, author, publisher, publication_year, request_at, status, user_id) VALUES (wishbook_seq.nextval, 'Underwater Worlds', 'Jacques Cousteau', 'OceanPress', TO_DATE('2023-01-01', 'YYYY-MM-DD'), SYSDATE, 'Approved', 2);
INSERT INTO wishbook (wishbook_id, title, author, publisher, publication_year, request_at, status, user_id) VALUES (wishbook_seq.nextval, 'Mountains Beyond', 'Edmund Hillary', 'AdventureTime', TO_DATE('2024-01-01', 'YYYY-MM-DD'), SYSDATE, 'Requested', 3);

CREATE TABLE reserve (
                         reserve_id NUMBER PRIMARY KEY,
                         reserve_at DATE,
                         call_number VARCHAR2(50) REFERENCES own_book(call_number) ON DELETE CASCADE,
                         user_id NUMBER REFERENCES users(user_id) ON DELETE CASCADE
);

INSERT INTO reserve (reserve_id, reserve_at, call_number, user_id) VALUES (reserve_seq.nextval, SYSDATE, '1001', 1);
INSERT INTO reserve (reserve_id, reserve_at, call_number, user_id) VALUES (reserve_seq.nextval, SYSDATE, '1002', 2);
INSERT INTO reserve (reserve_id, reserve_at, call_number, user_id) VALUES (reserve_seq.nextval, SYSDATE, '1003', 3);


create table notification (
                              notification_id NUMBER PRIMARY KEY,
                              notification_at DATE,
                              user_id NUMBER REFERENCES users(user_id),
                              call_number VARCHAR2(50) REFERENCES own_book(call_number)
);

INSERT INTO notification (notification_id, notification_at, user_id, call_number) VALUES (notification_seq.nextval, SYSDATE, 1, '1001');
INSERT INTO notification (notification_id, notification_at, user_id, call_number) VALUES (notification_seq.nextval, SYSDATE, 2, '1002');
INSERT INTO notification (notification_id, notification_at, user_id, call_number) VALUES (notification_seq.nextval, SYSDATE, 3, '1003');

CREATE TABLE user_penalty (
                              loan_id NUMBER PRIMARY KEY,
                              started_at DATE,
                              ended_at DATE,
                              FOREIGN KEY (loan_id) REFERENCES loan(loan_id) ON DELETE CASCADE
);

INSERT INTO user_penalty (loan_id, started_at, ended_at) VALUES (1, SYSDATE + 28, SYSDATE + 38);
INSERT INTO user_penalty (loan_id, started_at, ended_at) VALUES (2, SYSDATE + 29, SYSDATE + 39);
INSERT INTO user_penalty (loan_id, started_at, ended_at) VALUES (3, SYSDATE + 30, SYSDATE + 40);

commit;

