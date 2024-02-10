const Character = require('../models/Character.model');
const Character_Person = require('../models/Character_Person.model');

async function getAlCharacters() {
  return await Character.findAndCountAll({ limit: 6 });
};

async function getCharacter(id) {
  return await Character.findAll({
    where: {
      id: id
    },
    include: ['franchise', 'creators', 'games']
  });
};

async function createCharacter(character) {
  return await Character.create(character);
};

async function addCreators(characterCreatorsArr) {
  console.log(characterCreatorsArr)
  return await Character_Person.bulkCreate(characterCreatorsArr);
}

module.exports = {
  getAlCharacters,
  getCharacter,
  createCharacter,
  addCreators
};
