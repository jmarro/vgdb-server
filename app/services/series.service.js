const Serie = require('../models/Serie.model');

async function getAllSeries() {
  return await Serie.findAndCountAll({ limit: 6 });
};

async function getSerie(id) {
  return await Serie.findAll({
    where: {
      id: id
    }
  });
};

async function createSerie(serie) {
  return await Serie.create(serie);
};

module.exports = {
  getAllSeries,
  getSerie,
  createSerie
};
