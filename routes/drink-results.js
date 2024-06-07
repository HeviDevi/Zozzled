// /routes/drinks.js
const express = require('express');
const router = express.Router();
const Drinks = require('../models/Drinks');

// Route to render drink data
router.get('/drink-results', async (req, res) => {
    try {
        const drinks = await Drinks.findAll();
        res.render('drink-results', { 
            layout: 'main',
            drinks: drinks.map(drink => drink.toJSON())
        });
    } catch (err) {
        console.error('Error fetching drinks:', err);
        res.status(500).send('Internal Server Error');
    }
});

module.exports = router;
