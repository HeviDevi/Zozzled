// models/Rating.js

const { DataTypes } = require("sequelize");
const db = require("../config/database");

const Rating = db.define("Rating", {
    drinkName: {
        type: DataTypes.TEXT,
        allowNull: false,
    },
    rating: {
        type: DataTypes.TEXT,
        allowNull: false,
    },
    comment: {
        type: DataTypes.TEXT,
        allowNull: false,
    },
});

module.exports = Rating;
