const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');

class Genre extends Model {
}
  
Genre.init({
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
}, { 
    sequelize
});

Genre.hasMany(Genre, {as: 'sub_genre', foreignKey: 'parentId'});
Genre.belongsTo(Genre, {as: 'parent_genre', foreignKey: 'parentId'});

module.exports = Genre;