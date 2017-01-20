\c ggalante

DROP USER IF EXISTS "michael";

CREATE USER "michael" WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS "todo_app";

CREATE DATABASE "todo_app";

\c todo_app;

CREATE TABLE "tasks" (
  id serial NOT NULL,
  title varchar(255) NOT NULL,
  description text NULL,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NULL,
  completed boolean NOT NULL DEFAULT FALSE
);

ALTER TABLE "tasks" ADD PRIMARY KEY (id);

ALTER TABLE "tasks" DROP COLUMN completed;

ALTER TABLE "tasks" ADD COLUMN completed_at timestamp DEFAULT NULL;

ALTER TABLE "tasks" ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE "tasks" ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO "tasks" (title, description, created_at, updated_at, completed_at) VALUES ('Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO "tasks" (title, description) VALUES ('Study PostgresSQL', 'Read all the documentation');

SELECT title FROM "tasks" WHERE completed_at IS NOT NULL;

UPDATE "tasks" SET completed_at = now() WHERE title = 'Study SQL';

SELECT title, description FROM "tasks" WHERE completed_at IS NOT NULL;

SELECT * FROM "tasks" ORDER BY created_at DESC;

INSERT INTO "tasks" (title, description) VALUES ('mistake 1', 'a test entry');

INSERT INTO "tasks" (title, description) VALUES ('mistake 2', 'another test entry');

INSERT INTO "tasks" (title, description) VALUES ('third mistake', 'another test entry');

SELECT title FROM "tasks" WHERE title::text LIKE '%mistake&';

DELETE FROM "tasks" WHERE title = 'mistake 1';

SELECT title, description FROM "tasks" WHERE title::text LIKE '%mistake%';

DELETE FROM "tasks" WHERE title::text LIKE '%mistake%';

SELECT FROM "tasks" ORDER BY title ASC;
