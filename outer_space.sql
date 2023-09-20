-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE "stars"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL
);
ALTER TABLE
    "stars" ADD PRIMARY KEY("id");
CREATE TABLE "galaxy"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "galaxy" ADD PRIMARY KEY("id");
CREATE TABLE "moons"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "planet_id" BIGINT NOT NULL
);
ALTER TABLE
    "moons" ADD PRIMARY KEY("id");
CREATE TABLE "planets"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "orbital_period_in_years" DOUBLE PRECISION NOT NULL,
    "star_id" INTEGER NOT NULL,
    "galaxy_id" INTEGER NOT NULL
);
ALTER TABLE
    "planets" ADD PRIMARY KEY("id");
ALTER TABLE
    "planets" ADD CONSTRAINT "planets_star_id_foreign" FOREIGN KEY("star_id") REFERENCES "stars"("id");
ALTER TABLE
    "planets" ADD CONSTRAINT "planets_galaxy_id_foreign" FOREIGN KEY("galaxy_id") REFERENCES "galaxy"("id");
ALTER TABLE
    "moons" ADD CONSTRAINT "moons_planet_id_foreign" FOREIGN KEY("planet_id") REFERENCES "planets"("id");