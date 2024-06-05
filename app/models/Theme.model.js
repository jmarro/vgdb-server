const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');

class Theme extends Model {
}
  
Theme.init({
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
    is_main: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

Theme.hasMany(Theme, {as: 'sub_theme', foreignKey: 'parentId'});
Theme.belongsTo(Theme, {as: 'parent_theme', foreignKey: 'parentId'});

module.exports = Theme;