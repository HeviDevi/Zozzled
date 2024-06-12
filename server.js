require("dotenv").config();
const express = require("express");
const exphbs = require("express-handlebars");
const bodyParser = require("body-parser");
const path = require("path");
const session = require("express-session");
const passport = require("passport");
const bcrypt = require("bcrypt");
const { Pool } = require("pg");
const initializePassport = require("./config/passport-config");
const moment = require("moment");
const mainRoutes = require("./routes/main-routes");

const app = express();
const PORT = process.env.PORT || 3001;
const saltRounds = 10;

//stuff Eddie tested out with Ryan
// const SequelizeStore = require('connect-session-sequelize')(session.Store);
// const sess = {
//   secret: 'Super secret secret',
//   cookie: {
//     maxAge: 300000,
//     httpOnly: true,
//     secure: false,
//     sameSite: 'strict',
//   },
//   resave: false,
//   saveUninitialized: true,
//   store: new SequelizeStore({
//     db: sequelize
//   })
// };
// app.use(session(sess));

// I am consolidating my code here to make it easier to read and understand. DO NOT MOVE OR MODIFY
// ANYTHING BELOW THIS LINE. - Zachary Testing

//Bring database connection
const db = require("./config/database");

//Test database connection
db.sync()
  .then(() => console.log("Database connected..."))
  .catch((err) => console.log("Error: " + err));

// Set up static files
app.use(express.static("public"));

// Set up body parser
app.use(bodyParser.urlencoded({ extended: false }));

// Body parser middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

// User routes - anything that is /users will go to the users.js file
app.use("/users", require("./routes/users"));

// Search routes - anything that is /search will go to the search.js file
app.use('/', require('./routes/search'));

//Drink Detail
app.use('/', require('./routes/drinks'));


//END OF CODE CONSOLIDATION - Zachary

// Set up Handlebars engine
const hbs = exphbs.create({
  extname: "hbs",
  layoutsDir: `${__dirname}/views/layouts`,
  defaultLayout: "main",
  partialsDir: `${__dirname}/views/partials`,
  runtimeOptions: {
    allowProtoPropertiesByDefault: true, // Disable warning for prototype property access
    allowProtoMethodsByDefault: true, // Disable warning for prototype method access
  },
  helpers: {
    limit: function (arr, limit) {
      if (!Array.isArray(arr)) {
        return [];
      }
      return arr.slice(0, limit);
    },
    encodeURIComponent: function (str) {
      return encodeURIComponent(str);
    }
  },
});

app.engine("hbs", hbs.engine);
app.set("view engine", "hbs");
app.set("views", path.join(__dirname, "views"));

// Handlebar page routes
app.use("/", mainRoutes);

//Start of user login/registration

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

initializePassport(passport, pool);

// Express session middleware
app.use(
  session({
    secret: process.env.SECRET_KEY,
    resave: false,
    saveUninitialized: false,
    cookie: {
      secure: process.env.NODE_ENV === 'production',
      httpOnly: true,
      sameSite: 'strict',
      maxAge: 24 * 60 * 60 * 1000 // 1 day in milliseconds
    }
  })
);

// Passport middleware
app.use(passport.initialize());
app.use(passport.session());

// Middleware to check if user is authenticated
function checkAuthenticated(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  res.redirect("/");
}

// Middleware to check if user is not authenticated
function checkNotAuthenticated(req, res, next) {
  if (req.isAuthenticated()) {
    return res.redirect("/drink-search");
  }
  next();
}


// Route to render main page
app.get("/", checkNotAuthenticated, (req, res) => {
  res.render("main", { title: "Home", isAuthenticated: req.isAuthenticated() });
});

// Route to render drink search page
app.get("/drink-search", checkAuthenticated, (req, res) => {
  res.render("drink-search", { title: "Drink Search", isAuthenticated: req.isAuthenticated() });
});

// Route to handle login
app.post("/login", (req, res, next) => {
  passport.authenticate("local", (err, user, info) => {
    if (err) {
      console.error("Error during authentication:", err);
      return next(err);
    }
    if (!user) {
      console.log("Authentication failed:", info.message);
      return res.redirect("/");
    }
    req.logIn(user, (err) => {
      if (err) {
        console.error("Error during login:", err);
        return next(err);
      }
      console.log("Authentication successful, user logged in:", user.username);
      return res.redirect("/drink-search");
    });
  })(req, res, next);
});

// Route to handle registration
app.post("/register", async (req, res) => {
  const { username, email, dob, password } = req.body;
  console.log("Registering user:", username, email, dob);

  // Check if user is at least 21 years old
  const age = moment().diff(moment(dob, "YYYY-MM-DD"), "years");
  if (age < 21) {
    return res.redirect("/");
  }

  // Validate field lengths
  if (username.length > 16 || password.length > 16 || email.length > 35) {
    return res.redirect("/");
  }

  try {
    const result = await pool.query(
      "SELECT * FROM public.login WHERE username = $1 OR email = $2",
      [username, email]
    );
    if (result.rows.length > 0) {
      return res.redirect("/");
    }

    const hashedPassword = await bcrypt.hash(password, 10);
    console.log("Hashed password:", hashedPassword);
    await pool.query(
      "INSERT INTO public.login (username, passwd, email, dob) VALUES ($1, $2, $3, $4)",
      [username, hashedPassword, email, dob]
    );
    console.log("User registered successfully");
    res.redirect("/");
  } catch (err) {
    console.error("Error registering user:", err);
    res.redirect("/");
  }
});

// Route to handle logout
app.get("/logout", (req, res) => {
  req.logout();
  res.redirect("/");
});

// Start the server
app.listen(PORT, () => {
  console.log(`App listening to port ${PORT}`);
});
