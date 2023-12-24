const Platform = require('../models/Platform.model');


async function getAllPlatforms() {
  return await Platform.findAndCountAll({ limit: 6 });
};

async function getPlatform(id) {
  return await Platform.findAll({
    where: {
      id: id
    },
    include: 'manufacturer'
  });
};

async function createPlatform(platform) {
  return await Platform.create(platform);
};

module.exports = {
  getAllPlatforms,
  getPlatform,
  createPlatform
};