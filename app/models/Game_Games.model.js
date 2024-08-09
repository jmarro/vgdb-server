const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Game = require('./Game.model');

class Game_Games extends Model {
}

Game_Games.init({
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    type: {
        type: DataTypes.STRING,  // collection, remaster, remake, spinoff
        allowNull: false
    },
}, {
    sequelize
});

Game.belongsToMany(Game, { as: 'subGames', through: Game_Games, uniqueKey: false, constraints: false,  foreignKey: 'parentGameId'});
Game.belongsToMany(Game, { as: 'parentGames', through: Game_Games, uniqueKey: false, constraints: false,  foreignKey: 'subGameId'});

module.exports = Game_Games;