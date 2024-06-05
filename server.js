require('dotenv').config();
const express = require("express");
const exphbs = require("express-handlebars");
const bodyParser = require('body-parser');
const session = require('express-session');
const passport = require('passport');
const bcrypt = require('bcrypt');
const { Pool } = require('pg');
const initializePassport = require('./config/passport-config');
const moment = require('moment'); 


const app = express();
const PORT = process.env.PORT || 3001;
const saltRounds = 10;

// Set up static files
app.use(express.static("public"));

// Set up Handlebars engine
const hbs = exphbs.create({
  extname: "hbs",
  layoutsDir: `${__dirname}/views/layouts`,
  defaultLayout: "index",
  partialsDir: `${__dirname}/views/partials`,
});

app.engine("hbs", hbs.engine);
app.set("view engine", "hbs");


// Route for handlebars
app.get("/", (req, res) => {
  res.render("main", { layout: "index" });
});

// Route for drink-search
app.get("/drink-search", (req, res) => {
  res.render("drink-search", { layout: "index" });
});

// Route for drink-results
app.get("/drink-results", (req, res) => {
  res.render("drink-results", { layout: "index" })
});

// Initialize PostgreSQL database connection
const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

initializePassport(passport, pool);

app.use(bodyParser.urlencoded({ extended: false }));
app.use(session({
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: false
}));
app.use(passport.initialize());
app.use(passport.session());

// Serve static files from the 'public' directory
app.use(express.static('public'));

app.engine('hbs', exphbs.engine({ extname: 'hbs' }));
app.set('view engine', 'hbs');

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
    return res.redirect('/dashboard');
  }
  next();
}

// Route to render index page
app.get('/', checkNotAuthenticated, (req, res) => {
  res.render('index', { title: 'Home' });
});

// Route to handle login
app.post('/login', passport.authenticate('local', {
  successRedirect: '/drink-search',
  failureRedirect: '/'
}));

// Route to handle registration
app.post('/register', async (req, res) => {
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
    const result = await pool.query('SELECT * FROM public.login WHERE username = $1 OR email = $2', [username, email]);
    if (result.rows.length > 0) {
      return res.redirect('/');
    }

    const hashedPassword = await bcrypt.hash(password, saltRounds);
    console.log('Hashed password:', hashedPassword);
    await pool.query(
      'INSERT INTO public.login (username, passwd, email, dob) VALUES ($1, $2, $3, $4)', 
      [username, hashedPassword, email, dob]
    );
    console.log('User registered successfully');
    res.redirect('/');
  } catch (err) {
    console.error('Error registering user:', err);
    res.redirect('/');
  }
});

// Route to handle dashboard
app.get('/dashboard', checkAuthenticated, (req, res) => res.send('Welcome to the dashboard!'));

// Route to handle logout
app.get('/logout', (req, res) => {
  req.logout();
  res.redirect('/');
});

// Start the server
app.listen(PORT, () => {
  console.log(`App listening to port ${PORT}`);
});
