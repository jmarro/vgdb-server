const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Platform = require('./Platform.model');

class PlatformModel extends Model {
}
  
PlatformModel.init({
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
    release_date: {
        type: DataTypes.DATEONLY,
        allowNull: false
    },
    comments: {
        type: DataTypes.TEXT
    }
}, { 
    sequelize
});

Platform.hasMany(PlatformModel, {as: 'models', foreignKey: 'platform_family_id'});
PlatformModel.belongsTo(Platform, {as: 'family', foreignKey: 'platform_family_id'});

module.exports = PlatformModel;