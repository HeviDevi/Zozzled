const express = require('express');
const passport = require('passport');
const bcrypt = require('bcrypt');
const moment = require('moment');
const { Login } = require('../models/login'); // Ensure this path is correct
const Sequelize = require('sequelize');
const router = express.Router();

// Middleware to check if user is authenticated
function checkAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return next();
    }
    res.redirect('/');
}

// Middleware to check if user is not authenticated
function checkNotAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return res.redirect('/drink-search');
    }
    next();
}

// Route to handle login
router.post('/login', (req, res, next) => {
    passport.authenticate('local', (err, user, info) => {
        if (err) {
            console.error('Error during authentication:', err);
            return next(err);
        }
        if (!user) {
            console.log('Authentication failed:', info.message);
            return res.status(401).json({ error: 'Invalid username or password' });
        }
        req.logIn(user, (err) => {
            if (err) {
                console.error('Error during login:', err);
                return next(err);
            }
            console.log('Authentication successful, user logged in:', user.username);
            return res.status(200).json({ message: 'Login successful' });
        });
    })(req, res, next);
});

// Route to handle registration
router.post('/register', async (req, res) => {
    const { username, email, dob, password } = req.body;
    console.log('Registering user:', username, email, dob);

    // Check if user is at least 21 years old
    const age = moment().diff(moment(dob, 'YYYY-MM-DD'), 'years');
    if (age < 21) {
        return res.status(400).json({ error: 'You must be at least 21 years old to register' });
    }

    // Validate field lengths
    if (username.length > 16 || password.length > 16 || email.length > 35) {
        return res.status(400).json({ error: 'Invalid field lengths' });
    }

    try {
        // Check if the user already exists
        const userExists = await Login.findOne({
            where: {
                [Sequelize.Op.or]: [
                    { username },
                    { email }
                ]
            }
        });

        if (userExists) {
            return res.status(400).json({ error: 'Username or email already exists' });
        }

        // Hash the password
        const hashedPassword = await bcrypt.hash(password, 10);
        console.log('Hashed password:', hashedPassword);

        // Create a new user
        await Login.create({
            username,
            passwd: hashedPassword,
            email,
            dob
        });

        console.log('User registered successfully');
        res.status(200).json({ message: 'Registration successful' });
    } catch (err) {
        console.error('Error registering user:', err);
        res.status(500).json({ error: 'Server error' });
    }
});

// Route to handle logout
router.get('/logout', (req, res) => {
    req.logout((err) => {
        if (err) {
            console.error('Error during logout:', err);
            return res.redirect('/');
        }
        res.redirect('/');
    });
});

module.exports = router;