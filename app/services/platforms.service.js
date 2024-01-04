const Platform = require('../models/Platform.model');
const PlatformModel = require('../models/Platform_Model.model');


async function getAllPlatforms() {
  return await Platform.findAndCountAll({ limit: 6 });
};

async function getPlatform(id) {
  return await Platform.findAll({
    where: {
      id: id
    },
    include: ['manufacturer', 'models']
  });
};

async function createPlatform(platform) {
  return await Platform.create(platform);
};

async function createPlatformModel(platformModel) {
  return await PlatformModel.create(platformModel);
};

module.exports = {
  getAllPlatforms,
  getPlatform,
  createPlatform,
  createPlatformModel
};