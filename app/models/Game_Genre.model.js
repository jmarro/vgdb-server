const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Game = require('./Game.model');
const Genre = require('./Genre.model');

class Game_Genre extends Model {
}
  
Game_Genre.init({
    is_main_for_genre: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

Game.belongsToMany(Genre, { as: 'genres', through: Game_Genre });
Genre.belongsToMany(Game, { as: 'games', through: Game_Genre });

module.exports = Game_Genre;