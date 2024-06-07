--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-06 20:08:36

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
-- Name: drinkrecipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drinkrecipes (
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


ALTER TABLE public.drinkrecipes OWNER TO postgres;

--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN drinkrecipes.image_link; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.drinkrecipes.image_link IS 'image links to use for rendering along with drink application';


--
-- TOC entry 216 (class 1259 OID 16728)
-- Name: liquor_party_drink_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.drinkrecipes ALTER COLUMN drink_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.liquor_party_drink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4843 (class 0 OID 16721)
-- Dependencies: 215
-- Data for Name: drinkrecipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drinkrecipes (drink_id, drink_name, spirit_type, spirit_amount, ingredients, instructions, image_link, bitter, sweet) FROM stdin;
6	Boulevardier	Bourbon	2	1.5 oz bourbon\n.75 oz sweet vermouth\n.75 oz Campari	Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Garnish with a cherry.	\N	\N	\N
7	Brandy Alexander	Cognac	2	1.5 oz cognac\n1 oz creme de cacao\n1 oz heavy cream	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with grated nutmeg.	\N	\N	\N
1	Americano	Vermouth	1	1 oz Campari \n1 oz sweet vermouth\n 4 oz seltzer	Pour Campari and sweet vermouth into a glass. Add ice and soda water.	\N	\N	\N
3	Aperol Spritz	Aperol	2	2 oz Aperol\n3 oz sparkling wine \n2 oz seltzer	Pour the Aperol into a wineglass. Fill the glass with ice cubes, then pour in the sparkling wine and seltzer. Mix gently with a bar spoon. Garnish with a grapefruit wedge.	\N	\N	\N
4	Bee's Knees	Gin	2	2 oz gin\n3/4 oz lemon juice\n3/4 honey syrup	Shake all ingredients with ice. Double strain into a chilled coupe.	\N	\N	\N
5	Between the Sheets	Cognac	1	.75 cognac\n.75 oz white rum \n.75 oz Cointreau\n.75 oz lemon juice	Shake all ingredients with ice. Double strain into a chilled coupe.	\N	\N	\N
8	Brandy Flip	Cognac	2	1.5 oz Cognac\n.75 oz demerara syrup\n1 whole egg	Shake all ingredients without ice. Shake again with ice. Double strain into a chilled coupe. Garnish with grated nutmeg.	\N	\N	\N
9	Champs-Elysees	Cognac	2	2 oz Cognac\n.5 oz Green Chartreuse\n.75 oz lemon juice\n.5 oz simple syrup\n1 dash angostura bitters	Shake all ingredients with ice. Strain into a chilled coupe. Express the lemon twist over the drink then set it on the edge of the glass.	\N	\N	\N
13	Daiquiri	White Rum	2	2 oz white rum\n.75 oz lime juice\n.75 oz simple syrup	Shake all ingredients with ice. Double strain into a chilled coupe.	\N	\N	\N
10	Corpse Reviver No.2	Gin	1	.75 oz gin\n.75 oz Lillet blanc\n.75 Cointreau\n.75 lemon juice\n2 dashes absinthe	Shake all ingredients with ice. Double strain into a chilled coupe.	\N	\N	\N
11	Cosmopolitan	Vodka	2	2 oz vodka\n.75 oz Cointreau\n.5 oz lime juice\n.5 cranberry juice\n.5 oz simple syrup\n	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a lime wheel.	\N	\N	\N
12	Cuba Libre	White Rum	2	2 oz white rum\n.25 oz lime juice\n4 oz Coca-Cola	Pour the rum into a highball glass and add three ice cubes. Stir for 3 seconds. Add the lime juice and cola and stir once with a bar spoon. Garnish with a lime wedge.	\N	\N	\N
14	French 75	Gin	1	1 oz gin\n.5 oz lemon juice\n.5 oz simple syrup\n4 oz sparkling wine	Shake all ingredients (except for the sparkling wine) with ice. Strain into a chilled flute. Pour in the sparkling wine and gently mix with a bar spoon. Express a lemon twist over the drink then place it into the drink.	\N	\N	\N
15	Grasshopper	Creme de Menthe	1	1 oz creme de menthe\n1 oz creme de cacao\n1 oz heavy cream\n8 mint leaves	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a fresh mint leaf.	\N	\N	\N
16	Hemingway Daiquiri	White Rum	2	1.5 oz white rum\n.5 oz maraschino liquer\n1 oz grapefruit juice\n.5 oz lime juice\n1 tsp simple syrup	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a lime wheel.	\N	\N	\N
17	Hot Toddy	Bourbon	2	2 lemon wedges\n1.5 oz bourbon\n.75 oz honey syrup\n1 dash Angostura bitters\n4 oz boiling water	Combine all ingredients (except the water) in a mixing glass and stir. Pour into a toddy mug, then pour in the boiling water. Garnish with a cinnamon stick.	\N	\N	\N
18	Improved Whiskey Cocktail	Bourbon	2	2 oz bourbon\n1 tsp maraschino liqueur\n1 dash absinthe\n1 dash Angostura\n1 dash Peychaud's bitters	Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Express a lemon twist over the drink, then place it into the drink.	\N	\N	\N
19	Jack Rose	Apple Brandy	2	2 oz apple brandy\n.75 oz lime juice\n.75 grenadine	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with an apple slice.	\N	\N	\N
20	Last Word	Gin	1	.75 oz gin\n.75 oz green Chartreuse\n.75 oz maraschino liquer\n.75 lime juice	Shake all ingredients with ice. Double strain into a chilled coupe.	\N	\N	\N
21	Mai Tai	Aged Rum	1	1 oz aged rum\n1 oz rum agricole blanc\n.75 oz Cointreau\n1 oz lime juice\n.5 oz orgeat\n.5 oz simple syrup\n1 dash Angostura bitters	Shake all ingredients with a small amount of crushed ice. Dump into a double old-fashioned glass. Pack the glass with crushed ice. Garnish with a mint bouquet.	\N	\N	\N
22	Manhattan	Rye Whiskey	2	2 oz rye whiskey \n1 oz sweet vermouth\n2 dash Angostura bitters	Stir all ingredients over ice. Strain into a chilled coupe. Garnish with 1 brandied cherry.	\N	\N	\N
23	Margarita	Blanco Tequila	2	2 oz blanco tequila\n.75 oz Cointreau\n.75 oz lime juice\n.75 oz simple syrup\n1 lime wedge\nkosher salt, for the rim.	Rub the lime wedge along the rim of the glass. Roll the wet portion of the glass in the salt. Shake the remaining ingredients with ice. Strain into prepared glass.	\N	\N	\N
24	Martini	Gin	2	2 oz gin\n.75 oz dry vermouth\n	Stir all ingredients over ice. Strain into a chilled coupe. Garnish with an olive or express a lemon peel over the drink and set it on the side of the glass.	\N	\N	\N
25	Mint Julep	Bourbon	2	1 mint bouquet\n2 oz bourbon\n.25 oz simple syrup\n	Rub the interior of the julep tin with the mint bouquet and then set it aside. Add the bourbon and syrup and fill the tin halfway with crushed ice. Stir, churning the ice as you go, for about 10 seconds. Fill the tin with ice until it is about two-thirds full. Stir until it is completely frosted. Add more ice to form a cone over the rim. Garnish with the mint bouquet and serve with a straw.	\N	\N	\N
26	Mojito	White Rum	2	2 oz white rum\n1 oz lime juice\n.75 simple syrup\n1 white sugar cube\n10 min leaves	Gently muddle the mint leaves, simple syrup, and sugar cube in a shaker. Add the remaining ingredients and shake with a small amount of crushed ice. Dump into a Collins glass and add crushed ice until about four-fifths full. Swizzle for a few seconds, then pack the glass with ice. Garnish with mint bouquet then serve with a straw.	\N	\N	\N
30	Moscow Mule	Vodka	2	2 oz seltzer\n2 oz vodka\n.5 lime juice\n.75 ginger syrup	Pour the chilled seltzer into a Collins glass. Short-shake the remaining ingredients for about 5 seconds. Strain into the glass. Fill the glass with ice cubes & garnish with a lime wheel.	\N	\N	\N
31	Negroni	Gin	1	1 oz gin\n1 oz sweet vermouth\n1 oz Campari	Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Express an orange twist over the drink, then place it into the drink.	\N	\N	\N
32	Old Cuban	Aged Rum	2	1.5 oz aged rum\n.75 lime juice\n1 oz simple syrup\n2 dashes Angostura bitters\n6 mint leaves\n2 oz champagne	Shake all ingredients (except the champagne) with ice. Double strain into a chilled coupe. Pour in the champagne and mix gently with a bar spoon. Garnish with a fresh mint leaf.	\N	\N	\N
33	Old-Fashioned	Bourbon	2	2 oz bourbon\n2 dashes Angostura bitters\n1 sugar cube\n	Muddle the sugar cube and simple syrup in an old-fashioned glass. Add the bourbon and 1 large ice cube. Stir until chilled. Garnish with lemon & orange twist.	\N	\N	\N
34	Old Pal	Rye Whiskey	2	1.5 oz rye whiskey\n.75 dry vermouth\n.75 Campari	Stir all ingredients over ice. Strain into a chilled coupe. Express an orange twist over the drink and then place it into the drink.	\N	\N	\N
35	Peaches and Smoke	Lillet Rose	2	1.5 oz Lillet rose\n.5 oz cognac\n1 tsp scotch\n.75 oz creme de peche\n.75 oz lemon juice\n.25 oz simple syrup\n1 peach wedge\n	Muddle the peach wedge in a shaker. Add the remaining ingredients and shake with ice. Double strain into a chilled coupe. Garnish with a peach wedge.	\N	\N	\N
36	Pegu Club	Gin	2	2 oz gin\n.75 oz Cointreau\n.75 oz lime juice\n1 dash Angostura bitters\n1 dash Angostura oragne bitters	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a lime wheel.	\N	\N	\N
37	Pink Lady	Gin	2	1.5 oz gin\n.5 oz apple brandy\n.5 lemon juice\n.5 grenadine\n.5 simple syrup\n1 egg white	Shake all the ingredients without ice. Shake all ingredients again with ice. Double strain into a chilled coupe. Garnish with a cherry.	\N	\N	\N
38	Pisco Sour	Pisco	2	2 oz Pisco\n.5 lime juice\n.5 lemon juice\n.75 simple syrup\n1 egg white\n	Shake all the ingredients without ice. Shake all ingredients again with ice. Double strain into a chilled coupe. Carefully garnish the top of the foam with Angostura bitters.	\N	\N	\N
39	Poets Dream	Gin	2	2 oz gin\n.75 dry vermouth\n.25 oz benedictine\n2 dashes Angostura orange bitters	Stir all ingredients over ice. Strain into a chilled coupe. Express a lemon twist over the drink and then place it on the edge of the glass.	\N	\N	\N
40	Rosita	Blanco Tequila	2	1.5 oz blanco tequila\n.5 sweet vermouth\n.5 oz dry vermouth\n.5 Campari\n1 dash Angostura	Stir all ingredients over ice. Strain into a chilled coupe. Express an orange twist over the drink, then place it into the drink.	\N	\N	\N
41	Sazerac	Absinthe	2	absinthe\n1.5 oz rye whiskey\n.5 oz cognac\n1 tsp demerara syrup\n4 dashes Petchaud's bitters\n1 dash Angostura bitters	Rinse an old-fashioned glass with absinthe and then dump. Stir the remaining ingredients over ice. Strain into the glass. Express the lemon twist over the drink and discard it.	\N	\N	\N
42	Sidecar	Cognac	2	1.5 oz cognac\n1 oz Cointreau\n.75 oz lemon juice	Shake all ingredients with ice. Strain into a chilled coupe. Express an orange twist over the drink, then place it into the drink.	\N	\N	\N
43	Southside	Gin	2	2 oz gin\n.75oz lime juice\n.75 oz simple syrup\n1 dash Angostura bitters	Gently muddle the mint in a shaker. Add the remaining ingredients and shake with ice. Strain into a chilled coupe. Garnish with a fresh mint leaf.	\N	\N	\N
44	Tequila Sunrise	Blanco Tequila	2	2 oz blanco tequila\n4 oz orange juice\n.25 oz lime juice\n.25 oz grenadine\n	Combine the tequila, orange juice, and lime juice in a highball glass. Add three ice cubes. Stir for three seconds. Add the grenadine and let it sink to the bottom of the glass. Garnish with half an orange wheel and a lime wedge.	\N	\N	\N
45	Ti Punch	Rhum Agricole Blanc	2	2 ounces rhum agricole blanc\n1 tsp sugar cane syrup\n1 lime wheel\n	In an old-fashioned glass, muddle the lime and syrup. Add the rhum and fill the glass with cracked ice. Stir briefly.	\N	\N	\N
46	Tom Collins	Seltzer	2	2 oz seltzer\n2 oz gin\n1 oz lemon juice\n.75 simple syrup	Pour the seltzer into a Collins glass. Short-shake the remaining ingredients with ice for about 5 seconds. Strain into the glass. Fill the glass with ice cubes. Garnish with a lemon wheel and cherry.	\N	\N	\N
47	Whisky Highball	Scotch	2	2 oz scotch\n6 oz seltzer	Pour the scotch intoa highball glass. Add 3 ice cubes. Stir for 3 seconds. Add the seltzer and stir once. Garnish with a lemon peel.	\N	\N	\N
48	Whiskey Sour	Bourbon	2	2 oz bourbon\n.75 lemon juice\n.75 simple syrup	Shake all ingredients with ice. Strain into a double old-fashioned glass over 1 large ice cube. Garnish with a lemon wheel and a cherry.	\N	\N	\N
49	White Lady	Gin	2	2 oz gin\n.5 oz Cointreau\n.75 oz lemon juice\n.25 simple syrup\n1 egg white	Shake all the ingredients without ice. Shake all ingredients again with ice. Double strain into a chilled coupe. Express a lemon twist over the drink, then place it on the edge of the glass.	\N	\N	\N
50	White Negroni	Gin	2	1.5 oz gin\n1 oz dry vermouth\n.75 Suze	Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Express an orange twist over the drink, then place it into the drink.	\N	\N	\N
\.


--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 216
-- Name: liquor_party_drink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.liquor_party_drink_id_seq', 50, true);


--
-- TOC entry 4699 (class 2606 OID 16725)
-- Name: drinkrecipes liquor_party_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drinkrecipes
    ADD CONSTRAINT liquor_party_pkey PRIMARY KEY (drink_id);


-- Completed on 2024-06-06 20:08:36

--
-- PostgreSQL database dump complete
--

