--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-06 08:42:37

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
    drinkname character varying(20),
    spirittype character varying(20),
    spiritamount integer,
    ingredients text,
    instructions text,
    id integer NOT NULL,
    "createdAt" date,
    "updatedAt" date
);


ALTER TABLE public.userdrinks OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16761)
-- Name: userdrinks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.userdrinks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.userdrinks_id_seq OWNER TO postgres;

--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 221
-- Name: userdrinks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.userdrinks_id_seq OWNED BY public.userdrinks.id;


--
-- TOC entry 4698 (class 2604 OID 16762)
-- Name: userdrinks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userdrinks ALTER COLUMN id SET DEFAULT nextval('public.userdrinks_id_seq'::regclass);


--
-- TOC entry 4844 (class 0 OID 16756)
-- Dependencies: 220
-- Data for Name: userdrinks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userdrinks (drinkname, spirittype, spiritamount, ingredients, instructions, id, "createdAt", "updatedAt") FROM stdin;
Martini	Gin	2	Gin, Vermouth	Shake with ice and strain into glass	1	2024-06-06	2024-06-06
Old-Fashioned	Whiskey	2	2 oz Bourbon, 1 sugar cube, 2 dashes bitters, 1 splash water, 1 orange twist	Soak sugar cube with bitters and water in an old-fashioned glass. Muddle. Fill glass with ice, add bourbon, and stir. Garnish with orange twist.	2	2024-06-06	2024-06-06
Jack and Coke	Whiskey	2	1 sugar cube, 3 dashes bitters, 2 oz bourbon, 1 orange twist	In a mixing glass, muddle the sugar and bitters. Fill the glass with ice, then add the bourbon. Stir well and strain into a glass. Twist the orange peel over the drink and drop it in.	3	2024-06-06	2024-06-06
\.


--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 221
-- Name: userdrinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.userdrinks_id_seq', 7, true);


--
-- TOC entry 4700 (class 2606 OID 16764)
-- Name: userdrinks userdrinks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userdrinks
    ADD CONSTRAINT userdrinks_pkey PRIMARY KEY (id);


-- Completed on 2024-06-06 08:42:38

--
-- PostgreSQL database dump complete
--

