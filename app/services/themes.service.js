const Theme = require('../models/Theme.model');

async function getAllThemes() {
  return await Theme.findAndCountAll({ limit: 6 });
};

async function getTheme(id) {
  return await Theme.findAll({
    where: {
      id: id
    }
  });
};

async function createTheme(theme) {
  return await Theme.create(theme);
};

module.exports = {
  getAllThemes,
  getTheme,
  createTheme
};
