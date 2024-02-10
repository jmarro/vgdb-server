const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Game = require('./Game.model');
const Person = require('./Person.model');

class Game_Person extends Model {
}
  
Game_Person.init({
    is_main_for_person: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

Person.belongsToMany(Game, { as: 'games', through: Game_Person });
Game.belongsToMany(Person, { as: 'directors', through: Game_Person });

module.exports = Game_Person;