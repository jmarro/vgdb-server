const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');

class Company extends Model {
}
  
Company.init({
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
    country: {
        type: DataTypes.STRING
    },
    founding_year: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    active: {
        type: DataTypes.BOOLEAN,
        defaultValue: true
    },
    defunct_year: {
        type: DataTypes.INTEGER
    },
    defunct_reason: {
        type: DataTypes.STRING
    },
    owner_relation: {
        type: DataTypes.STRING
    },
    previous_names: {
        type: DataTypes.STRING
    },
    color: {
        type: DataTypes.STRING
    },
    wikipedia: {
        type: DataTypes.STRING
    },
    notes: {
        type: DataTypes.STRING
    },
    is_main: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

Company.hasMany(Company, {as: 'sub_companies', foreignKey: 'ownerId'});
Company.belongsTo(Company, {as: 'parent_company', foreignKey: 'ownerId'});


module.exports = Company;