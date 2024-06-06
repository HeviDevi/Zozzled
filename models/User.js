const Sequelize = require('sequelize');
const db = require('../config/database');

const User = db.define('userdrinks', {
    drinkname: {
        type: Sequelize.STRING
    }, 
    spirittype: {
        type: Sequelize.STRING
    },
    spiritamount: {
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