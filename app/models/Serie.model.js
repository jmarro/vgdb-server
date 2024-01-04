const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Franchise = require('./Franchise.model');

class Serie extends Model {
}
  
Serie.init({
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    is_main: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

Franchise.hasMany(Serie, {as: 'series', foreignKey: 'franchise_id'});
Serie.belongsTo(Franchise, {as: 'franchise', foreignKey: 'franchise_id'});

module.exports = Serie;