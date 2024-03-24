const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');

class Award extends Model {
}
  
Award.init({
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
    },
    main_img: {
        type: DataTypes.STRING
    }
}, { 
    sequelize
});

module.exports = Award;