DROP DATABASE IF EXISTS "faketotal";
CREATE DATABASE "faketotal";
\connect "faketotal";

DROP TABLE IF EXISTS "faketotal";
DROP SEQUENCE IF EXISTS faketotal_id_seq;
CREATE SEQUENCE faketotal_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 2 CACHE 1;

CREATE TABLE "public"."faketotal" (
    "id" bigint DEFAULT nextval('faketotal_id_seq') NOT NULL,
    "ioc" text NOT NULL,
    "rating" integer DEFAULT '0' NOT NULL,
    "submit" timestamp NOT NULL,
    "malware" text,
    CONSTRAINT "faketotal_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

TRUNCATE "faketotal";
INSERT INTO "faketotal" ("id", "ioc", "rating", "submit", "malware") VALUES
(1,	'example.com',	0,	'2026-01-26 01:01:01.011801',	NULL);

