const { DataTypes, Model } = require('sequelize');
const sequelize = require('../services/db');
const Company = require('./Company.model');
const Person = require('./Person.model');

class Company_Person extends Model {
}
  
Company_Person.init({
    is_main_for_person: {
        type: DataTypes.BOOLEAN
    }
}, { 
    sequelize
});

Person.belongsToMany(Company, { as: 'companies', through: Company_Person });
Company.belongsToMany(Person, { as: 'people', through: Company_Person });

module.exports = Company_Person;