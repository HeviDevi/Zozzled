const { Model, DataTypes } = require('sequelize');
const sequelize = require('../config/database'); // Ensure this path is correct

class Login extends Model {}

Login.init({
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
    allowNull: false
  },
  userid: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  username: {
    type: DataTypes.STRING(16),
    allowNull: false
  },
  passwd: {
    type: DataTypes.STRING(255),
    allowNull: false
  },
  email: {
    type: DataTypes.STRING(35),
    allowNull: false
  },
  dob: {
    type: DataTypes.DATEONLY,
    allowNull: false
  }
}, {
  sequelize,
  modelName: 'Login',
  tableName: 'login',
  schema: 'public',
  timestamps: false
});

module.exports = Login;