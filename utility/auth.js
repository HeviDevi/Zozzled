const withAuth = (req, res, next) => {
    if (!req.isAuthenticated || !req.isAuthenticated()) {  // checks if user is euthenticated
        res.redirect('/');
    } else {
        next(); // next handler
    }
};

module.exports = { withAuth };