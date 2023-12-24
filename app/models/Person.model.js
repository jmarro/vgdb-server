const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');

class person extends Model { // in lower case cause the db table
}
  
person.init({
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    first_name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    last_name: {
        type: DataTypes.STRING,
        allowNull: false
        // allowNull defaults to true
    }
}, { 
    sequelize,
    freezeTableName: true // to remove if the table nme is plural
});

module.exports = person;