const express = require("express");
const exphbs = require("express-handlebars");
const path = require("path"); // Path module
const bodyParser = require("body-parser"); // Body parser module



const app = express();
const PORT = process.env.PORT || 3001;

//database require
const db = require('./config/database')

//test database
db.authenticate()
  .then(() => console.log('Database connected...'))
  .catch(err => console.log('Error: ' + err))

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

// Start the server
app.listen(PORT, () => {
  console.log(`App listening to port ${PORT}`);
});
