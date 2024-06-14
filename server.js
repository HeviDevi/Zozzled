require('dotenv').config();
const express = require('express');
const exphbs = require('express-handlebars');
const bodyParser = require('body-parser');
const path = require('path');
const session = require('express-session');
const passport = require('passport');
const Sequelize = require('sequelize');
const mainRoutes = require('./routes/main-routes');
const initializePassport = require('./config/passport-config');
const sequelize = require('./config/database');
const Login = require('./models/login');

const app = express();
const PORT = process.env.PORT || 3001;

// //stuff Eddie tested out with Ryan
// // const SequelizeStore = require('connect-session-sequelize')(session.Store);
// // const sess = {
// //   secret: 'Super secret secret',
// //   cookie: {
// //     maxAge: 300000,
// //     httpOnly: true,
// //     secure: false,
// //     sameSite: 'strict',
// //   },
// //   resave: false,
// //   saveUninitialized: true,
// //   store: new SequelizeStore({
// //     db: sequelize
// //   })
// // };
// // app.use(session(sess));

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

// Set up Handlebars engine
const hbs = exphbs.create({
  extname: 'hbs',
  layoutsDir: `${__dirname}/views/layouts`,
  defaultLayout: 'main',
  partialsDir: `${__dirname}/views/partials`,
  runtimeOptions: {
    allowProtoPropertiesByDefault: true,
    allowProtoMethodsByDefault: true,
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

app.engine('hbs', hbs.engine);
app.set('view engine', 'hbs');
app.set('views', path.join(__dirname, 'views'));

// Initialize Passport
initializePassport(passport);

// Express session middleware
app.use(
  session({
    secret: process.env.SECRET_KEY,
    resave: false,
    saveUninitialized: false,
    cookie: {
      secure: false,
      httpOnly: true,
      sameSite: 'strict',
      maxAge: 24 * 60 * 60 * 1000 // 1 day in milliseconds
    }
  })
);

// Passport middleware
app.use(passport.initialize());
app.use(passport.session());

// User routes - anything that is /users will go to the users.js file
app.use("/users", require("./routes/users"));

// Search routes - anything that is /search will go to the search.js file
app.use('/', require('./routes/search'));

//Drink Detail
app.use('/', require('./routes/drinks'));

// Use authentication routes
app.use('/auth', require('./routes/auth-routes'));

// Handlebars page routes
app.use('/', mainRoutes);

//END OF CODE CONSOLIDATION - Zachary

// Start the server
app.listen(PORT, () => {
  console.log(`App listening to port ${PORT}`);
});
