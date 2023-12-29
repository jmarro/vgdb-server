const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Franchise = require('./Franchise.model');

class Franchise_Franchise extends Model {
}
  
Franchise_Franchise.init({
    is_main: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

Franchise.belongsToMany(Franchise, { through: Franchise_Franchise });

module.exports = Franchise_Franchise;