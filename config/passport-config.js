const LocalStrategy = require('passport-local').Strategy;
const bcrypt = require('bcrypt');
const Login = require('../models/login'); // Ensure the correct path

function initialize(passport) {
  const authenticateUser = async (username, password, done) => {
    try {
      console.log(`Authenticating user: ${username}`);
      const user = await Login.findOne({ where: { username } });

      if (user) {
        console.log(`User found: ${username}`);

        const isValidPassword = await bcrypt.compare(password, user.passwd);
        console.log(`Password valid: ${isValidPassword}`);

        if (isValidPassword) {
          return done(null, user);
        } else {
          console.log('Password incorrect');
          return done(null, false, { message: 'Password incorrect' });
        }
      } else {
        console.log('No user with that username');
        return done(null, false, { message: 'No user with that username' });
      }
    } catch (err) {
      console.error('Error during authentication:', err);
      return done(err);
    }
  };

  passport.use(new LocalStrategy({ usernameField: 'username' }, authenticateUser));
  passport.serializeUser((user, done) => done(null, user.id));
  passport.deserializeUser(async (id, done) => {
    try {
      const user = await Login.findByPk(id);
      return done(null, user);
    } catch (err) {
      return done(err);
    }
  });
}

module.exports = initialize;