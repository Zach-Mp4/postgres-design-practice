-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE "tickets"(
    "id" SERIAL NOT NULL,
    "customer_id" BIGINT NOT NULL,
    "seat" TEXT NOT NULL,
    "flight_id" BIGINT NOT NULL
);
ALTER TABLE
    "tickets" ADD PRIMARY KEY("id");

CREATE TABLE "airlines"(
    "id" SERIAL NOT NULL,
    "airline_name" TEXT NOT NULL
);

ALTER TABLE
    "airlines" ADD PRIMARY KEY("id");

CREATE TABLE "flights"(
    "id" SERIAL NOT NULL,
    "departure" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "arrival" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "airline_id" BIGINT NOT NULL,
    "from_city_id" BIGINT NOT NULL,
    "to_city_id" BIGINT NOT NULL
);

ALTER TABLE
    "flights" ADD PRIMARY KEY("id");

CREATE TABLE "customers"(
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL
);

ALTER TABLE
    "customers" ADD PRIMARY KEY("id");

CREATE TABLE "cities"(
    "id" SERIAL NOT NULL,
    "city_name" TEXT NOT NULL,
    "country" TEXT NOT NULL
);

ALTER TABLE
    "cities" ADD PRIMARY KEY("id");
ALTER TABLE
    "tickets" ADD CONSTRAINT "tickets_flight_id_foreign" FOREIGN KEY("flight_id") REFERENCES "flights"("id");
ALTER TABLE
    "flights" ADD CONSTRAINT "flights_airline_id_foreign" FOREIGN KEY("airline_id") REFERENCES "airlines"("id");
ALTER TABLE
    "flights" ADD CONSTRAINT "flights_from_city_id_foreign" FOREIGN KEY("from_city_id") REFERENCES "cities"("id");
ALTER TABLE
    "tickets" ADD CONSTRAINT "tickets_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "customers"("id");
ALTER TABLE
    "flights" ADD CONSTRAINT "flights_to_city_id_foreign" FOREIGN KEY("to_city_id") REFERENCES "cities"("id");

INSERT INTO cities
  (city_name, country)
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile');

INSERT INTO airlines
  (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO flights
  (departure, arrival, airline_id, from_city_id, to_city_id)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 4, 7, 8),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 3, 9, 10),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 6, 11, 12),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 5, 13, 14),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 1, 15, 16),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 7, 17,18);

INSERT INTO customers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');
  
INSERT INTO tickets
  (customer_id, seat, flight_id)
VALUES
  (1, '33B', 1),
  (2, '8A', 2),
  (3, '12F', 3),
  (1, '20A', 4),
  (4, '23D', 5),
  (2, '18C', 6),
  (5, '9E', 7),
  (6, '1A', 8),
  (5, '32B', 9),
  (7, '10D', 2);




    
    