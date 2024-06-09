const express = require('express'); // Import express
const router = express.Router(); // Create a router
const Drinks = require('../models/Drinks'); // Import Drinks model
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

// Search for a drink route
router.get('/search', async (req, res) => {
    const { term } = req.query;

    console.log("Search term:", term); // Log the search term

    try {
        const drinks = await Drinks.findAll({ where: { drink_name: { [Op.like]: '%' + term + '%' } } });
        console.log("Found drinks:", drinks); // Log the retrieved drinks
        
        if (drinks.length === 0) {
            console.log("No drinks found for term:", term);
        }

        res.render('drink-results', { drinks }); // Rendering the 'drink-results' view with the drinks data
    } catch (err) {
        console.error("Database error:", err.message); // Log the database error message
        res.status(500).send('Server Error');
    }
});
module.exports = router; // Export the router