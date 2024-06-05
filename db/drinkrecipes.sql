--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-02 22:28:53

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
-- TOC entry 215 (class 1259 OID 16721)
-- Name: liquor_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.liquor_table (
    drink_id integer NOT NULL,
    drink_name text,
    spirit_type text,
    spirit_amount integer,
    ingredient_1 text,
    ingredient_1_quantity integer,
    ingredient_2 text,
    ingredient_2_quantity integer,
    ingredient_3 text,
    ingredient_3_quantity integer,
    ingredient_4 text,
    ingredient_4_quantity integer,
    ingredient_5 text,
    ingredient_5_quantity integer,
    ingredient_6 text,
    ingredient_6_quantity integer,
    instructions text
);


ALTER TABLE public.liquor_table OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16728)
-- Name: liquor_party_drink_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.liquor_table ALTER COLUMN drink_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.liquor_party_drink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4833 (class 0 OID 16721)
-- Dependencies: 215
-- Data for Name: liquor_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.liquor_table (drink_id, drink_name, spirit_type, spirit_amount, ingredient_1, ingredient_1_quantity, ingredient_2, ingredient_2_quantity, ingredient_3, ingredient_3_quantity, ingredient_4, ingredient_4_quantity, ingredient_5, ingredient_5_quantity, ingredient_6, ingredient_6_quantity, instructions) FROM stdin;
1	Americano	Vermouth	1	Campari	1	Soda Water	4	\N	\N	\N	\N	\N	\N	\N	\N	Pour Campari and sweet vermouth into a glass. Add ice and soda water.
3	Aperol Spritz	Aperol	2	Sparkling Wine	3	Seltzer	2	\N	\N	\N	\N	\N	\N	\N	\N	Pour the Aperol into a wineglass. Fill the glass with ice cubes, then pour in the sparkling wine and seltzer. Mix gently with a bar spoon. Garnish with a grapefruit wedge.
4	Bees Knees	Gin	2	Lemon Juice	1	Honey Syrup	1	\N	\N	\N	\N	\N	\N	\N	\N	Shake all ingredients with ice. Double strain into a chilled coupe.
5	Between the Sheets	Cognac	1	White Rum	1	Cointreau	1	Lemon Juice	1	\N	\N	\N	\N	\N	\N	Shake all ingredients with ice. Double strain into a chilled coupe.
6	Boulevardier	Bourbon	2	Sweet Vermouth	1	Campari	1	\N	\N	\N	\N	\N	\N	\N	\N	Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Garnish with a cherry.
7	Brandy Alexander	Cognac	2	Creme de Cacao	1	Heavy Cream	1	\N	\N	\N	\N	\N	\N	\N	\N	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with grated nutmeg.
8	Brandy Flip	Cognac	2	Demerara Syrup	1	Whole Egg	1	\N	\N	\N	\N	\N	\N	\N	\N	Shake all ingredients without ice. Shake again with ice. Double strain into a chilled coupe. Garnish with grated nutmeg.
9	Champs-Elysees	Cognac	2	Green Chartreuse	1	Lemon Juice	1	Simple Syrup	1	Angostura Bitters	1	\N	\N	\N	\N	Shake all ingredients with ice. Strain into a chilled coupe. Express the lemon twist over the drink then set it on the edge of the glass.
10	Corpse Reviver No.2	Gin	1	Lillet Blanc	1	Cointreau	1	Lemon Juice	1	Absinthe	2	\N	\N	\N	\N	Shake all ingredients with ice. Double strain into a chilled coupe.
11	Cosmopolitan	Vodka	2	Cointreau	1	Lime Juice	1	Cranberry Juice	1	Simple Syrup	1	\N	\N	\N	\N	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a lime wheel.
12	Cuba Libre	White Rum	2	Lime Juice	0	Coca-Cola	4	\N	\N	\N	\N	\N	\N	\N	\N	Pour the rum into a highball glass and add three ice cubes. Stir for 3 seconds. Add the lime juice and cola and stir once with a bar spoon. Garnish with a lime wedge.
13	Daiquiri	White Rum	2	Lime Juice	1	Simple Syrup	1	\N	\N	\N	\N	\N	\N	\N	\N	Shake all ingredients with ice. Double strain into a chilled coupe.
14	French 75	Gin	1	Lemon Juice	1	Simple Syrup	1	Sparkling Wine	4	\N	\N	\N	\N	\N	\N	Shake all ingredients (except for the sparkling wine) with ice. Strain into a chilled flute. Pour in the sparkling wine and gently mix with a bar spoon. Express a lemon twist over the drink then place it into the drink.
16	Hemingway Daiquiri	White Rum	2	Maraschino Liqueur	1	Grapefruit Juice	1	Lime Juice	1	Simple Syrup	1	\N	\N	\N	\N	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a lime wheel.
17	Hot Toddy	Bourbon	2	Honey Syrup	1	Angostura Bitters	1	\N	\N	\N	\N	\N	\N	\N	\N	Combine all ingredients (except the water) in a mixing glass and stir. Pour into a toddy mug, then pour in the boiling water. Garnish with a cinnamon stick.
18	Improved Whiskey Cocktail	Bourbon	2	Maraschino Liqueur	1	Absinthe	1	Angostura Bitters	1	Peychauds Bitters	1	\N	\N	\N	\N	Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Express a lemon twist over the drink, then place it into the drink.
19	Jack Rose	Apple Brandy	2	Lime Juice	1	Grenadine	1	\N	\N	\N	\N	\N	\N	\N	\N	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with an apple slice.
20	Last Word	Gin	1	Green Chartreuse	1	Maraschino Liqueur	1	Lime Juice	1	\N	\N	\N	\N	\N	\N	Shake all ingredients with ice. Double strain into a chilled coupe.
21	Mai Tai	Aged Rum	1	Rum Agricole Blanc	1	Cointreau	1	Lime Juice	1	Orgeat	1	Simple Syrup	1	Angostura Bitters	1	Shake all ingredients with a small amount of crushed ice. Dump into a double old-fashioned glass. Pack the glass with crushed ice. Garnish with a mint bouquet.
22	Manhattan	Rye Whiskey	2	Sweet Vermouth	1	Angostura Bitters	2	\N	\N	\N	\N	\N	\N	\N	\N	Stir all ingredients over ice. Strain into a chilled coupe. Garnish with 1 brandied cherry.
23	Margarita	Blanco Tequila	2	Cointreau	1	Lime Juice	1	Simple Syrup	1	Lime Wedge	1	Kosher Salt	1	\N	\N	Rub the lime wedge along the rim of the glass. Roll the wet portion of the glass in the salt. Shake the remaining ingredients with ice. Strain into prepared glass.
24	Martini	Gin	2	Dry Vermouth	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Stir all ingredients over ice. Strain into a chilled coupe. Garnish with an olive or express a lemon peel over the drink and set it on the side of the glass.
25	Mint Julep	Bourbon	2	Simple Syrup	0	Mint Bouquet	1	\N	\N	\N	\N	\N	\N	\N	\N	Rub the interior of the julep tin with the mint bouquet and then set it aside. Add the bourbon and syrup and fill the tin halfway with crushed ice. Stir, churning the ice as you go, for about 10 seconds. Fill the tin with ice until it is about two-thirds full. Stir until it is completely frosted. Add more ice to form a cone over the rim. Garnish with the mint bouquet and serve with a straw.
26	Mojito	White Rum	2	Lime Juice	1	Simple Syrup	1	White Sugar Cube	1	Mint Leaves	10	\N	\N	\N	\N	Gently muddle the mint leaves, simple syrup, and sugar cube in a shaker. Add the remaining ingredients and shake with a small amount of crushed ice. Dump into a Collins glass and add crushed ice until about four-fifths full. Swizzle for a few seconds, then pack the glass with ice. Garnish with mint bouquet then serve with a straw.
30	Moscow Mule	Vodka	2	Seltzer	2	Lime Juice	1	Ginger Syrup	1	\N	\N	\N	\N	\N	\N	Pour the chilled seltzer into a Collins glass. Short-shake the remaining ingredients for about 5 seconds. Strain into the glass. Fill the glass with ice cubes & garnish with a lime wheel.
31	Negroni	Gin	1	Sweet Vermouth	1	Campari	1	\N	\N	\N	\N	\N	\N	\N	\N	Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Express an orange twist over the drink, then place it into the drink.
32	Old Cuban	Aged Rum	2	Lime Juice	1	Simple Syrup	1	Angostura Bitters	2	Mint Leaves	6	Champagne	2	\N	\N	Shake all ingredients (except the champagne) with ice. Double strain into a chilled coupe. Pour in the champagne and mix gently with a bar spoon. Garnish with a fresh mint leaf.
33	Old-Fashioned	Bourbon	2	Angostura Bitters	2	Sugar Cube	1	\N	\N	\N	\N	\N	\N	\N	\N	Muddle the sugar cube and simple syrup in an old-fashioned glass. Add the bourbon and 1 large ice cube. Stir until chilled. Garnish with lemon & orange twist.
34	Old Pal	Rye Whiskey	2	Dry Vermouth	1	Campari	1	\N	\N	\N	\N	\N	\N	\N	\N	Stir all ingredients over ice. Strain into a chilled coupe. Express an orange twist over the drink and then place it into the drink.
35	Peaches and Smoke	Lillet Rose	2	Cognac	1	Scotch	1	Creme de Peche	1	Lemon Juice	1	Simple Syrup	0	Peach Wedge	1	Muddle the peach wedge in a shaker. Add the remaining ingredients and shake with ice. Double strain into a chilled coupe. Garnish with a peach wedge.
36	Pegu Club	Gin	2	Cointreau	1	Lime Juice	1	Angostura Bitters	1	Angostura Orange Bitters	1	\N	\N	\N	\N	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a lime wheel.
37	Pink Lady	Gin	2	Apple Brandy	1	Lemon Juice	1	Grenadine	1	Simple Syrup	1	Egg White	1	\N	\N	Shake all the ingredients without ice. Shake all ingredients again with ice. Double strain into a chilled coupe. Garnish with a cherry.
38	Pisco Sour	Pisco	2	Lime Juice	1	Lemon Juice	1	Simple Syrup	1	Egg White	1	\N	\N	\N	\N	Shake all the ingredients without ice. Shake all ingredients again with ice. Double strain into a chilled coupe. Carefully garnish the top of the foam with Angostura bitters.
39	Poets Dream	Gin	2	Dry Vermouth	1	Benedictine	0	Angostura Orange Bitters	2	\N	\N	\N	\N	\N	\N	Stir all ingredients over ice. Strain into a chilled coupe. Express a lemon twist over the drink and then place it on the edge of the glass.
40	Rosita	Blanco Tequila	2	Sweet Vermouth	1	Dry Vermouth	1	Campari	1	Angostura Bitters	1	\N	\N	\N	\N	Stir all ingredients over ice. Strain into a chilled coupe. Express an orange twist over the drink, then place it into the drink.
42	Sidecar	Cognac	2	Cointreau	1	Lemon Juice	1	\N	\N	\N	\N	\N	\N	\N	\N	Shake all ingredients with ice. Strain into a chilled coupe. Express an orange twist over the drink, then place it into the drink.
43	Southside	Gin	2	Lime Juice	1	Simple Syrup	1	Angostura Bitters	1	\N	\N	\N	\N	\N	\N	Gently muddle the mint in a shaker. Add the remaining ingredients and shake with ice. Strain into a chilled coupe. Garnish with a fresh mint leaf.
44	Tequila Sunrise	Blanco Tequila	2	Orange Juice	4	Lime Juice	0	Grenadine	0	\N	\N	\N	\N	\N	\N	Combine the tequila, orange juice, and lime juice in a highball glass. Add three ice cubes. Stir for three seconds. Add the grenadine and let it sink to the bottom of the glass. Garnish with half an orange wheel and a lime wedge.
45	Ti Punch	Rhum Agricole Blanc	2	Sugar Cane Syrup	1	Lime Wheel	1	\N	\N	\N	\N	\N	\N	\N	\N	In an old-fashioned glass, muddle the lime and syrup. Add the rhum and fill the glass with cracked ice. Stir briefly.
46	Tom Collins	Seltzer	2	Gin	2	Lemon Juice	1	Simple Syrup	1	\N	\N	\N	\N	\N	\N	Pour the seltzer into a Collins glass. Short-shake the remaining ingredients with ice for about 5 seconds. Strain into the glass. Fill the glass with ice cubes. Garnish with a lemon wheel and cherry.
47	Whisky Highball	Scotch	2	Seltzer	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Pour the scotch intoa highball glass. Add 3 ice cubes. Stir for 3 seconds. Add the seltzer and stir once. Garnish with a lemon peel.
48	Whiskey Sour	Bourbon	2	Lemon Juice	1	Simple Syrup	1	\N	\N	\N	\N	\N	\N	\N	\N	Shake all ingredients with ice. Strain into a double old-fashioned glass over 1 large ice cube. Garnish with a lemon wheel and a cherry.
50	White Negroni	Gin	2	Dry Vermouth	1	Suze	1	\N	\N	\N	\N	\N	\N	\N	\N	Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Express an orange twist over the drink, then place it into the drink.
41	Sazerac	Absinthe	2	Rye Whiskey	2	Cognac	1	Demerara Syrup	1	Peychauds Bitters	4	Angostura Bitters	1	\N	\N	Rinse an old-fashioned glass with absinthe and then dump. Stir the remaining ingredients over ice. Strain into the glass. Express the lemon twist over the drink and discard it.
49	White Lady	Gin	2	Cointreau	1	Lemon Juice	1	Simple Syrup	1	Egg White	1	\N	\N	\N	\N	Shake all the ingredients without ice. Shake all ingredients again with ice. Double strain into a chilled coupe. Express a lemon twist over the drink, then place it on the edge of the glass.
15	Grasshopper	Creme de Menthe	1	Creme de Cacao	1	Heavy Cream	1	\N	\N	\N	\N	\N	\N	\N	\N	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a fresh mint leaf.
\.


--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 216
-- Name: liquor_party_drink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.liquor_party_drink_id_seq', 50, true);


--
-- TOC entry 4689 (class 2606 OID 16725)
-- Name: liquor_table liquor_party_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.liquor_table
    ADD CONSTRAINT liquor_party_pkey PRIMARY KEY (drink_id);


-- Completed on 2024-06-02 22:28:53

--
-- PostgreSQL database dump complete
--