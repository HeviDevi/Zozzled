const withAuth = (req, res, next) => {
    if (!req.isAuthenticated || !req.isAuthenticated()) {
        res.redirect('/auth/login');
    } else {
        next();
    }
};

module.exports = { withAuth };