const express = require('express'); // Import express
const router = express.Router(); // Create a router
const Drinks = require('../models/Drinks'); // Import Drinks model
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

// Search for a drink route
router.get('/search', async (req, res) => {
    const { term, spirit, bitter, sweet } = req.query;

    console.log("Search term:", term); // Log the search term
    console.log("Spirit:", spirit); // Log the spirit type
    console.log("Bitter:", bitter); // Log the bitter preference
    console.log("Sweet:", sweet); // Log the sweet preference

    try {
        let whereClause = { drink_name: { [Op.like]: '%' + term + '%' } };

        // Include spirit type in the where clause if provided
        if (spirit) {
            whereClause.spirit_type = { [Op.like]: '%' + spirit + '%' };
        }

        // Include bitter preference in the where clause if provided
        if (bitter) {
            whereClause.bitter = (bitter === 'true');
        }

        // Include sweet preference in the where clause if provided
        if (sweet) {
            whereClause.sweet = (sweet === 'true');
        }

        const drinks = await Drinks.findAll({ where: whereClause });
        console.log("Found drinks:", drinks); // Log the retrieved drinks
        
        if (drinks.length === 0) {
            console.log("No drinks found for term:", term);
        }

        res.render('drink-results', { drinks }); // Rendering the 'drink-results' view with the drinks data
    } catch (err) {
        console.error("Database error:", err.message);
        res.status(500).send('Server Error');
    }
});


module.exports = router; // Export the router

