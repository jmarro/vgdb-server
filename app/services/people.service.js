const { Op } = require('sequelize');

const Person = require('../models/Person.model');
const Character = require('../models/Character.model');

async function getAllPeople() {
  return await Person.findAndCountAll({ limit: 6 });
};

async function getSearchPeople(search) {
  return await Person.findAndCountAll({
    where: {
      name: {
        [Op.iLike]: '%'+search+'%'
      }
    },
    limit: 9
  });
};

async function getPerson(id) {
  return await Person.findAll({
    where: {
      id: id
    },
    include: ['franchises', 'games',
    {
      model: Character,
      as: 'characters',
      include: ['franchise']
    }]
  });
};

async function createPerson(person) {
  return await Person.create(person);
};

async function updatePerson(id, person) {
  console.log(id);
  await Person.update(person, {
    where: {
      id: id
    }
  });
}

async function deletePerson(id) {
  console.log(id);
  await Person.destroy({
    where: {
      id: id
    }
  });
}

module.exports = {
  getAllPeople,
  getSearchPeople,
  getPerson,
  createPerson,
  updatePerson,
  deletePerson
};
