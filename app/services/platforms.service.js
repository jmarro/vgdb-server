const { Op } = require('sequelize');

const Platform = require('../models/Platform.model');

async function getAllPlatforms(page) {
  const offset = 9*page;
  return await Platform.findAndCountAll({ 
    limit: 9,
    offset,
    order: [['is_main', 'DESC NULLS LAST'],['name', 'ASC']]
  });
};

async function getSearchPlatforms(search, page) {
  const offset = 9*page;
  return await Platform.findAndCountAll({
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

async function getPlatform(id) {
  return await Platform.findAll({
    where: {
      id: id
    },
    include: ['manufacturer', 'models', 'games']
  });
};

async function createPlatform(platform) {
  return await Platform.create(platform);
};

async function updatePlatform(id, platform) {
  console.log(id);
  await Platform.update(platform, {
    where: {
      id: id
    }
  });
}

async function deletePlatform(id) {
  console.log(id);
  await Platform.destroy({
    where: {
      id: id
    }
  });
}

module.exports = {
  getAllPlatforms,
  getSearchPlatforms,
  getPlatform,
  createPlatform,
  updatePlatform,
  deletePlatform
};