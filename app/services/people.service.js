const { Op } = require('sequelize');

const Person = require('../models/Person.model');
const Character = require('../models/Character.model');

async function getAllPeople(page) {
  const offset = 9*page;
  return await Person.findAndCountAll({ 
    limit: 9,
    offset,
    order: [['is_main', 'DESC NULLS LAST'],['name', 'ASC']]
  });
};

async function getSearchPeople(search, page) {
  const offset = 9*page;
  return await Person.findAndCountAll({
    where: {
      name: {
        [Op.iLike]: '%'+search+'%'
      }
    },
    limit: 9,
    offset,
    order: [['name', 'ASC']]
  });
};

async function getPerson(id) {
  return await Person.findAll({
    where: {
      id: id
    },
    include: ['franchises', 'games', 'companies',
    {
      model: Character,
      as: 'characters',
      include: ['franchise']
    }]
  });
};

async function createPerson(person) {
  person.main_img = person.main_img || 'person.png';
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
