DROP DATABASE IF EXISTS medical;

CREATE DATABASE medical;

\c medical

CREATE TABLE "patients_doctors"(
    "id" SERIAL NOT NULL,
    "doctor_id" BIGINT NOT NULL,
    "patient_id" BIGINT NOT NULL
);
ALTER TABLE
    "patients_doctors" ADD PRIMARY KEY("id");
CREATE TABLE "disease"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "disease" ADD PRIMARY KEY("id");
CREATE TABLE "diagnoses"(
    "id" SERIAL NOT NULL,
    "patient_id" BIGINT NOT NULL,
    "disease_id" BIGINT NOT NULL
);
ALTER TABLE
    "diagnoses" ADD PRIMARY KEY("id");
CREATE TABLE "patients"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "birthday" DATE NOT NULL
);
ALTER TABLE
    "patients" ADD PRIMARY KEY("id");
CREATE TABLE "medical center"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "city" TEXT NOT NULL
);
ALTER TABLE
    "medical center" ADD PRIMARY KEY("id");
CREATE TABLE "doctors"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "med_cen_id" BIGINT NOT NULL
);
ALTER TABLE
    "doctors" ADD PRIMARY KEY("id");
ALTER TABLE
    "diagnoses" ADD CONSTRAINT "diagnoses_disease_id_foreign" FOREIGN KEY("disease_id") REFERENCES "disease"("id");
ALTER TABLE
    "patients_doctors" ADD CONSTRAINT "patients_doctors_doctor_id_foreign" FOREIGN KEY("doctor_id") REFERENCES "doctors"("id");
ALTER TABLE
    "diagnoses" ADD CONSTRAINT "diagnoses_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "patients"("id");
ALTER TABLE
    "doctors" ADD CONSTRAINT "doctors_med_cen_id_foreign" FOREIGN KEY("med_cen_id") REFERENCES "medical center"("id");
ALTER TABLE
    "patients_doctors" ADD CONSTRAINT "patients_doctors_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "patients"("id");