const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Franchise = require('./Franchise.model');
const Serie = require('./Serie.model');

class Game extends Model {
}
  
Game.init({
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
    logo: {
        type: DataTypes.STRING
    },
    back_cover: {
        type: DataTypes.STRING
    },
    release_date: {
        type: DataTypes.DATEONLY,
        allowNull: false
    },
    score: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    format: {
        type: DataTypes.STRING,
        allowNull: false
    },
    price: {
        type: DataTypes.FLOAT,
        allowNull: false
    },
    num_players: {
        type: DataTypes.STRING
    },
    alt_name: {
        type: DataTypes.STRING
    },
    wikipedia: {
        type: DataTypes.STRING
    },
    color: {
        type: DataTypes.STRING
    },
    owned: {
        type: DataTypes.BOOLEAN,
        defaultValue: false
    },
    personal_status: {
        type: DataTypes.STRING,
        defaultValue: 'NOT_PLAYED'
    }
}, { 
    sequelize
});

Franchise.hasMany(Game, {as: 'games', foreignKey: 'franchiseId'});
Game.belongsTo(Franchise, {as: 'franchise', foreignKey: 'franchiseId'});

Serie.hasMany(Game, {as: 'games', foreignKey: 'serieId'});
Game.belongsTo(Serie, {as: 'serie', foreignKey: 'serieId'});

module.exports = Game;