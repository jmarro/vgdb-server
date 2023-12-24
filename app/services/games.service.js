const Person = require('../models/Person.model');

async function getAllGames() {
  return await Person.findAndCountAll({ limit: 6 });
};

async function getGame(id) {
  return await Person.findAll({
    where: {
      id: id
    }
  });
};

module.exports = {
  getAllGames,
  getGame
};