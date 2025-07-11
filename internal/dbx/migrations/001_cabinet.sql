-- +migrate Up
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE profiles (
    user_id     UUID PRIMARY KEY,

    username    VARCHAR(32) NOT NULL UNIQUE,
    pseudonym   VARCHAR(128),
    description VARCHAR(255),
    avatar      TEXT,
    official    BOOLEAN NOT NULL DEFAULT FALSE,

    username_updated_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at          TIMESTAMP NOT NULL DEFAULT now(),
    created_at          TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE biographies (
    user_id UUID PRIMARY KEY REFERENCES profiles(user_id) ON DELETE CASCADE,

    birthday         timestamp,
    sex              VARCHAR(64), -- TODO names from reference-svc in future
    city             VARCHAR(64), -- TODO names from reference-svc in future
    region           VARCHAR(64), -- TODO names from reference-svc in future
    country          VARCHAR(64), -- TODO names from reference-svc in future

    sex_updated_at              timestamp,
    nationality_updated_at      timestamp,
    primary_language_updated_at timestamp,
    residence_updated_at        timestamp
);

-- +migrate Down
DROP TABLE IF EXISTS biographies CASCADE;
DROP TABLE IF EXISTS profiles CASCADE;
