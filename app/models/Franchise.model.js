const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Company = require('./Company.model');

class Franchise extends Model {
}
  
Franchise.init({
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
    first_game_date: {
        type: DataTypes.DATEONLY
    },
    color: {
        type: DataTypes.STRING
    }
}, { 
    sequelize
});

Franchise.belongsTo(Company, {as: 'company', foreignKey: 'ownerId'});
Company.hasMany(Franchise, {as: 'franchises', foreignKey: 'ownerId'});


module.exports = Franchise;