const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Character = require('./Character.model');
const Person = require('./Person.model');

class Character_Person extends Model {
}
  
Character_Person.init({
    is_main_for_person: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

Person.belongsToMany(Character, { as: 'characters', through: Character_Person });
Character.belongsToMany(Person, { as: 'creators', through: Character_Person });

module.exports = Character_Person;