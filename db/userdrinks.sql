--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-04 20:09:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16756)
-- Name: userdrinks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userdrinks (
    drink_name character varying(20),
    spirit_type character varying(20),
    spirit_amount integer,
    ingredients text,
    instructions text
);


ALTER TABLE public.userdrinks OWNER TO postgres;

--
-- TOC entry 4840 (class 0 OID 16756)
-- Dependencies: 220
-- Data for Name: userdrinks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userdrinks (drink_name, spirit_type, spirit_amount, ingredients, instructions) FROM stdin;
\.


-- Completed on 2024-06-04 20:09:48

--
-- PostgreSQL database dump complete
--

