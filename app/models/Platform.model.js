const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Company = require('./Company.model');

class Platform extends Model {
}
  
Platform.init({
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
    mini_logo: {
        type: DataTypes.STRING
    },
    img: {
        type: DataTypes.STRING
    },
    release_date: {
        type: DataTypes.DATEONLY,
        allowNull: false
    },
    gen: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    specs: {
        type: DataTypes.TEXT
    },
    type: {
        type: DataTypes.STRING
    },
    alt_names: {
        type: DataTypes.TEXT
    },
    color: {
        type: DataTypes.STRING
    }
}, { 
    sequelize
});

Company.hasMany(Platform, {as: 'platforms', foreignKey: 'manufacturerId'});
Platform.belongsTo(Company, {as: 'manufacturer', foreignKey: 'manufacturerId'});

module.exports = Platform;