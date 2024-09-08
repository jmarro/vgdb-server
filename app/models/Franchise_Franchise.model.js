const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Franchise = require('./Franchise.model');

class Franchise_Franchise extends Model {
}
  
Franchise_Franchise.init({
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    is_main: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

Franchise.belongsToMany(Franchise, {  as: 'parentFranchises', through: Franchise_Franchise, uniqueKey: false, constraints: false,  foreignKey:'subFranchiseId' });
Franchise.belongsToMany(Franchise, {  as: 'subFranchises', through: Franchise_Franchise, uniqueKey: false, constraints: false,  foreignKey:'parentFranchiseId' });

module.exports = Franchise_Franchise;