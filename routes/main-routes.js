const express = require("express");
const router = express.Router();
const Drinks = require("../models/Drinks");
const Favorites = require("../models/Favorites");
const { withAuth } = require('../utility/auth');

// Route for handlebars
router.get("/", (req, res) => {
    res.render("homepage", { layout: "main", isAuthenticated: req.isAuthenticated() });
});

// Route for drink-search
router.get("/drink-search", (req, res) => {
    res.render("drink-search", { layout: "main", isAuthenticated: req.isAuthenticated() });
});

// Route for drink-results
router.get("/drink-results", (req, res) => {
    Drinks.findAll({ raw: true })
    .then(drinks => {
        res.render("drink-results", {
            drinks: drinks,
            isAuthenticated: req.isAuthenticated(),
        });
    })
    .catch(error => {
        console.error("Error fetching drinks:", error);
        res.status(500).send("Error fetching drink results");
    });
});

// Route for drink-details
router.get("/drink-details", (req, res) => {
    res.render("drink-details", { layout: "main", isAuthenticated: req.isAuthenticated() });
});

// Route for user-input
router.get("/user-input", (req, res) => {
    res.render("user-input", { layout: "main", isAuthenticated: req.isAuthenticated() });
});

// Route for user added drinks
router.get('/users', (req, res) => {
    res.render('users', { layout: "main", isAuthenticated: req.isAuthenticated() });
});

// Route for Profile
router.get('/profile', withAuth, (req, res) => {
    Favorites.findAll({ raw: true })
    .then(favorites => {
        res.render("profile", {
            favorites: favorites,
            isAuthenticated: req.isAuthenticated(),

        });
    })
})

// Route for adding favorites
router.post('/add-favorite', withAuth, (req, res) => {
    Drinks.findOne({
        where: { drink_id: req.body.drink_id }
    })
    .then(drink => {
        if (!drink) {
            return res.status(404).send("Drink not found");
        }
        return Favorites.findOne({
            where: {
                username: req.user.id,
                drink_id: req.body.drink_id
            }
        })
        .then(favorite => {
            if (favorite) {
                return console.log("Drink already favorited");
            }
            return Favorites.create({
                username: req.user.id,
                drink_id: drink.drink_id,
                drink_name: drink.drink_name,
                spirit_type: drink.spirit_type,
                spirit_amount: drink.spirit_amount,
                ingredients: drink.ingredients,
                instructions: drink.instructions,
                image_link: drink.image_link,
                bitter: drink.bitter,
                sweet: drink.sweet,
            });
        })
        .then(createdFavorite => res.status(201).send(createdFavorite))
        .catch(error => res.status(500).send(error.message));
    })
    .catch(error => res.status(500).send(error.message));
});

// Route for deleting favorites
router.delete('/delete-favorite', withAuth, (req, res) => {
    Favorites.destroy({
        where: {
            username: req.user.id,
            drink_id: req.body.drink_id
        }
    })
    .catch(error => {
        console.error("Error deleting favorite:", error);
        res.status(500).send("Error deleting favorite");
    });
});

// Route for About
router.get('/about', (req, res) => {
    res.render('about', { layout: "main", isAuthenticated: req.isAuthenticated() });
});

module.exports = router;