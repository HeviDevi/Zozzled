const express = require("express"); // Express module
const exphbs = require("express-handlebars"); // Handlebars module
const path = require("path"); // Path module
const bodyParser = require("body-parser"); // Body parser module

const app = express(); // Initialize express
const PORT = process.env.PORT || 3001; // Port number

//database require
const db = require('./config/database')

//test database
db.authenticate()
  .then(() => console.log('Database connected...'))
  .catch(err => console.log('Error: Database unable to connect.... ' + err))

// Set up static files
app.use(express.static("public"));

// Set up Handlebars engine
const hbs = exphbs.create({
  extname: "hbs",
  layoutsDir: `${__dirname}/views/layouts`,
  defaultLayout: "index",
  partialsDir: `${__dirname}/views/partials`,
  runtimeOptions: {
    allowProtoPropertiesByDefault: true, // Disables warning message allows for the use of the prototype
    allowProtoMethodsByDefault: true,  // Disables warning message allows for the use of the prototype
  }
});

app.engine("hbs", hbs.engine);
app.set("view engine", "hbs");

// Set up body parser
app.use(bodyParser.urlencoded({ extended: false }));


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
