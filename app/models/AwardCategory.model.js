const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Award = require('./Award.model');

class AwardCategory extends Model {
}
  
AwardCategory.init({
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

Award.hasMany(AwardCategory, {as: 'categories', foreignKey: 'award_category_id'});
AwardCategory.belongsTo(Award, {as: 'award', foreignKey: 'award_category_id'});

module.exports = AwardCategory;