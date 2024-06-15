const express = require('express'); // Import express
const router = express.Router(); // Create a router
const User = require('../models/User'); // Import User model
const { withAuth } = require('../utility/auth'); // Import withAuth middleware
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

// Retrieve user list
router.get('/', async (req, res) => {
    try {
        const users = await User.findAll();
        console.log(users);
        res.render('users', { users, isAuthenticated: req.isAuthenticated() }); // Render the 'users' view with isAuthenticated
    } catch (err) {
        console.error(err);
        res.status(500).send('Server Error');
    }
});

// Display add user drink form
router.get('/add', withAuth, (req, res) => {
    res.render('add', { isAuthenticated: req.isAuthenticated() });
});

// Add a user drink
router.post('/add', withAuth, async (req, res) => {
    console.log('Received request to /add');
    let { drinkname, spirittype, spiritamount, ingredients, instructions } = req.body;
    let errors = [];

    // Validate the input
    if (!drinkname) errors.push({ text: 'Please enter a drink name' });
    if (!spirittype) errors.push({ text: 'Please enter a spirit type' });
    if (!spiritamount) errors.push({ text: 'Please enter a valid amount' });
    if (!ingredients) errors.push({ text: 'Please enter drink ingredients' });
    if (!instructions) errors.push({ text: 'Please enter the instructions to make the drink' });

    // If there are errors, re-render the form with the errors and with previously entered values, otherwise add the user to the database
    if (errors.length > 0) {
        res.render('add', { errors, drinkname, spirittype, spiritamount, ingredients, instructions, isAuthenticated: req.isAuthenticated() });
    } else {
        drinkname = drinkname.toLowerCase();
        spirittype = spirittype.toLowerCase();

        try {
            console.log('Creating user in the database');
            const user = await User.create({ drinkname, spirittype, spiritamount, ingredients, instructions });
            console.log('User created:', user);
            res.redirect('/users'); // Redirect to the user list after adding
        } catch (err) {
            console.log('Error:', err);
            res.status(500).send('Server Error');
        }
    }
});

module.exports = router; // Export the router