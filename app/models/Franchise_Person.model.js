const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Franchise = require('./Franchise.model');
const Person = require('./Person.model');

class Franchise_Person extends Model {
}
  
Franchise_Person.init({
    is_main_for_person: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

Person.belongsToMany(Franchise, { as: 'franchises', through: Franchise_Person });
Franchise.belongsToMany(Person, { as: 'creators', through: Franchise_Person });

module.exports = Franchise_Person;