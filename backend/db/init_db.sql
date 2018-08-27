CREATE DATABASE kanban;

\c kanban;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  username VARCHAR(100) not null,
  password VARCHAR(100) not null,
  token JSONB
);
CREATE INDEX ON users (username);

INSERT INTO users (username, password, token) VALUES ('admin', '$2a$10$O2M5bP4NUCxQ0xJmSXDEEOE9a40T08G5nTwu0ax21.valMcl66hQa', '{}');

CREATE TABLE IF NOT EXISTS lists (
  id SERIAL not null primary key,
  ordinal INT not null,
  title VARCHAR(255) not null
);

INSERT INTO lists (ordinal, title) VALUES ('1', 'FirstList'), ('2', 'SecondList'), ('3', 'ThirdList');