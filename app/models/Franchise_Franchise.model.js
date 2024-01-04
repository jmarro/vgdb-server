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

Franchise.belongsToMany(Franchise, {  as: 'franchises_parents', through: Franchise_Franchise, foreignKey:'parent_id' });
Franchise.belongsToMany(Franchise, {  as: 'subfranchises', through: Franchise_Franchise, foreignKey:'parent_id' });

module.exports = Franchise_Franchise;