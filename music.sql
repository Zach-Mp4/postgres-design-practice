-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE "artists_songs"(
    "id" SERIAL NOT NULL,
    "artist_id" BIGINT NOT NULL,
    "song_id" BIGINT NOT NULL
);
ALTER TABLE
    "artists_songs" ADD PRIMARY KEY("id");
CREATE TABLE "songs"(
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "duration_in_seconds" BIGINT NOT NULL,
    "release_date" DATE NOT NULL
);
ALTER TABLE
    "songs" ADD PRIMARY KEY("id");
CREATE TABLE "artists"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "monthly_listeners" BIGINT NOT NULL
);
ALTER TABLE
    "artists" ADD PRIMARY KEY("id");
CREATE TABLE "albums_songs"(
    "id" SERIAL NOT NULL,
    "song_id" BIGINT NOT NULL,
    "album_id" BIGINT NOT NULL
);
ALTER TABLE
    "albums_songs" ADD PRIMARY KEY("id");
CREATE TABLE "producers_songs"(
    "id" SERIAL NOT NULL,
    "song_id" BIGINT NOT NULL,
    "producer_id" BIGINT NOT NULL
);
ALTER TABLE
    "producers_songs" ADD PRIMARY KEY("id");
CREATE TABLE "albums_artists"(
    "id" SERIAL NOT NULL,
    "artist_id" BIGINT NOT NULL,
    "album_id" BIGINT NOT NULL
);
ALTER TABLE
    "albums_artists" ADD PRIMARY KEY("id");
CREATE TABLE "producers"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "producers" ADD PRIMARY KEY("id");
CREATE TABLE "albums"(
    "id" SERIAL NOT NULL,
    "album_name" TEXT NOT NULL
);
ALTER TABLE
    "albums" ADD PRIMARY KEY("id");
ALTER TABLE
    "albums_songs" ADD CONSTRAINT "albums_songs_song_id_foreign" FOREIGN KEY("song_id") REFERENCES "songs"("id");
ALTER TABLE
    "albums_artists" ADD CONSTRAINT "albums_artists_album_id_foreign" FOREIGN KEY("album_id") REFERENCES "albums"("id");
ALTER TABLE
    "artists_songs" ADD CONSTRAINT "artists_songs_artist_id_foreign" FOREIGN KEY("artist_id") REFERENCES "artists"("id");
ALTER TABLE
    "albums_songs" ADD CONSTRAINT "albums_songs_album_id_foreign" FOREIGN KEY("album_id") REFERENCES "albums"("id");
ALTER TABLE
    "albums_artists" ADD CONSTRAINT "albums_artists_artist_id_foreign" FOREIGN KEY("artist_id") REFERENCES "artists"("id");
ALTER TABLE
    "producers_songs" ADD CONSTRAINT "producers_songs_song_id_foreign" FOREIGN KEY("song_id") REFERENCES "songs"("id");
ALTER TABLE
    "artists_songs" ADD CONSTRAINT "artists_songs_song_id_foreign" FOREIGN KEY("song_id") REFERENCES "songs"("id");
ALTER TABLE
    "producers_songs" ADD CONSTRAINT "producers_songs_producer_id_foreign" FOREIGN KEY("producer_id") REFERENCES "producers"("id");
