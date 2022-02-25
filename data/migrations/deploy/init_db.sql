-- Deploy testUnitaire_errorDebug_validatorSchema:init_db to pg

BEGIN;

CREATE TABLE noun (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  label TEXT NOT NULL UNIQUE
);
CREATE TABLE adjective (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  label TEXT NOT NULL UNIQUE
);
CREATE TABLE verb (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  label TEXT NOT NULL UNIQUE
);
CREATE TABLE complement (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  label TEXT NOT NULL UNIQUE
);
CREATE TABLE sentence (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  noun_id INT NOT NULL REFERENCES noun(id),
  adjective_id INT NOT NULL REFERENCES adjective(id),
  verb_id INT NOT NULL REFERENCES verb(id),
  complement_id INT NOT NULL REFERENCES complement(id),
  clean_version TEXT NOT NULL,
  score INT NOT NULL DEFAULT 0
);

COMMIT;
