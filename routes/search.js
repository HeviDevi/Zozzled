const express = require('express'); 
const router = express.Router(); 
const Drinks = require('../models/Drinks'); 
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

// Search for a drink route
router.get('/search', async (req, res) => {
    const { term, spirit, bitter, sweet } = req.query;

    console.log("Search term:", term); 
    console.log("Spirit:", spirit); 
    console.log("Bitter:", bitter); 
    console.log("Sweet:", sweet); 

    try {
        let whereClause = { drink_name: { [Op.like]: '%' + term + '%' } };

       
        if (spirit) {
            whereClause.spirit_type = { [Op.like]: '%' + spirit + '%' };
        }

       
        if (bitter) {
            whereClause.bitter = (bitter === 'true');
        }

      
        if (sweet) {
            whereClause.sweet = (sweet === 'true');
        }

        const drinks = await Drinks.findAll({ where: whereClause });
        console.log("Found drinks:", drinks); 
        
        if (drinks.length === 0) {
            console.log("No drinks found for term:", term);
        }

        res.render('drink-results', { drinks }); 
        } catch (err) {
        console.error("Database error:", err.message);
        res.status(500).send('Server Error');
    }
});


module.exports = router; 

