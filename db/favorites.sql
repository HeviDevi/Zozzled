--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-04 20:07:18

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
-- TOC entry 219 (class 1259 OID 16749)
-- Name: favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorites (
    username text NOT NULL,
    drink_id integer NOT NULL,
    drink_name text,
    spirit_type text,
    spirit_amount integer,
    ingredients character varying,
    instructions text,
    image_link character varying,
    bitter boolean,
    sweet boolean
);


ALTER TABLE public.favorites OWNER TO postgres;

--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN favorites.image_link; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.favorites.image_link IS 'image links to use for rendering along with drink application';


--
-- TOC entry 218 (class 1259 OID 16748)
-- Name: favorites_drink_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.favorites ALTER COLUMN drink_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.favorites_drink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
);


--
-- TOC entry 4843 (class 0 OID 16749)
-- Dependencies: 219
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorites (username, drink_id, drink_name, spirit_type, spirit_amount, ingredient_1, ingredient_1_quantity, ingredient_2, ingredient_2_quantity, ingredient_3, ingredient_3_quantity, ingredient_4, ingredient_4_quantity, ingredient_5, ingredient_5_quantity, ingredient_6, ingredient_6_quantity, instructions, image_link) FROM stdin;
\.


--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 218
-- Name: favorites_drink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorites_drink_id_seq', 1, false);


--
-- TOC entry 4698 (class 2606 OID 16755)
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (drink_id);


-- Completed on 2024-06-04 20:07:18

--
-- PostgreSQL database dump complete
--

