const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Game = require('./Game.model');
const Theme = require('./Theme.model');

class Game_Theme extends Model {
}
  
Game_Theme.init({
    is_main_for_theme: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

Game.belongsToMany(Theme, { as: 'themes', through: Game_Theme });
Theme.belongsToMany(Game, { as: 'games', through: Game_Theme });

module.exports = Game_Theme;