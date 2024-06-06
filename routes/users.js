const express = require('express'); // Import express
const router = express.Router(); // Create a router
const User = require('../models/User'); // Import User model

// Retrieve user list
router.get('/', async (req, res) => {
    try {
        const users = await User.findAll();
        console.log(users);
        res.render('users', { users }); // Render the 'users' view
    } catch (err) {
        console.error(err);
        res.status(500).send('Server Error');
    }
});

// Add a user
router.get('/add', async (req, res) => {
    console.log('Received request to /add');
    const data = {
        drinkname: 'Martini',
        spirittype: 'Gin',
        spiritamount: '2',
        ingredients: 'Gin, Vermouth',
        instructions: 'Shake with ice and strain into glass'
    };

    let { drinkname, spirittype, spiritamount, ingredients, instructions } = data;

    try {
        console.log('Creating user in the database');
        const user = await User.create({
            drinkname,
            spirittype,
            spiritamount,
            ingredients,
            instructions
        });
        console.log('User created:', user);
        res.redirect('/users'); // Redirect to the user list after adding
    } catch (err) {
        console.log('Error:', err);
        res.status(500).send('Server Error');
    }
});



module.exports = router; // Export the router