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

async function updateSerie(id, serie) {
  console.log(id);
  await Serie.update(serie, {
    where: {
      id: id
    }
  });
}

async function deleteSerie(id) {
  console.log(id);
  await Serie.destroy({
    where: {
      id: id
    }
  });
}

module.exports = {
  getAllSeries,
  getSerie,
  createSerie,
  updateSerie,
  deleteSerie
};
