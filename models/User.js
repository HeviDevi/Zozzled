const Sequelize = require('sequelize');
const db = require('../config/database');

const User = db.define('userdrinks', {
    drink_name: {
        type: Sequelize.STRING
    },
    spirit_type: {
        type: Sequelize.STRING
    },
    spirit_amount: {
        type: Sequelize.STRING
    },
    ingredients: {
        type: Sequelize.STRING
    },
    instructions: {
        type: Sequelize.STRING
    }
});

module.exports = User;