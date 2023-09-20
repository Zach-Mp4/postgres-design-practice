DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE "categories"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "categories" ADD PRIMARY KEY("id");
CREATE TABLE "region"(
    "id" SERIAL NOT NULL,
    "city" TEXT NOT NULL
);
ALTER TABLE
    "region" ADD PRIMARY KEY("id");
CREATE TABLE "posts"(
    "id" SERIAL NOT NULL,
    "region_id" BIGINT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "category_id" BIGINT NOT NULL
);
ALTER TABLE
    "posts" ADD PRIMARY KEY("id");
CREATE TABLE "users"(
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "pref_region_id" BIGINT NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_category_id_foreign" FOREIGN KEY("category_id") REFERENCES "categories"("id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_region_id_foreign" FOREIGN KEY("region_id") REFERENCES "region"("id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_pref_region_id_foreign" FOREIGN KEY("pref_region_id") REFERENCES "region"("id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");