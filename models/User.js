const { Model, DataTypes } = require('sequelize');
const sequelize = require('../config/database');

class UserDrink extends Model {}

UserDrink.init(
    {
        id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true,
        },
        drinkname: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        spirittype: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        spiritamount: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        ingredients: {
            type: DataTypes.TEXT,
            allowNull: false,
        },
        instructions: {
            type: DataTypes.TEXT,
            allowNull: false,
        },
    },
    {
    sequelize,
    freezeTableName: true,
    underscored: true,
    timestamps: false,
    modelName: 'userdrinks',
    }
);

module.exports = UserDrink;