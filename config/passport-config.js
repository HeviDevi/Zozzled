const LocalStrategy = require('passport-local').Strategy;
const bcrypt = require('bcrypt');

function initialize(passport, pool) {
const authenticateUser = async (username, password, done) => {
    try {
      const res = await pool.query('SELECT * FROM login WHERE username = $1', [username]);
    if (res.rows.length > 0) {
        const user = res.rows[0];
        const isValidPassword = await bcrypt.compare(password, user.passwd);
        if (isValidPassword) {
        return done(null, user);
        } else {
        return done(null, false, { message: 'Password incorrect' });
        }
    } else {
        return done(null, false, { message: 'No user with that username' });
    }
    } catch (err) {
    return done(err);
    }
};

passport.use(new LocalStrategy({ usernameField: 'username' }, authenticateUser));
passport.serializeUser((user, done) => done(null, user.id));
passport.deserializeUser(async (id, done) => {
    try {
      const res = await pool.query('SELECT * FROM login WHERE id = $1', [id]);
    return done(null, res.rows[0]);
    } catch (err) {
    return done(err);
    }
});
}

module.exports = initialize;