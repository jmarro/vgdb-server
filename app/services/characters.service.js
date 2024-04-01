const { Op } = require('sequelize');

const Character = require('../models/Character.model');
const Character_Person = require('../models/Character_Person.model');

async function getAllCharacters() {
  return await Character.findAndCountAll({ 
    limit: 6,
    include: ['franchise']
  });
};

async function getCharacter(id) {
  return await Character.findAll({
    where: {
      id: id
    },
    include: ['franchise', 'creators', 'games']
  });
};

async function getSearchCharacter(search) {
  return await Character.findAndCountAll({
    where: {
      name: {
        [Op.iLike]: '%'+search+'%'
      }
    },
    limit: 9
  });
};


async function createCharacter(character) {
  return await Character.create(character);
};

async function updateCharacter(id, character) {
  console.log(id);
  await Character.update(character, {
    where: {
      id: id
    }
  });
}

async function deleteCharacter(id) {
  console.log(id);
  await Character.destroy({
    where: {
      id: id
    }
  });
}

async function addCreators(characterCreatorsArr) {
  console.log(characterCreatorsArr)
  return await Character_Person.bulkCreate(characterCreatorsArr);
}

async function removeCreator(characterCreator) {
  console.log(characterCreator)
  return await Character_Person.destroy({
    where: {
      CharacterId: characterCreator.CharacterId,
      PersonId: characterCreator.PersonId
    },
  });
}

module.exports = {
  getAllCharacters,
  getSearchCharacter,
  getCharacter,
  createCharacter,
  updateCharacter,
  deleteCharacter,
  addCreators,
  removeCreator
};
