const express = require("express");
const router = express.Router();

// Route for handlebars
router.get("/", (req, res) => {
    res.render("homepage", { layout: "main" });
});

// Route for drink-search
router.get("/drink-search", (req, res) => {
    res.render("drink-search", { layout: "main" });
});

// Route for drink-results
router.get("/drink-results", (req, res) => {
    res.render("drink-results", { layout: "main" })
});

// Route for drink-details
router.get("/drink-details", (req, res) => {
    res.render("drink-details", { layout: "main" })
});

// Route for user-profile
router.get("/user-profile", (req, res) => {
    res.render("user-profile", { layout: "main" })
});

// Route for user-input
router.get("/user-input", (req, res) => {
    res.render("user-input", { layout: "main" })
});

// Route for user-favorites requirement 
router.get('/users', (req, res) => {
    res.render('users', { layout: "main" })
});

module.exports = router;