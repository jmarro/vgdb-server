const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');

class Person extends Model {
}
  
Person.init({
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    main_img: {
        type: DataTypes.STRING
    },
    nationality: {
        type: DataTypes.STRING
    },
    birthday: {
        type: DataTypes.DATEONLY
    },
    wikipedia: {
        type: DataTypes.STRING
    },
    is_main: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

module.exports = Person;