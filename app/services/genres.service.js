const { Op } = require('sequelize');

const Genre = require('../models/Genre.model');

async function getAllGenres(page) {
  const offset = 9*page;
  return await Genre.findAndCountAll({
    where: {
      parentId: {
        [Op.eq]: null
      }
    },
    limit: 9,
    offset,
    order: [['is_main', 'DESC NULLS LAST'],['name', 'ASC']]
  });
};

async function getSearchGenres(search, page) {
  const offset = 9*page;
  return await Genre.findAndCountAll({
    where: {
      name: {
        [Op.iLike]: '%'+search+'%'
      }
    },
    limit: 9,
    offset,
    order: [['is_main', 'ASC'],['name', 'ASC']]
  });
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

async function updateGenre(id, genre) {
  console.log(id);
  await Genre.update(genre, {
    where: {
      id: id
    }
  });
}

async function deleteGenre(id) {
  console.log(id);
  await Genre.destroy({
    where: {
      id: id
    }
  });
}

module.exports = {
  getAllGenres,
  getSearchGenres,
  getGenre,
  createGenre,
  updateGenre,
  deleteGenre
};
