const express = require("express");
const router = express.Router();
const Drinks = require("../models/Drinks");
const Favorites = require("../models/Favorites");
const Comment = require("../models/Comment");
const { withAuth } = require("../utility/auth");

// Route for handlebars
router.get("/", (req, res) => {
  res.render("homepage", {
    layout: "main",
    isAuthenticated: req.isAuthenticated(),
  });
});

// Route for drink-search
router.get("/drink-search", (req, res) => {
  res.render("drink-search", {
    layout: "main",
    isAuthenticated: req.isAuthenticated(),
  });
});

// Route for drink-results
router.get("/drink-results", (req, res) => {
  Drinks.findAll({ raw: true })
    .then((drinks) => {
      res.render("drink-results", {
        drinks: drinks,
        isAuthenticated: req.isAuthenticated(),
      });
    })
    .catch((error) => {
      console.error("Error fetching drinks:", error);
      res.status(500).send("Error fetching drink results");
    });
});

// Route for drink-details
router.get("/drink-details", (req, res) => {
  res.render("drink-details", {
    layout: "main",
    isAuthenticated: req.isAuthenticated(),
  });
});

// Route for submitting comments
router.post("/submit-rating", async (req, res) => {
  try {
    const { rate, comment, drink_id } = req.body;

    const rating = parseInt(rate, 10);
    if (isNaN(rating) || rating < 1 || rating > 5) {
      throw new Error("Invalid rating value");
    }

    const drink = await Drinks.findByPk(drink_id);
    if (!drink) {
      throw new Error("Invalid drink_id");
    }

    await Comment.create({
      rating,
      text: comment,
      drink_id,
    });

    res.redirect(`/drink-details/${drink_id}`);
  } catch (error) {
    console.error("Error submitting comment", error);
    res.status(500).send("Error submitting comment");
  }
});

// Route for fetching comments for specific drink
router.get("/drink-details/:id", async (req, res) => {
  try {
    const drink = await Drinks.findByPk(req.params.id);
    if (!drink) {
      return res.status(404).send("Drink not found");
    }

    const comments = await Comment.findAll({
      where: { drink_id: req.params.id },
      raw: true,
    });
    res.render("drink-details", {
      drink: drink,
      comments: comments,
    });
  } catch (error) {
    console.error("Error getting comments", error);
    res.status(500).send("Error getting comments");
  }
});

// Route for user-input
router.get("/user-input", (req, res) => {
  res.render("user-input", {
    layout: "main",
    isAuthenticated: req.isAuthenticated(),
  });
});

// Route for user added drinks
router.get("/users", (req, res) => {
  res.render("users", {
    layout: "main",
    isAuthenticated: req.isAuthenticated(),
  });
});

// Route for Profile
router.get('/profile', withAuth, (req, res) => {
    Favorites.findAll({ 
        raw: true,
        where: { username: req.user.id }
     })
    .then(favorites => {
        res.render("profile", {
            favorites: favorites,
            isAuthenticated: req.isAuthenticated(),

        });
    })
})

// Route for adding favorites
router.post("/add-favorite", withAuth, (req, res) => {
  Drinks.findOne({
    where: { drink_id: req.body.drink_id },
  })
    .then((drink) => {
      if (!drink) {
        return res.status(404).send("Drink not found");
      }
      return Favorites.findOne({
        where: {
          username: req.user.id,
          drink_id: req.body.drink_id,
        },
      })
        .then((favorite) => {
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
        .then((createdFavorite) => res.status(201).send(createdFavorite))
        .catch((error) => res.status(500).send(error.message));
    })
    .catch((error) => res.status(500).send(error.message));
});

// Route for deleting favorites
router.delete("/delete-favorite", withAuth, (req, res) => {
  Favorites.destroy({
    where: {
      username: req.user.id,
      drink_id: req.body.drink_id,
    },
  }).catch((error) => {
    console.error("Error deleting favorite:", error);
    res.status(500).send("Error deleting favorite");
  });
});

// Route for About
router.get("/about", (req, res) => {
  res.render("about", {
    layout: "main",
    isAuthenticated: req.isAuthenticated(),
  });
});

module.exports = router;
