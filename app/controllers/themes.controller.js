const services = require('../services/themes.service');

async function getAllThemes(req, res) {
  try {
		const themes = await services.getAllThemes();
    res.json(themes);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function getTheme(req, res) {
  try {
    const id = req.params.id_theme;
    const theme = await services.getTheme(id);
    res.json(theme);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createTheme(req, res) {
  try {
    console.log('request', req);
    console.log('theme', req.body);
    const response = await services.createTheme(req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

module.exports = {
  getAllThemes,
  getTheme,
  createTheme
};