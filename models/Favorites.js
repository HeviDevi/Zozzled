
const Sequelize = require('sequelize');
const db = require('../config/database');

const Favorite = db.define('favorites', {
    
    username: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    drink_id: {
        type: Sequelize.STRING,
        allowNull: false,
        primaryKey: true
    },
    drink_name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    spirit_type: {
        type: Sequelize.STRING,
        allowNull: false
    },
    spirit_amount: {
        type: Sequelize.STRING,
        allowNull: false
    },
    ingredients: {
        type: Sequelize.STRING,
        allowNull: false
    },
    instructions: {
        type: Sequelize.STRING,
        allowNull: false
    },
    bitter: {
        type: Sequelize.BOOLEAN,
        allowNull: false
    },
    sweet: {
        type: Sequelize.BOOLEAN,
        allowNull: false
    },
    image_link: {
        type: Sequelize.STRING,
        allowNull: false
    }

}, {
    timestamps: false, // Disable timestamps
    freezeTableName: true // Prevent Sequelize from pluralizing the table name
});

module.exports = Favorite;