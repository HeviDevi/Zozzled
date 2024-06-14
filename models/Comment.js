const { Model, DataTypes } = require("sequelize");
const sequelize = require("../config/database");
const Drinks = require("./Drinks");

class Comment extends Model {}

Comment.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    rating: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    text: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    drink_id: {
      type: DataTypes.STRING,
      allowNull: false,
      references: {
        model: Drinks,
        key: "drink_id",
      },
    },
  },
  {
    sequelize,
    modelName: "Comment",
    timestamps: true,
  }
);

Drinks.hasMany(Comment, { foreignKey: "drink_id" });
Comment.belongsTo(Drinks, { foreignKey: "drink_id" });

module.exports = Comment;
