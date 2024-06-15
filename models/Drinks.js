// //models/Drink.js

const { Model, DataTypes } = require('sequelize');
const sequelize = require('../config/database');

class Drinks extends Model { }

Drinks.init({
    drink_id: {
        type: DataTypes.STRING,
        allowNull: false,
        primaryKey: true,
    },
    drink_name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    spirit_type: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    spirit_amount: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    ingredients: {
        type: DataTypes.TEXT,  // Changed to TEXT to allow longer values
        allowNull: false,
    },
    instructions: {
        type: DataTypes.TEXT,  // Changed to TEXT to allow longer values
        allowNull: false,
    },
    bitter: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
    },
    sweet: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
    },
    image_link: {
        type: DataTypes.TEXT,  // Changed to TEXT to allow longer values
        allowNull: false,
    },
}, {
    sequelize,
    tableName: 'drinkrecipes',
    schema: 'public',
    timestamps: false,
    freezeTableName: true,
    modelName: 'Drinks',
});

module.exports = Drinks;

