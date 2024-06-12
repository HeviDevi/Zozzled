const express = require("express");
const router = express.Router();
const Drinks = require("../models/Drinks");
const Favorites = require("../models/Favorites");
const { raw } = require("body-parser");


// Route for handlebars
router.get("/", (req, res) => {
    res.render("homepage", { layout: "main" });
});

// Route for drink-search
router.get("/drink-search", (req, res) => {
    res.render("drink-search", { layout: "main" });
});

// Route for drink-results
router.get("/drink-results", (req, res) => {
    Drinks.findAll({raw: true})
    .then(drinks => {
        res.render("drink-results", {
            drinks: drinks 
        });
    })
    .catch(error => {
        console.error("Error fetching drinks:", error);
        res.status(500).send("Error fetching drink results");
    });
});

// Route for drink-details
router.get("/drink-details", (req, res) => {
    res.render("drink-details", { layout: "main" })
});

// Route for user-input
router.get("/user-input", (req, res) => {
    res.render("user-input", { layout: "main" })
});

// Route for user added drinks
router.get('/users', (req, res) => {
    res.render('users', { layout: "main" })
});

// Route for Profile
router.get('/profile', (res) => {
    Favorites.findAll({raw: true})
    .then(favorites => {
        res.render("profile", {
            layout: "main",
            favorites: favorites
        });
    })

})

// Route for adding favorites
router.post('/add-favorite', (req, res) => {
        Drinks.findOne({
            where: { drink_id: req.body.drink_id }
        })
        .then(drink => {
            if (!drink) {
                return res.status(404).send("Drink not found");
            }
        
        // Adds the drink to the favorites table as well as the user's username
        Favorites.create({
            username: 'HeviDevi',
            drink_id: drink.drink_id,
            drink_name: drink.drink_name,
            spirit_type:drink.spirit_type,
            spirit_amount: drink.spirit_amount,
            ingredients: drink.ingredients,
            instructions: drink.instructions,
            image_link: drink.image_link,
            bitter: drink.bitter,
            sweet: drink.sweet,
        })
    })
        .then(() => {
            res.redirect('/profile');
        })
        .catch(error => {
            console.error("Error adding favorite:", error);
            res.status(500).send("Error adding favorite");
        });  
    
});

// Route for About
router.get('/about', (req, res) => {
    res.render('about', { layout: "main" })
});



module.exports = router;