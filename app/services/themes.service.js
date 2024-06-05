const { Op } = require('sequelize');

const Theme = require('../models/Theme.model');

async function getAllThemes(page) {
  const offset = 9*page;
  return await Theme.findAndCountAll({
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

async function getSearchThemes(search, page) {
  const offset = 9*page;
  return await Theme.findAndCountAll({
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

async function getTheme(id) {
  return await Theme.findAll({
    where: {
      id: id
    },
    include: ['parent_theme', 'sub_theme', 'games']
  });
};

async function createTheme(theme) {
  return await Theme.create(theme);
};

async function updateTheme(id, theme) {
  console.log(id);
  await Theme.update(theme, {
    where: {
      id: id
    }
  });
}

async function deleteTheme(id) {
  console.log(id);
  await Theme.destroy({
    where: {
      id: id
    }
  });
}

module.exports = {
  getAllThemes,
  getSearchThemes,
  getTheme,
  createTheme,
  updateTheme,
  deleteTheme
};
