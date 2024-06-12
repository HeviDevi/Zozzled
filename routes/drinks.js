const express = require('express'); // Import express
const router = express.Router(); // Create a router
const Drinks = require('../models/Drinks'); // Import Drinks model
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

router.get('/drink-details', (req, res) => {
    const { id, name, spirit, amount, ingredients, instructions, image } = req.query;
    console.log("Drink details:", id, name, spirit, amount, ingredients, instructions, image);
    res.render('drink-details', { id, name, spirit, amount, ingredients, instructions, image });
});



module.exports = router; // Export the router



// const express = require('express');
// const router = express.Router();
// const Drinks = require('../models/Drinks');
// const Sequelize = require('sequelize');
// const Op = Sequelize.Op;

// // Get all drinks
// router.get("/", async (req, res) => {
//   try {
//     const drinks = await Drinks.findAll();
//     res.status(200).json(drinks);
//   } catch (err) {
//     res.status(500).json(err);
//   }
// });

// // Get one drink by id
// router.get("/:id", async (req, res) => {
//   try {
//     const drink = await Drinks.findByPk(req.params.id);
//     if (!drink) {
//       res.status(404).json({ message: "No drink found with that id." });
//       return;
//     }
//     res.status(200).json(drink);
//   } catch (err) {
//     res.status(500).json(err);
//   }
// });

// // Specific drink details route
// router.get('/drink-details', async (req, res) => {
//     const { id } = req.query;
//     if (!id || isNaN(parseInt(id))) {
//         res.status(400).json({ message: "Invalid or missing id parameter." });
//         return;
//     }

//     try {
//         const drink = await Drinks.findByPk(parseInt(id));
//         if (!drink) {
//             res.status(404).json({ message: "No drink found with that id." });
//             return;
//         }

//         const { drink_id, drink_name, spirit_type, spirit_amount, ingredients, instructions, bitter, sweet, image_link } = drink;
//         res.render('drink-details', { drink_id, drink_name, spirit_type, spirit_amount, ingredients, instructions, bitter, sweet, image_link });
//     } catch (err) {
//         res.status(500).json(err);
//     }
// });

// module.exports = router;

