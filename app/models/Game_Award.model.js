const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Game = require('./Game.model');
const AwardCategory = require('./AwardCategory.model');

class Game_Award extends Model {
}
  
Game_Award.init({
    result: {
        type: DataTypes.STRING,  // WINNER, RUNNERUP
        allowNull: false
    },
    year: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
}, { 
    sequelize
});

Game.belongsToMany(AwardCategory, { as: 'awards', through: Game_Award });
AwardCategory.belongsToMany(Game, { as: 'contests', through: Game_Award });

module.exports = Game_Award;