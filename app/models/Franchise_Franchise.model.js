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

Franchise.belongsToMany(Franchise, {  as: 'parentFranchises', through: Franchise_Franchise, foreignKey:'subFranchiseId' });
Franchise.belongsToMany(Franchise, {  as: 'subfranchises', through: Franchise_Franchise, foreignKey:'parentFranchiseId' });

module.exports = Franchise_Franchise;