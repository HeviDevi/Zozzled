--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-08 19:39:09

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
6	Boulevardier	Bourbon	2	1.5 oz bourbon\n.75 oz sweet vermouth\n.75 oz Campari	Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Garnish with a cherry.	https://www.dropbox.com/scl/fi/ay32u90vy1w8qdva1ylex/Boulevardier.jpg?rlkey=6nlp9koki4o8slvbfnxlathii&st=oke464fc&dl=1	t	f
7	Brandy Alexander	Cognac	2	1.5 oz cognac\n1 oz creme de cacao\n1 oz heavy cream	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with grated nutmeg.	https://www.dropbox.com/scl/fi/okijttejs8cnfa0xw7pts/Brandy_Alexander.jpg?rlkey=d5f21smdlum8lrg10ojisjugl&st=9g2ynek2&dl=1	f	t
1	Americano	Vermouth	1	1 oz Campari \n1 oz sweet vermouth\n 4 oz seltzer	Pour Campari and sweet vermouth into a glass. Add ice and soda water.	https://www.dropbox.com/scl/fi/8wopozfgfjjxsfnal84hv/Americano.jpg?rlkey=cqxpqhvjateoisplvvqqmcm64&st=0m1htiow&dl=1	t	t
3	Aperol Spritz	Aperol	2	2 oz Aperol\n3 oz sparkling wine \n2 oz seltzer	Pour the Aperol into a wineglass. Fill the glass with ice cubes, then pour in the sparkling wine and seltzer. Mix gently with a bar spoon. Garnish with a grapefruit wedge.	https://www.dropbox.com/scl/fi/p4oq2hc2i75xl1hcv78ca/Aperol_Spritz.jpg?rlkey=dq7s4uxxbcyk1yylxrc8el7ku&st=nfvulqvc&dl=1	t	t
24	Martini	Gin	2	2 oz gin\n.75 oz dry vermouth\n	Stir all ingredients over ice. Strain into a chilled coupe. Garnish with an olive or express a lemon peel over the drink and set it on the side of the glass.	https://www.dropbox.com/scl/fi/wlg7m7pfwfariaingmev2/Martini.jpg?rlkey=py8it9lz8io314agg5fj6pifx&st=1sc8b2sm&dl=1	f	f
5	Between the Sheets	Cognac	1	.75 cognac\n.75 oz white rum \n.75 oz Cointreau\n.75 oz lemon juice	Shake all ingredients with ice. Double strain into a chilled coupe.	https://www.dropbox.com/scl/fi/vz7evmuy47ey65qluxs49/Between_The_Sheets.jpg?rlkey=3x8t69rlpbcclakccvv6716ur&st=jonmgw0k&dl=1	f	t
8	Brandy Flip	Cognac	2	1.5 oz Cognac\n.75 oz demerara syrup\n1 whole egg	Shake all ingredients without ice. Shake again with ice. Double strain into a chilled coupe. Garnish with grated nutmeg.	https://www.dropbox.com/scl/fi/fbsffgqtv0othf3sh1c6n/Brandy_Flip.jpg?rlkey=s6tuecv6eablr4lf3281u1ufe&st=l0f31hdb&dl=1	f	t
9	Champs-Elysees	Cognac	2	2 oz Cognac\n.5 oz Green Chartreuse\n.75 oz lemon juice\n.5 oz simple syrup\n1 dash angostura bitters	Shake all ingredients with ice. Strain into a chilled coupe. Express the lemon twist over the drink then set it on the edge of the glass.	https://www.dropbox.com/scl/fi/eflkodvhf3xa3x38qwpq2/Champs_Elysees.jpg?rlkey=hbvm97ekvv1ojmv0prjt50my5&st=1isnj0jd&dl=1	f	t
25	Mint Julep	Bourbon	2	1 mint bouquet\n2 oz bourbon\n.25 oz simple syrup\n	Rub the interior of the julep tin with the mint bouquet and then set it aside. Add the bourbon and syrup and fill the tin halfway with crushed ice. Stir, churning the ice as you go, for about 10 seconds. Fill the tin with ice until it is about two-thirds full. Stir until it is completely frosted. Add more ice to form a cone over the rim. Garnish with the mint bouquet and serve with a straw.	https://www.dropbox.com/scl/fi/3hx6ghdztwcnjxkftxbqd/Mint_Julep.jpg?rlkey=y51ivq6ujt6rsiqja0aus0hqr&st=9vciu96j&dl=1	f	t
4	Bee's Knees	Gin	2	2 oz gin\n3/4 oz lemon juice\n3/4 honey syrup	Shake all ingredients with ice. Double strain into a chilled coupe.	https://www.dropbox.com/scl/fi/zbhy2bf8o2omiujhhvq2l/Bees_Knees.jpg?rlkey=9xtox61j6jhu7akhhzfw49tve&st=f1b1jpp7&dl=1	t	t
19	Jack Rose	Apple Brandy	2	2 oz apple brandy\n.75 oz lime juice\n.75 grenadine	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with an apple slice.	https://www.dropbox.com/scl/fi/zqyehr013hps2wxsiyzqa/Jack_Rose.jpg?rlkey=hqmggi7101lhk0yw2dmh8t19b&st=gwidmwhp&dl=1	f	t
20	Last Word	Gin	1	.75 oz gin\n.75 oz green Chartreuse\n.75 oz maraschino liquer\n.75 lime juice	Shake all ingredients with ice. Double strain into a chilled coupe.	https://www.dropbox.com/scl/fi/jw1zfvn2kf3ej79s0z1x7/Last_Word.jpg?rlkey=zxpx18d0z76z1bmpt1eqkevnp&st=mg14pzpx&dl=1	f	t
21	Mai Tai	Aged Rum	1	1 oz aged rum\n1 oz rum agricole blanc\n.75 oz Cointreau\n1 oz lime juice\n.5 oz orgeat\n.5 oz simple syrup\n1 dash Angostura bitters	Shake all ingredients with a small amount of crushed ice. Dump into a double old-fashioned glass. Pack the glass with crushed ice. Garnish with a mint bouquet.	https://www.dropbox.com/scl/fi/2ryqm5wc1w3js6770e48y/Mai-Tai.jpg?rlkey=ky4opsy04xfgfyf831qhqdvwz&st=g1ra9pf7&dl=1	f	t
22	Manhattan	Rye Whiskey	2	2 oz rye whiskey \n1 oz sweet vermouth\n2 dash Angostura bitters	Stir all ingredients over ice. Strain into a chilled coupe. Garnish with 1 brandied cherry.	https://www.dropbox.com/scl/fi/pcudct6msp40wh76aklf9/Manhattan.jpg?rlkey=8txbnzho6i3m4emg4x8h151f4&st=s7xnq25v&dl=1	t	t
23	Margarita	Blanco Tequila	2	2 oz blanco tequila\n.75 oz Cointreau\n.75 oz lime juice\n.75 oz simple syrup\n1 lime wedge\nkosher salt, for the rim.	Rub the lime wedge along the rim of the glass. Roll the wet portion of the glass in the salt. Shake the remaining ingredients with ice. Strain into prepared glass.	https://www.dropbox.com/scl/fi/ax59tcplqbrxgq1730px9/Margarita.jpg?rlkey=zlhsbppuil6o7kee3evzjb9du&st=oog7nfpa&dl=1	f	t
33	Old-Fashioned	Bourbon	2	2 oz bourbon\n2 dashes Angostura bitters\n1 sugar cube\n	Muddle the sugar cube and simple syrup in an old-fashioned glass. Add the bourbon and 1 large ice cube. Stir until chilled. Garnish with lemon & orange twist.	https://www.dropbox.com/scl/fi/td1gzyynypu4gc8qmanuw/Old_Fashioned.webp?rlkey=d6wnqrmzo8r5i8u7imnqae4ys&st=4pad3fcy&dl=1	t	f
35	Peaches and Smoke	Lillet Rose	2	1.5 oz Lillet rose\n.5 oz cognac\n1 tsp scotch\n.75 oz creme de peche\n.75 oz lemon juice\n.25 oz simple syrup\n1 peach wedge\n	Muddle the peach wedge in a shaker. Add the remaining ingredients and shake with ice. Double strain into a chilled coupe. Garnish with a peach wedge.	https://www.dropbox.com/scl/fi/d0hgkm909qgdl6az8etqu/Peaches_And_Smoke.jpg?rlkey=96klcicpxnzevlexh9ns1ofpr&st=qlu7x2ms&dl=1	f	t
36	Pegu Club	Gin	2	2 oz gin\n.75 oz Cointreau\n.75 oz lime juice\n1 dash Angostura bitters\n1 dash Angostura oragne bitters	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a lime wheel.	https://www.dropbox.com/scl/fi/s0xfa0gifvs0n6ms13dkr/Pegu_Club.jpg?rlkey=d1pp96buaan1fr1s4ptag3k0v&st=mrz787ui&dl=1	f	t
37	Pink Lady	Gin	2	1.5 oz gin\n.5 oz apple brandy\n.5 lemon juice\n.5 grenadine\n.5 simple syrup\n1 egg white	Shake all the ingredients without ice. Shake all ingredients again with ice. Double strain into a chilled coupe. Garnish with a cherry.	https://www.dropbox.com/scl/fi/tb3ga1d22hrz4z2l63qnj/Pink_Lady.webp?rlkey=1wz2chvyutsnom7mk1m7dvwm6&st=izmyv5se&dl=1	f	t
38	Pisco Sour	Pisco	2	2 oz Pisco\n.5 lime juice\n.5 lemon juice\n.75 simple syrup\n1 egg white\n	Shake all the ingredients without ice. Shake all ingredients again with ice. Double strain into a chilled coupe. Carefully garnish the top of the foam with Angostura bitters.	https://www.dropbox.com/scl/fi/yeunrpy72o69e2wl7agzv/Pisco_Sour.webp?rlkey=ilxp451wknqjijjn2v3nimw6n&st=5fzchgpz&dl=1	f	t
13	Daiquiri	White Rum	2	2 oz white rum\n.75 oz lime juice\n.75 oz simple syrup	Shake all ingredients with ice. Double strain into a chilled coupe.	https://www.dropbox.com/scl/fi/duj7dokuxufffiz9ss7bl/Daiquiri.webp?rlkey=3fxzr3tjuek7oxcj4n7ujr8oy&st=owlrtqee&dl=1	f	t
10	Corpse Reviver No.2	Gin	1	.75 oz gin\n.75 oz Lillet blanc\n.75 Cointreau\n.75 lemon juice\n2 dashes absinthe	Shake all ingredients with ice. Double strain into a chilled coupe.	https://www.dropbox.com/scl/fi/4gigebxsujs8g0zvdq19i/Corpse_Reviver_No-2.webp?rlkey=2slsf1gyshewu5bqcwropvilt&st=9s4jbfrq&dl=1	f	t
11	Cosmopolitan	Vodka	2	2 oz vodka\n.75 oz Cointreau\n.5 oz lime juice\n.5 cranberry juice\n.5 oz simple syrup\n	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a lime wheel.	https://www.dropbox.com/scl/fi/ihtvs067usnuuw2fhrz8l/Cosmopolitan.jpg?rlkey=iifpy2zxspfl8xaap3y4e42wm&st=jfo0sdbn&dl=1	f	t
12	Cuba Libre	White Rum	2	2 oz white rum\n.25 oz lime juice\n4 oz Coca-Cola	Pour the rum into a highball glass and add three ice cubes. Stir for 3 seconds. Add the lime juice and cola and stir once with a bar spoon. Garnish with a lime wedge.	https://www.dropbox.com/scl/fi/sfjxnmep3bj6nt2c1hcl2/Cuba_Libre.webp?rlkey=9cjgsx7m1n46t1dffmn995xw1&st=r5askiki&dl=1	f	t
15	Grasshopper	Creme de Menthe	1	1 oz creme de menthe\n1 oz creme de cacao\n1 oz heavy cream\n8 mint leaves	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a fresh mint leaf.	https://www.dropbox.com/scl/fi/vx38c15t56ylfqmofyzoj/Grasshopper.webp?rlkey=skikrgbv9d8xeei5obf0lnv4k&st=cviqw3ab&dl=1	f	t
16	Hemingway Daiquiri	White Rum	2	1.5 oz white rum\n.5 oz maraschino liquer\n1 oz grapefruit juice\n.5 oz lime juice\n1 tsp simple syrup	Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a lime wheel.	https://www.dropbox.com/scl/fi/2jbwv3emmaccqdzo37va1/Hemingway_Daiquiri.webp?rlkey=nxysrx06eum4uk7yq54zyuf1r&st=nz1xwytm&dl=1	f	t
18	Improved Whiskey Cocktail	Bourbon	2	2 oz bourbon\n1 tsp maraschino liqueur\n1 dash absinthe\n1 dash Angostura\n1 dash Peychaud's bitters	Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Express a lemon twist over the drink, then place it into the drink.	https://www.dropbox.com/scl/fi/3hllhyowcuenq5asuzldq/Impoved_Whiskey_Cocktail.webp?rlkey=9vyi3b7ggdfnjyk8nbzgburg2&st=w62f3lwl&dl=1	t	f
39	Poets Dream	Gin	2	2 oz gin\n.75 dry vermouth\n.25 oz benedictine\n2 dashes Angostura orange bitters	Stir all ingredients over ice. Strain into a chilled coupe. Express a lemon twist over the drink and then place it on the edge of the glass.	https://www.dropbox.com/scl/fi/qqhmahvq32zba0mza6t5p/Poets_Dream.jpg?rlkey=z0gdx2sgicte2q1xqrh0dfd0d&st=2ntbru3t&dl=1	t	f
40	Rosita	Blanco Tequila	2	1.5 oz blanco tequila\n.5 sweet vermouth\n.5 oz dry vermouth\n.5 Campari\n1 dash Angostura	Stir all ingredients over ice. Strain into a chilled coupe. Express an orange twist over the drink, then place it into the drink.	https://www.dropbox.com/scl/fi/by73ak4ow01m78pl8upzk/Rosita.jpg?rlkey=u3ovly9xyu4cfgb71rorv064c&st=p52g4x5u&dl=1	t	f
41	Sazerac	Absinthe	2	absinthe\n1.5 oz rye whiskey\n.5 oz cognac\n1 tsp demerara syrup\n4 dashes Petchaud's bitters\n1 dash Angostura bitters	Rinse an old-fashioned glass with absinthe and then dump. Stir the remaining ingredients over ice. Strain into the glass. Express the lemon twist over the drink and discard it.	https://www.dropbox.com/scl/fi/6muq2et48x0rlvrdgyn7t/Sazerac.jpg?rlkey=jzodeamf4ynuj57pb7khnffrg&st=swn71ty5&dl=1	t	f
42	Sidecar	Cognac	2	1.5 oz cognac\n1 oz Cointreau\n.75 oz lemon juice	Shake all ingredients with ice. Strain into a chilled coupe. Express an orange twist over the drink, then place it into the drink.	https://www.dropbox.com/scl/fi/gw8r83jic1p7hkrzuuznm/Sidecar.jpg?rlkey=djrv2apnjy5aal0dxwor6vcmo&st=gzxkafx9&dl=1	f	t
17	Hot Toddy	Bourbon	2	2 lemon wedges\n1.5 oz bourbon\n.75 oz honey syrup\n1 dash Angostura bitters\n4 oz boiling water	Combine all ingredients (except the water) in a mixing glass and stir. Pour into a toddy mug, then pour in the boiling water. Garnish with a cinnamon stick.	https://www.dropbox.com/scl/fi/9i5kgza5mkoc507fcichi/Hot_Toddy.jpg?rlkey=y33mbiliunup1vf3ddrpbyt57&st=ebes1vu6&dl=1	f	f
14	French 75	Gin	1	1 oz gin\n.5 oz lemon juice\n.5 oz simple syrup\n4 oz sparkling wine	Shake all ingredients (except for the sparkling wine) with ice. Strain into a chilled flute. Pour in the sparkling wine and gently mix with a bar spoon. Express a lemon twist over the drink then place it into the drink.	\N	\N	\N
26	Mojito	White Rum	2	2 oz white rum\n1 oz lime juice\n.75 simple syrup\n1 white sugar cube\n10 min leaves	Gently muddle the mint leaves, simple syrup, and sugar cube in a shaker. Add the remaining ingredients and shake with a small amount of crushed ice. Dump into a Collins glass and add crushed ice until about four-fifths full. Swizzle for a few seconds, then pack the glass with ice. Garnish with mint bouquet then serve with a straw.	https://www.dropbox.com/scl/fi/juaech336utii0vqfhny9/Mojito.png?rlkey=v7j79l92f0m2n94irmdc8d01u&st=qorkkexf&dl=1	f	t
30	Moscow Mule	Vodka	2	2 oz seltzer\n2 oz vodka\n.5 lime juice\n.75 ginger syrup	Pour the chilled seltzer into a Collins glass. Short-shake the remaining ingredients for about 5 seconds. Strain into the glass. Fill the glass with ice cubes & garnish with a lime wheel.	https://www.dropbox.com/scl/fi/iunblgcpk9rac4m8fi582/Moscow_Mule.jpg?rlkey=nf2ltdpon234scr1rq0dii5kg&st=87sdkvbk&dl=1	f	t
31	Negroni	Gin	1	1 oz gin\n1 oz sweet vermouth\n1 oz Campari	Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Express an orange twist over the drink, then place it into the drink.	https://www.dropbox.com/scl/fi/91le2lxmbw5umhvm0b8mo/Negroni.jpg?rlkey=vpx419wl35vm9m5424ekqqq94&st=6yw799y9&dl=1	t	f
32	Old Cuban	Aged Rum	2	1.5 oz aged rum\n.75 lime juice\n1 oz simple syrup\n2 dashes Angostura bitters\n6 mint leaves\n2 oz champagne	Shake all ingredients (except the champagne) with ice. Double strain into a chilled coupe. Pour in the champagne and mix gently with a bar spoon. Garnish with a fresh mint leaf.	https://www.dropbox.com/scl/fi/4tef6rx95104ed43u4yjp/Old_Cuban.jpg?rlkey=z62kjjv1t9lxawp7lr7li7ep5&st=3zqq2bfl&dl=1	f	t
34	Old Pal	Rye Whiskey	2	1.5 oz rye whiskey\n.75 dry vermouth\n.75 Campari	Stir all ingredients over ice. Strain into a chilled coupe. Express an orange twist over the drink and then place it into the drink.	https://www.dropbox.com/scl/fi/0nmrqbtlmos7dehlhlg8f/Old_Pal.webp?rlkey=q9rkqaqz5uvu1jsnu84tdifs1&st=odlvt2l0&dl=1	t	f
43	Southside	Gin	2	2 oz gin\n.75oz lime juice\n.75 oz simple syrup\n1 dash Angostura bitters	Gently muddle the mint in a shaker. Add the remaining ingredients and shake with ice. Strain into a chilled coupe. Garnish with a fresh mint leaf.	https://www.dropbox.com/scl/fi/kffuzrlecqglkjijlq0g1/Southside.jpg?rlkey=7ehg4hfgw24ju0i7wg5adu9ik&st=81snrdj8&dl=1	f	t
44	Tequila Sunrise	Blanco Tequila	2	2 oz blanco tequila\n4 oz orange juice\n.25 oz lime juice\n.25 oz grenadine\n	Combine the tequila, orange juice, and lime juice in a highball glass. Add three ice cubes. Stir for three seconds. Add the grenadine and let it sink to the bottom of the glass. Garnish with half an orange wheel and a lime wedge.	https://www.dropbox.com/scl/fi/w90jb57n0ooaep0xuc8u4/Tequila_Sunrise.jpg?rlkey=08flxzvmsa2tc7mdjts9e7l1e&st=2xbxi9ho&dl=1	f	t
45	Ti Punch	Rhum Agricole Blanc	2	2 ounces rhum agricole blanc\n1 tsp sugar cane syrup\n1 lime wheel\n	In an old-fashioned glass, muddle the lime and syrup. Add the rhum and fill the glass with cracked ice. Stir briefly.	https://www.dropbox.com/scl/fi/e50y29nnlb0nboenayyc1/Ti_Punch.jpg?rlkey=x8b2y4zjjnzyqkt2oo6wt7b68&st=w690qxkx&dl=1	t	f
46	Tom Collins	Seltzer	2	2 oz seltzer\n2 oz gin\n1 oz lemon juice\n.75 simple syrup	Pour the seltzer into a Collins glass. Short-shake the remaining ingredients with ice for about 5 seconds. Strain into the glass. Fill the glass with ice cubes. Garnish with a lemon wheel and cherry.	https://www.dropbox.com/scl/fi/lvdglb5y0rvumzfio7tlm/Tom_Collins.webp?rlkey=a84cvghffsn6ln4jtvixd6nif&st=5t7x619i&dl=1	f	t
47	Whisky Highball	Scotch	2	2 oz scotch\n6 oz seltzer	Pour the scotch intoa highball glass. Add 3 ice cubes. Stir for 3 seconds. Add the seltzer and stir once. Garnish with a lemon peel.	https://www.dropbox.com/scl/fi/1t3ae8fzomeo2638kz9w6/Whiskey_Highball.jpg?rlkey=igvz5sdi2a7eu76g9k4mqxk13&st=n8i87td1&dl=1	f	f
48	Whiskey Sour	Bourbon	2	2 oz bourbon\n.75 lemon juice\n.75 simple syrup	Shake all ingredients with ice. Strain into a double old-fashioned glass over 1 large ice cube. Garnish with a lemon wheel and a cherry.	https://www.dropbox.com/scl/fi/aweoifn10uw8clb4dlxn9/Whiskey_Sour.jpg?rlkey=eq3b1v1jwcejup09rkj8b56al&st=fxjowpow&dl=1	f	t
49	White Lady	Gin	2	2 oz gin\n.5 oz Cointreau\n.75 oz lemon juice\n.25 simple syrup\n1 egg white	Shake all the ingredients without ice. Shake all ingredients again with ice. Double strain into a chilled coupe. Express a lemon twist over the drink, then place it on the edge of the glass.	https://www.dropbox.com/scl/fi/plm5tpt39p3vppewflesd/White_Lady.jpg?rlkey=yfk09oruvdpsgn90r4s9y40ow&st=rffyxdvh&dl=1	f	t
50	White Negroni	Gin	2	1.5 oz gin\n1 oz dry vermouth\n.75 Suze	Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Express an orange twist over the drink, then place it into the drink.	https://www.dropbox.com/scl/fi/nqllymvgtkpzg63kq0gbt/White_Negroni.jpg?rlkey=o3utcgk17132aumpk4571dnqq&st=2qi8s8ss&dl=1	t	f
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


-- Completed on 2024-06-08 19:39:09

--
-- PostgreSQL database dump complete
--

