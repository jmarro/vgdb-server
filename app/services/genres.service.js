const Genre = require('../models/Genre.model');

async function getAllGenres() {
  return await Genre.findAndCountAll({ limit: 6 });
};

async function getGenre(id) {
  return await Genre.findAll({
    where: {
      id: id
    },
    include: ['parent_genre', 'sub_genre', 'games']
  });
};

async function createGenre(genre) {
  return await Genre.create(genre);
};

module.exports = {
  getAllGenres,
  getGenre,
  createGenre
};
