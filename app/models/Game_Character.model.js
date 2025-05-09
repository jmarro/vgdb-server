const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Game = require('./Game.model');
const Character = require('./Character.model');

class Game_Character extends Model {
}
  
Game_Character.init({
    type: {
        type: DataTypes.STRING,  // main, playable, secondary, antagonist, villain, crossover
        allowNull: false
    },
    is_main_for_character: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

Character.belongsToMany(Game, { as: 'games', through: Game_Character });
Game.belongsToMany(Character, { as: 'characters', through: Game_Character });

module.exports = Game_Character;