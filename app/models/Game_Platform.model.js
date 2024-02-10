const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Game = require('./Game.model');
const Platform = require('./Platform.model');

class Game_Platform extends Model {
}
  
Game_Platform.init({
    is_main_for_platform: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

Game.belongsToMany(Platform, { as: 'platforms', through: Game_Platform });
Platform.belongsToMany(Game, { as: 'games', through: Game_Platform });

module.exports = Game_Platform;