const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Franchise = require('./Franchise.model');

class Character extends Model {
}
  
Character.init({
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    full_name: {
        type: DataTypes.STRING
    },
    alias: {
        type: DataTypes.STRING
    },
    alt_names: {
        type: DataTypes.STRING
    },
    main_img: {
        type: DataTypes.STRING
    },
    creation_year: {
        type: DataTypes.INTEGER
    },
    color: {
        type: DataTypes.STRING
    },
    role_in_franchise: {
        type: DataTypes.STRING,
        allowNull: false
    },
    bio: {
        type: DataTypes.TEXT
    }
}, { 
    sequelize
});

Character.belongsTo(Franchise, {as: 'franchise', foreignKey: 'franchise_id'});
Franchise.hasMany(Character, {as: 'characters', foreignKey: 'franchise_id'});


module.exports = Character;