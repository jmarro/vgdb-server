const Person = require('../models/Person.model');

async function getAllPeople() {
  return await Person.findAndCountAll({ limit: 6 });
};

async function getPerson(id) {
  return await Person.findAll({
    where: {
      id: id
    },
    include: ['franchises', 'characters']
  });
};

async function createPerson(person) {
  return await Person.create(person);
};

module.exports = {
  getAllPeople,
  getPerson,
  createPerson
};
