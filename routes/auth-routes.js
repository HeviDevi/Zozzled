const express = require('express');
const passport = require('passport');
const bcrypt = require('bcrypt');
const moment = require('moment');
const { Login } = require('../models/login');
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
      return res.redirect('/');
    }
    req.logIn(user, (err) => {
      if (err) {
        console.error('Error during login:', err);
        return next(err);
      }
      console.log('Authentication successful, user logged in:', user.username);
      return res.redirect('/drink-search');
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
    return res.redirect('/');
  }

  // Validate field lengths
  if (username.length > 16 || password.length > 16 || email.length > 35) {
    return res.redirect('/');
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
      return res.redirect('/');
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
    res.redirect('/');
  } catch (err) {
    console.error('Error registering user:', err);
    res.redirect('/');
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