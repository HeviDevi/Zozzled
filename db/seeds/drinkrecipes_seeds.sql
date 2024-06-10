



DROP TABLE IF EXISTS public.drinkrecipes;

CREATE TABLE public.drinkrecipes (
    drink_id SERIAL PRIMARY KEY,
    drink_name VARCHAR(50) NOT NULL,
    spirit_type VARCHAR(50) NOT NULL,
    spirit_amount INTEGER NOT NULL,
    ingredients TEXT NOT NULL,
    instructions TEXT NOT NULL,
    image_link TEXT,
    bitter BOOLEAN,
    sweet BOOLEAN
);

INSERT INTO public.drinkrecipes (
        drink_id,
        drink_name,
        spirit_type,
        spirit_amount,
        ingredients,
        instructions,
        image_link,
        bitter,
        sweet
    )
VALUES (
        6,
        'Boulevardier',
        'Bourbon',
        2,
        '1.5 oz bourbon, .75 oz sweet vermouth & .75 oz Campari',
        'Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Garnish with a cherry.',
        'https://www.dropbox.com/scl/fi/ay32u90vy1w8qdva1ylex/Boulevardier.jpg?rlkey=6nlp9koki4o8slvbfnxlathii&st=oke464fc&dl=1',
        true,
        false
    ),
    (
        7,
        'Brandy Alexander',
        'Cognac',
        2,
        '1.5 oz cognac, 1 oz creme de cacao & 1 oz heavy cream',
        'Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with grated nutmeg.',
        'https://www.dropbox.com/scl/fi/okijttejs8cnfa0xw7pts/Brandy_Alexander.jpg?rlkey=d5f21smdlum8lrg10ojisjugl&st=9g2ynek2&dl=1',
        false,
        true
    ),
    (
        1,
        'Americano',
        'Vermouth',
        1,
        '1 oz Campari, 1 oz sweet vermouth & 4 oz seltzer',
        'Pour Campari and sweet vermouth into a glass. Add ice and soda water.',
        'https://www.dropbox.com/scl/fi/8wopozfgfjjxsfnal84hv/Americano.jpg?rlkey=cqxpqhvjateoisplvvqqmcm64&st=0m1htiow&dl=1',
        true,
        true
    ),
    (
        3,
        'Aperol Spritz',
        'Aperol',
        2,
        '2 oz Aperol, 3 oz sparkling wine & 2 oz seltzer',
        'Pour the Aperol into a wineglass. Fill the glass with ice cubes, then pour in the sparkling wine and seltzer. Mix gently with a bar spoon. Garnish with a grapefruit wedge.',
        'https://www.dropbox.com/scl/fi/p4oq2hc2i75xl1hcv78ca/Aperol_Spritz.jpg?rlkey=dq7s4uxxbcyk1yylxrc8el7ku&st=nfvulqvc&dl=1',
        true,
        true
    ),
    (
        4,
        'Bee''s Knees',
        'Gin',
        2,
        '2 oz gin, 3/4 oz lemon juice & 3/4 oz honey syrup',
        'Shake all ingredients with ice. Double strain into a chilled coupe.',
        'https://www.dropbox.com/scl/fi/zbhy2bf8o2omiujhhvq2l/Bees_Knees.jpg?rlkey=9xtox61j6jhu7akhhzfw49tve&st=f1b1jpp7&dl=1',
        false,
        true
    ),
    (
        5,
        'Between the Sheets',
        'Cognac',
        1,
        '.75 cognac, 75 oz white rum,  .75 oz Cointreau & .75 oz lemon juice',
        'Shake all ingredients with ice. Double strain into a chilled coupe.',
        'https://www.dropbox.com/scl/fi/vz7evmuy47ey65qluxs49/Between_The_Sheets.jpg?rlkey=3x8t69rlpbcclakccvv6716ur&st=jonmgw0k&dl=1',
        false,
        true
    ),
    (
        8,
        'Brandy Flip',
        'Cognac',
        2,
        '1.5 oz Cognac, .75 oz demerara syrup & 1 whole egg',
        'Shake all ingredients without ice. Shake again with ice. Double strain into a chilled coupe. Garnish with grated nutmeg.',
        'https://www.dropbox.com/scl/fi/fbsffgqtv0othf3sh1c6n/Brandy_Flip.jpg?rlkey=s6tuecv6eablr4lf3281u1ufe&st=l0f31hdb&dl=1',
        false,
        true
    ),
    (
        9,
        'Champs-Elysees',
        'Cognac',
        2,
        '2 oz Cognac, .5 oz Green Chartreuse, .75 oz lemon juice, .5 oz simple syrup & 1 dash angostura bitters',
        'Shake all ingredients with ice. Strain into a chilled coupe. Express the lemon twist over the drink then set it on the edge of the glass.',
        'https://www.dropbox.com/scl/fi/eflkodvhf3xa3x38qwpq2/Champs_Elysees.jpg?rlkey=hbvm97ekvv1ojmv0prjt50my5&st=1isnj0jd&dl=1',
        false,
        true
    ),
    (
        10,
        'Corpse Reviver #2',
        'Gin',
        1,
        '.75 oz gin, .75 oz Cointreau, .75 oz Lillet Blanc, .75 oz lemon juice & 1 dash absinthe',
        'Shake all ingredients with ice. Strain into a chilled coupe. Garnish with a lemon twist.',
        'https://www.dropbox.com/scl/fi/4gigebxsujs8g0zvdq19i/Corpse_Reviver_No-2.webp?rlkey=2slsf1gyshewu5bqcwropvilt&st=9s4jbfrq&dl=1',
        false,
        true
    ),
    (
        13,
        'Daiquiri',
        'Rum',
        2,
        '2 oz white rum, .75 oz lime juice & .75 oz simple syrup',
        'Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a lime wheel.',
        'https://www.dropbox.com/scl/fi/duj7dokuxufffiz9ss7bl/Daiquiri.webp?rlkey=3fxzr3tjuek7oxcj4n7ujr8oy&st=owlrtqee&dl=1',
        false,
        true
    ),
    (
        11,
        'Cosmopolitan',
        'Vodka',
        2,
        '2 oz vodka, .75 oz Cointreau, .5 oz lime juice, .5 oz cranberry juice & .5 oz simple syrup',
        'Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a lime wheel.',
        'https://www.dropbox.com/scl/fi/ihtvs067usnuuw2fhrz8l/Cosmopolitan.jpg?rlkey=iifpy2zxspfl8xaap3y4e42wm&st=jfo0sdbn&dl=1',
        false,
        true
    ),
    (
        12,
        'Cuba Libre',
        'White Rum',
        2,
        '2 oz white rum, .25 oz lime juice & 4 oz Coca-Cola',
        'Pour the rum into a highball glass and add three ice cubes. Stir for 3 seconds. Add the lime juice and cola and stir once with a bar spoon. Garnish with a lime wedge.',
        'https://www.dropbox.com/scl/fi/sfjxnmep3bj6nt2c1hcl2/Cuba_Libre.webp?rlkey=9cjgsx7m1n46t1dffmn995xw1&st=r5askiki&dl=1',
        false,
        true
    ),
    (
        15,
        'Grasshopper',
        'Creme de Menthe',
        1,
        '1 oz creme de menthe, 1 oz creme de cacao, 1 oz heavy cream & 8 mint leaves',
        'Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a fresh mint leaf.',
        'https://www.dropbox.com/scl/fi/vx38c15t56ylfqmofyzoj/Grasshopper.webp?rlkey=skikrgbv9d8xeei5obf0lnv4k&st=cviqw3ab&dl=1',
        false,
        true
    ),
    (
        16,
        'Hemingway Daiquiri',
        'White Rum',
        2,
        '1.5 oz white rum, .5 oz maraschino liquer, 1 oz grapefruit juice, .5 oz lime juice & 1 tsp simple syrup',
        'Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a lime wheel.',
        'https://www.dropbox.com/scl/fi/2jbwv3emmaccqdzo37va1/Hemingway_Daiquiri.webp?rlkey=nxysrx06eum4uk7yq54zyuf1r&st=nz1xwytm&dl=1',
        false,
        true
    ),
    (
        17,
        'Hot Toddy',
        'Bourbon',
        2,
        '2 lemon wedges, 1.5 oz bourbon, .75 oz honey syrup, 1 dash Angostura bitters & 4 oz boiling water',
        'Combine all ingredients (except the water) in a mixing glass and stir. Pour into a toddy mug, then pour in the boiling water. Garnish with a cinnamon stick.',
        'https://www.dropbox.com/scl/fi/9i5kgza5mkoc507fcichi/Hot_Toddy.jpg?rlkey=y33mbiliunup1vf3ddrpbyt57&st=ebes1vu6&dl=1',
        false,
        false
    ),
    (
        18,
        'Improved Whiskey Cocktail',
        'Bourbon',
        2,
        '2 oz bourbon, 1 tsp maraschino liqueur, 1 dash absinthe, 1 dash Angostura & 1 dash Peychauds bitters',
        'Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Express a lemon twist over the drink, then place it into the drink.',
        'https://www.dropbox.com/scl/fi/3hllhyowcuenq5asuzldq/Impoved_Whiskey_Cocktail.webp?rlkey=9vyi3b7ggdfnjyk8nbzgburg2&st=w62f3lwl&dl=1',
        true,
        false
    ),
    (
        19,
        'Jack Rose',
        'Apple Brandy',
        2,
        '2 oz apple brandy, .75 oz lime juice & .75 grenadine',
        'Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with an apple slice.',
        'https://www.dropbox.com/scl/fi/zqyehr013hps2wxsiyzqa/Jack_Rose.jpg?rlkey=hqmggi7101lhk0yw2dmh8t19b&st=gwidmwhp&dl=1',
        false,
        true
    ),
    (
        20,
        'Last Word',
        'Gin',
        1,
        '.75 oz gin, .75 oz Green Chartreuse, .75 oz maraschino liquer & .75 oz lime juice',
        'Shake all ingredients with ice. Double strain into a chilled coupe.',
        'https://www.dropbox.com/scl/fi/jw1zfvn2kf3ej79s0z1x7/Last_Word.jpg?rlkey=zxpx18d0z76z1bmpt1eqkevnp&st=mg14pzpx&dl=1',
        false,
        true
    ),
    (
        21,
        'Mai Tai',
        'Aged Rum',
        1,
        '1 oz aged rum, 1 oz rum agricole blanc, .75 oz Cointreau, 1 oz lime juice, .5 oz orgeat, .5 oz simple syrup & 1 dash Angostura bitters',
        'Shake all ingredients with a small amount of crushed ice. Dump into a double old-fashioned glass. Pack the glass with crushed ice. Garnish with a mint bouquet.',
        'https://www.dropbox.com/scl/fi/2ryqm5wc1w3js6770e48y/Mai-Tai.jpg?rlkey=ky4opsy04xfgfyf831qhqdvwz&st=g1ra9pf7&dl=1',
        false,
        true
    ),
    (
        22,
        'Manhattan',
        'Rye Whiskey',
        2,
        '2 oz rye whiskey, 1 oz sweet vermouth & 2 dash Angostura bitters',
        'Stir all ingredients over ice. Strain into a chilled coupe. Garnish with 1 brandied cherry.',
        'https://www.dropbox.com/scl/fi/pcudct6msp40wh76aklf9/Manhattan.jpg?rlkey=8txbnzho6i3m4emg4x8h151f4&st=s7xnq25v&dl=1',
        true,
        true
    ),
    (
        23,
        'Margarita',
        'Blanco Tequila',
        2,
        '2 oz blanco tequila, .75 oz Cointreau, .75 oz lime juice, .75 oz simple syrup, 1 lime wedge & kosher salt for the rim.',
        'Rub the lime wedge along the rim of the glass. Roll the wet portion of the glass in the salt. Shake the remaining ingredients with ice. Strain into prepared glass.',
        'https://www.dropbox.com/scl/fi/ax59tcplqbrxgq1730px9/Margarita.jpg?rlkey=zlhsbppuil6o7kee3evzjb9du&st=oog7nfpa&dl=1',
        false,
        true
    ),
    (
        24,
        'Martini',
        'Gin',
        2,
        '2 oz gin & .75 oz dry vermouth',
        'Stir all ingredients over ice. Strain into a chilled coupe. Garnish with an olive or express a lemon peel over the drink and set it on the side of the glass.',
        'https://www.dropbox.com/scl/fi/wlg7m7pfwfariaingmev2/Martini.jpg?rlkey=py8it9lz8io314agg5fj6pifx&st=1sc8b2sm&dl=1',
        false,
        false
    ),
    (
        25,
        'Mint Julep',
        'Bourbon',
        2,
        '1 mint bouquet, 2 oz bourbon & .25 oz simple syrup',
        'Rub the interior of the julep tin with the mint bouquet and then set it aside. Add the bourbon and syrup and fill the tin halfway with crushed ice. Stir, churning the ice as you go, for about 10 seconds. Fill the tin with ice until it is about two-thirds full. Stir until it is completely frosted. Add more ice to form a cone over the rim. Garnish with the mint bouquet and serve with a straw.',
        'https://www.dropbox.com/scl/fi/3hx6ghdztwcnjxkftxbqd/Mint_Julep.jpg?rlkey=y51ivq6ujt6rsiqja0aus0hqr&st=9vciu96j&dl=1',
        false,
        true
    ),
    (
        26,
        'Mojito',
        'White Rum',
        2,
        '2 oz white rum, 1 oz lime juice, .75 simple syrup, 1 white sugar cube & 10 min leaves',
        'Gently muddle the mint leaves, simple syrup, and sugar cube in a shaker. Add the remaining ingredients and shake with a small amount of crushed ice. Dump into a Collins glass and add crushed ice until about four-fifths full. Swizzle for a few seconds, then pack the glass with ice. Garnish with mint bouquet then serve with a straw.',
        'https://www.dropbox.com/scl/fi/juaech336utii0vqfhny9/Mojito.png?rlkey=v7j79l92f0m2n94irmdc8d01u&st=qorkkexf&dl=1',
        false,
        true
    ),
    (
        27,
        'Moscow Mule',
        'Vodka',
        2,
        '2 oz seltzer, 2 oz vodka, .5 oz lime juice .75 oz ginger syrup',
        'Pour the chilled seltzer into a Collins glass. Short-shake the remaining ingredients for about 5 seconds. Strain into the glass. Fill the glass with ice cubes & garnish with a lime wheel.',
        'https://www.dropbox.com/scl/fi/iunblgcpk9rac4m8fi582/Moscow_Mule.jpg?rlkey=nf2ltdpon234scr1rq0dii5kg&st=87sdkvbk&dl=1',
        false,
        true
    ),
    (
        28,
        'Negroni',
        'Gin',
        1,
        '1 oz gin, 1 oz sweet vermouth & 1 oz Campari',
        'Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Express an orange twist over the drink, then place it into the drink.',
        'https://www.dropbox.com/scl/fi/91le2lxmbw5umhvm0b8mo/Negroni.jpg?rlkey=vpx419wl35vm9m5424ekqqq94&st=6yw799y9&dl=1',
        true,
        false
    ),
    (
        29,
        'Old Cuban',
        'Aged Rum',
        2,
        '1.5 oz aged rum, .75 lime juice, 1 oz simple syrup, 2 dashes Angostura bitters, 6 mint leaves & 2 oz champagne',
        'Shake all ingredients (except the champagne) with ice. Double strain into a chilled coupe. Pour in the champagne and mix gently with a bar spoon. Garnish with a fresh mint leaf.',
        'https://www.dropbox.com/scl/fi/4tef6rx95104ed43u4yjp/Old_Cuban.jpg?rlkey=z62kjjv1t9lxawp7lr7li7ep5&st=3zqq2bfl&dl=1',
        false,
        true
    ),
    (
        30,
        'Old-Fashioned',
        'Bourbon',
        2,
        '2 oz bourbon, 2 dashes Angostura bitters & 1 sugar cube',
        'Muddle the sugar cube and simple syrup in an old-fashioned glass. Add the bourbon and 1 large ice cube. Stir until chilled. Garnish with lemon & orange twist.',
        'https://www.dropbox.com/scl/fi/td1gzyynypu4gc8qmanuw/Old_Fashioned.webp?rlkey=d6wnqrmzo8r5i8u7imnqae4ys&st=4pad3fcy&dl=1',
        true,
        false
    ),
    (
        31,
        'Old Pal',
        'Rye Whiskey',
        2,
        '1.5 oz rye whiskey, .75 dry vermouth & .75 Campari',
        'Stir all ingredients over ice. Strain into a chilled coupe. Express an orange twist over the drink and then place it into the drink.',
        'https://www.dropbox.com/scl/fi/0nmrqbtlmos7dehlhlg8f/Old_Pal.webp?rlkey=q9rkqaqz5uvu1jsnu84tdifs1&st=odlvt2l0&dl=1',
        true,
        false
    ),
    (
        32,
        'Peaches and Smoke',
        'Lillet Rose',
        2,
        '1.5 oz Lillet rose, .5 oz cognac, 1 tsp scotch, .75 oz creme de peche, .75 oz lemon juice, .25 oz simple syrup & 1 peach wedge',
        'Muddle the peach wedge in a shaker. Add the remaining ingredients and shake with ice. Double strain into a chilled coupe. Garnish with a peach wedge.',
        'https://www.dropbox.com/scl/fi/d0hgkm909qgdl6az8etqu/Peaches_And_Smoke.jpg?rlkey=96klcicpxnzevlexh9ns1ofpr&st=qlu7x2ms&dl=1',
        false,
        true
    ),
    (
        33,
        'Pegu Club',
        'Gin',
        2,
        '2 oz gin, .75 oz Cointreau, .75 oz lime juice, 1 dash Angostura bitters & 1 dash Angostura oragne bitters',
        'Shake all ingredients with ice. Double strain into a chilled coupe. Garnish with a lime wheel.',
        'https://www.dropbox.com/scl/fi/s0xfa0gifvs0n6ms13dkr/Pegu_Club.jpg?rlkey=d1pp96buaan1fr1s4ptag3k0v&st=mrz787ui&dl=1',
        false,
        true
    ),
    (
        34,
        'Pink Lady',
        'Gin',
        2,
        '1.5 oz gin, .5 oz apple brandy, .5 oz lemon juice, .5 oz grenadine, .5 oz simple syrup & 1 egg white',
        'Shake all the ingredients without ice. Shake all ingredients again with ice. Double strain into a chilled coupe. Garnish with a cherry.',
        'https://www.dropbox.com/scl/fi/tb3ga1d22hrz4z2l63qnj/Pink_Lady.webp?rlkey=1wz2chvyutsnom7mk1m7dvwm6&st=izmyv5se&dl=1',
        false,
        true
    ),
    (
        35,
        'Pisco Sour',
        'Pisco',
        2,
        '2 oz Pisco, .5 oz lime juice, .5 oz lemon juice, .75 oz simple syrup & 1 egg white',
        'Shake all the ingredients without ice. Shake all ingredients again with ice. Double strain into a chilled coupe. Carefully garnish the top of the foam with Angostura bitters.',
        'https://www.dropbox.com/scl/fi/yeunrpy72o69e2wl7agzv/Pisco_Sour.webp?rlkey=ilxp451wknqjijjn2v3nimw6n&st=5fzchgpz&dl=1',
        false,
        true
    ),
    (
        36,
        'Poets Dream',
        'Gin',
        2,
        '2 oz gin, .75 oz dry vermouth .25 oz benedictine & 2 dashes Angostura orange bitters',
        'Stir all ingredients over ice. Strain into a chilled coupe. Express a lemon twist over the drink and then place it on the edge of the glass.',
        'https://www.dropbox.com/scl/fi/qqhmahvq32zba0mza6t5p/Poets_Dream.jpg?rlkey=z0gdx2sgicte2q1xqrh0dfd0d&st=2ntbru3t&dl=1',
        true,
        false
    ),
    (
        37,
        'Rosita',
        'Blanco Tequila',
        2,
        '1.5 oz blanco tequila, .5 oz sweet vermouth, .5 oz dry vermouth, .5 oz Campari & 1 dash Angostura',
        'Stir all ingredients over ice. Strain into a chilled coupe. Express an orange twist over the drink, then place it into the drink.',
        'https://www.dropbox.com/scl/fi/by73ak4ow01m78pl8upzk/Rosita.jpg?rlkey=u3ovly9xyu4cfgb71rorv064c&st=p52g4x5u&dl=1',
        true,
        false
    ),
    (
        38,
        'Sazerac',
        'Absinthe',
        2,
        'Absinthe, 1.5 oz rye whiskey, .5 oz cognac, 1 tsp demerara syrup, 4 dashes Petchauds bitters & 1 dash Angostura bitters',
        'Rinse an old-fashioned glass with absinthe and then dump. Stir the remaining ingredients over ice. Strain into the glass. Express the lemon twist over the drink and discard it.',
        'https://www.dropbox.com/scl/fi/6muq2et48x0rlvrdgyn7t/Sazerac.jpg?rlkey=jzodeamf4ynuj57pb7khnffrg&st=swn71ty5&dl=1',
        true,
        false
    ),
    (
        39,
        'Sidecar',
        'Cognac',
        2,
        '1.5 oz cognac, 1 oz Cointreau & .75 oz lemon juice',
        'Shake all ingredients with ice. Strain into a chilled coupe. Express an orange twist over the drink, then place it into the drink.',
        'https://www.dropbox.com/scl/fi/gw8r83jic1p7hkrzuuznm/Sidecar.jpg?rlkey=djrv2apnjy5aal0dxwor6vcmo&st=gzxkafx9&dl=1',
        false,
        true
    ),
    (
        40,
        'Southside',
        'Gin',
        2,
        '2 oz gin, .75 oz lime juice, .75 oz simple syrup & 1 dash Angostura bitters',
        'Gently muddle the mint in a shaker. Add the remaining ingredients and shake with ice. Strain into a chilled coupe. Garnish with a fresh mint leaf.',
        'https://www.dropbox.com/scl/fi/kffuzrlecqglkjijlq0g1/Southside.jpg?rlkey=7ehg4hfgw24ju0i7wg5adu9ik&st=81snrdj8&dl=1',
        false,
        true
    ),
    (
        41,
        'Tequila Sunrise',
        'Blanco Tequila',
        2,
        '2 oz blanco tequila, 4 oz orange juice, .25 oz lime juice & .25 oz grenadine',
        'Combine the tequila, orange juice, and lime juice in a highball glass. Add three ice cubes. Stir for three seconds. Add the grenadine and let it sink to the bottom of the glass. Garnish with half an orange wheel and a lime wedge.',
        'https://www.dropbox.com/scl/fi/w90jb57n0ooaep0xuc8u4/Tequila_Sunrise.jpg?rlkey=08flxzvmsa2tc7mdjts9e7l1e&st=2xbxi9ho&dl=1',
        false,
        true
    ),
    (
        42,
        'Ti Punch',
        'Rhum Agricole Blanc',
        2,
        '2 ounces rhum agricole blanc, 1 tsp sugar cane syrup & 1 lime wheel',
        'In an old-fashioned glass, muddle the lime and syrup. Add the rhum and fill the glass with cracked ice. Stir briefly.',
        'https://www.dropbox.com/scl/fi/e50y29nnlb0nboenayyc1/Ti_Punch.jpg?rlkey=x8b2y4zjjnzyqkt2oo6wt7b68&st=w690qxkx&dl=1',
        true,
        false
    ),
    (
        43,
        'Tom Collins',
        'Seltzer',
        2,
        '2 oz seltzer, 2 oz gin, 1 oz lemon juice & .75 oz simple syrup',
        'Pour the seltzer into a Collins glass. Short-shake the remaining ingredients with ice for about 5 seconds. Strain into the glass. Fill the glass with ice cubes. Garnish with a lemon wheel and cherry.',
        'https://www.dropbox.com/scl/fi/lvdglb5y0rvumzfio7tlm/Tom_Collins.webp?rlkey=a84cvghffsn6ln4jtvixd6nif&st=5t7x619i&dl=1',
        false,
        true
    ),
    (
        44,
        'Whisky Highball',
        'Scotch',
        2,
        '2 oz scotch & 6 oz seltzer',
        'Pour the scotch into a highball glass. Add 3 ice cubes. Stir for 3 seconds. Add the seltzer and stir once. Garnish with a lemon peel.',
        'https://www.dropbox.com/scl/fi/1t3ae8fzomeo2638kz9w6/Whiskey_Highball.jpg?rlkey=igvz5sdi2a7eu76g9k4mqxk13&st=n8i87td1&dl=1',
        false,
        false
    ),
    (
        45,
        'Whiskey Sour',
        'Bourbon',
        2,
        '2 oz bourbon, .75 oz lemon juice & .75 oz simple syrup',
        'Shake all ingredients with ice. Strain into a double old-fashioned glass over 1 large ice cube. Garnish with a lemon wheel and a cherry.',
        'https://www.dropbox.com/scl/fi/aweoifn10uw8clb4dlxn9/Whiskey_Sour.jpg?rlkey=eq3b1v1jwcejup09rkj8b56al&st=fxjowpow&dl=1',
        false,
        true
    ),
    (
        46,
        'White Lady',
        'Gin',
        2,
        '2 oz gin, .5 oz Cointreau .75 oz lemon juice .25 oz simple syrup & 1 egg white',
        'Shake all the ingredients without ice. Shake all ingredients again with ice. Double strain into a chilled coupe. Express a lemon twist over the drink, then place it on the edge of the glass.',
        'https://www.dropbox.com/scl/fi/plm5tpt39p3vppewflesd/White_Lady.jpg?rlkey=yfk09oruvdpsgn90r4s9y40ow&st=rffyxdvh&dl=1',
        false,
        true
    ),
    (
        47,
        'White Negroni',
        'Gin',
        2,
        '1.5 oz gin, 1 oz dry vermouth & .75 oz Suze',
        'Stir all ingredients over ice. Strain into an old-fashioned glass over 1 large cube. Express an orange twist over the drink, then place it into the drink.',
        'https://www.dropbox.com/scl/fi/nqllymvgtkpzg63kq0gbt/White_Negroni.jpg?rlkey=o3utcgk17132aumpk4571dnqq&st=2qi8s8ss&dl=1',
        true,
        false
    );