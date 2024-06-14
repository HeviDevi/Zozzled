const express = require('express');
const router = express.Router();
const Drinks = require('../models/Drinks');
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

// Search for a drink route
router.get('/search', async (req, res) => {
    let { term, spirit, bitter, sweet } = req.query;

    console.log("Search term:", term);
    console.log("Spirit:", spirit);
    console.log("Bitter:", bitter);
    console.log("Sweet:", sweet);

    // Convert term to lowercase for case-insensitive search
    term = term ? term.toLowerCase() : '';

    try {
        let whereClause = { drink_name: { [Op.iLike]: '%' + term + '%' } };

        if (spirit) {
            whereClause.spirit_type = { [Op.iLike]: '%' + spirit + '%' };
        }

        // Convert bitter and sweet strings to boolean values
        if (bitter === 'true') {
            whereClause.bitter = true;
        }

        if (sweet === 'true') {
            whereClause.sweet = true;
        }

        const drinks = await Drinks.findAll({ where: whereClause });
        // console.log("Found drinks:", drinks);

        if (drinks.length === 0) {
            console.log("No drinks found for term:", term);
        }

        res.render('drink-results', { drinks, isAuthenticated: req.isAuthenticated() });
    } catch (err) {
        console.error("Database error:", err.message);
        res.status(500).send('Server Error');
    }
});

module.exports = router;




