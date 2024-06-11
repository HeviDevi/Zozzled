

INSERT INTO public.favorites (
    username,
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

VALUES 
(
        'HeviDevi',
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
        'HeviDevi',
        24,
        'Martini',
        'Gin',
        2,
        '2 oz gin & .75 oz dry vermouth',
        'Stir all ingredients over ice. Strain into a chilled coupe. Garnish with an olive or express a lemon peel over the drink and set it on the side of the glass.',
        'https://www.dropbox.com/scl/fi/wlg7m7pfwfariaingmev2/Martini.jpg?rlkey=py8it9lz8io314agg5fj6pifx&st=1sc8b2sm&dl=1',
        false,
        false
    );
    