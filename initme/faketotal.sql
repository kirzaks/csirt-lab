--
-- PostgreSQL database dump
--

CREATE DATABASE "faketotal";

\connect "faketotal";

\restrict ZXp5coCalIvQCJTlS9fWdnPixCRpGNl1F8ZgkzlgAdLSzD8T9Ua7Y2arNJ93ZzP

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: faketotal_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.faketotal_id_seq
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.faketotal_id_seq OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: faketotal; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.faketotal (
    id bigint DEFAULT nextval('public.faketotal_id_seq'::regclass) NOT NULL,
    ioc text NOT NULL,
    rating integer DEFAULT 0 NOT NULL,
    submit timestamp without time zone NOT NULL,
    malware text
);


ALTER TABLE public.faketotal OWNER TO root;

--
-- Data for Name: faketotal; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.faketotal (id, ioc, rating, submit, malware) FROM stdin;
1	example.com	0	2010-01-26 01:01:01.011801	\N
\.


--
-- Name: faketotal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.faketotal_id_seq', 2, false);


--
-- Name: faketotal faketotal_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.faketotal
    ADD CONSTRAINT faketotal_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict ZXp5coCalIvQCJTlS9fWdnPixCRpGNl1F8ZgkzlgAdLSzD8T9Ua7Y2arNJ93ZzP
