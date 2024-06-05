const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Game = require('./Game.model');
const Company = require('./Company.model');

class Game_Company extends Model {
}
  
Game_Company.init({
    type: {
        type: DataTypes.STRING,  // DEVELOPER, PUBLISHER
        allowNull: false
    },
    is_main_for_company: {
        type: DataTypes.BOOLEAN
    },
    country: {
        type: DataTypes.STRING
    }
}, { 
    sequelize
});

Company.belongsToMany(Game, { as: 'games', through: Game_Company, unique: false });
Game.belongsToMany(Company, { as: 'companies', through: Game_Company, unique: false });

module.exports = Game_Company;