// //models/Drink.js

// const Sequelize = require('sequelize');
// const db = require('../config/database');

// const Drinks = db.define('drinkrecipes', {
//     drink_id: {
//         type: Sequelize.STRING,
//         allowNull: false,
//         primaryKey: true
//     },
//     drink_name: {
//         type: Sequelize.STRING,
//         allowNull: false
//     },
//     spirit_type: {
//         type: Sequelize.STRING,
//         allowNull: false
//     },
//     spirit_amount: {
//         type: Sequelize.STRING,
//         allowNull: false
//     },
//     ingredients: {
//         type: Sequelize.STRING,
//         allowNull: false
//     },
//     instructions: {
//         type: Sequelize.STRING,
//         allowNull: false
//     },
//     bitter: {
//         type: Sequelize.BOOLEAN,
//         allowNull: false
//     },
//     sweet: {
//         type: Sequelize.BOOLEAN,
//         allowNull: false
//     },
//     image_link: {
//         type: Sequelize.STRING,
//         allowNull: false
//     }

// }, {
//     timestamps: false, // Disable timestamps
//     freezeTableName: true, // Prevent Sequelize from pluralizing the table name
//     modelName: 'drinkrecipes'
// });

// module.exports = Drinks;



const { Model, DataTypes } = require('sequelize');
const sequelize = require('../config/database');

class Drinks extends Model {}

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
        type: DataTypes.STRING,
        allowNull: false,
    },
    instructions: {
        type: DataTypes.STRING,
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
        type: DataTypes.STRING,
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

