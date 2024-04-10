const { Op } = require('sequelize');

const Platform = require('../models/Platform.model');
const PlatformModel = require('../models/Platform_Model.model');


async function getAllPlatforms() {
  return await Platform.findAndCountAll({ limit: 6 });
};

async function getSearchPlatforms(search) {
  return await Platform.findAndCountAll({
    where: {
      name: {
        [Op.iLike]: '%'+search+'%'
      }
    },
    limit: 9
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