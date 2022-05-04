PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT,
  lname TEXT
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT,
  author_id INTEGER,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE if EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT,
  question_id INTEGER,
  user_id INTEGER,
  parent_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

DROP TABLE if EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO users (fname, lname) VALUES ('John', 'Doe');
INSERT INTO users (fname, lname) VALUES ('Jane', 'Doe');
INSERT INTO users (fname, lname) VALUES ('John', 'Smith');
INSERT INTO users (fname, lname) VALUES ('Jane', 'Smith');

INSERT INTO questions (title, body, author_id) VALUES ('What is the best programming language?', 'I am not sure', 1);
INSERT INTO questions (title, body, author_id) VALUES ('What is the best framework?', 'I am not sure', 2);
INSERT INTO questions (title, body, author_id) VALUES ('What is the best database?', 'I am not sure', 3);

INSERT INTO question_follows (user_id, question_id) VALUES (1, 1);
INSERT INTO question_follows (user_id, question_id) VALUES (2, 1);
INSERT INTO question_follows (user_id, question_id) VALUES (3, 2);

INSERT INTO replies (body, question_id, user_id) VALUES ('I think it is the best', 1, 1);
INSERT INTO replies (body, question_id, user_id) VALUES ('I think it is the beeeest', 1, 2);
INSERT INTO replies (body, question_id, user_id, parent_id) VALUES ('I think it is the worst', 1, 3, 1);

INSERT INTO question_likes (user_id, question_id) VALUES (1, 1);
INSERT INTO question_likes (user_id, question_id) VALUES (2, 1);
INSERT INTO question_likes (user_id, question_id) VALUES (3, 2);
