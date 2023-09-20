CREATE TABLE "seasons"(
    "id" SERIAL NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL
);
ALTER TABLE
    "seasons" ADD PRIMARY KEY("id");
CREATE TABLE "teams"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "wins" BIGINT NOT NULL
);
ALTER TABLE
    "teams" ADD PRIMARY KEY("id");
CREATE TABLE "referees"(
    "id" SERIAL NOT NULL,
    "name" BIGINT NOT NULL
);
ALTER TABLE
    "referees" ADD PRIMARY KEY("id");
CREATE TABLE "players"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "team_id" BIGINT NOT NULL
);
ALTER TABLE
    "players" ADD PRIMARY KEY("id");
CREATE TABLE "games_refs"(
    "id" SERIAL NOT NULL,
    "ref_id" BIGINT NOT NULL,
    "game_id" BIGINT NOT NULL
);
ALTER TABLE
    "games_refs" ADD PRIMARY KEY("id");
CREATE TABLE "goals"(
    "id" SERIAL NOT NULL,
    "player_id" BIGINT NOT NULL
);
ALTER TABLE
    "goals" ADD PRIMARY KEY("id");
CREATE TABLE "games"(
    "id" SERIAL NOT NULL,
    "team1_id" BIGINT NOT NULL,
    "team2_id" BIGINT NOT NULL
);
ALTER TABLE
    "games" ADD PRIMARY KEY("id");
ALTER TABLE
    "games" ADD CONSTRAINT "games_team2_id_foreign" FOREIGN KEY("team2_id") REFERENCES "teams"("id");
ALTER TABLE
    "goals" ADD CONSTRAINT "goals_player_id_foreign" FOREIGN KEY("player_id") REFERENCES "players"("id");
ALTER TABLE
    "players" ADD CONSTRAINT "players_team_id_foreign" FOREIGN KEY("team_id") REFERENCES "teams"("id");
ALTER TABLE
    "games_refs" ADD CONSTRAINT "games_refs_game_id_foreign" FOREIGN KEY("game_id") REFERENCES "games"("id");
ALTER TABLE
    "games_refs" ADD CONSTRAINT "games_refs_ref_id_foreign" FOREIGN KEY("ref_id") REFERENCES "referees"("id");
ALTER TABLE
    "games" ADD CONSTRAINT "games_team1_id_foreign" FOREIGN KEY("team1_id") REFERENCES "teams"("id");