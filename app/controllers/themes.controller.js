const services = require('../services/themes.service');

async function getAllThemes(req, res) {
  try {
    let themes;
    if (req.query && req.query.name) {
      console.log('here',req.query.name)
      themes = await services.getSearchThemes(req.query.name);
    } else { 
      themes = await services.getAllThemes();
    }
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

async function updateTheme(req, res) {
  try {
    const theme_id = req.params.id_theme;
    console.log('request', req);
    console.log('update theme', req.body);
    const response = await services.updateTheme(parseInt(theme_id), req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function deleteTheme(req, res) {
  try {
    const theme_id = req.params.id_theme;
    console.log('delete', req);
    const response = await services.deleteTheme(parseInt(theme_id));
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};


module.exports = {
  getAllThemes,
  getTheme,
  createTheme,
  updateTheme,
  deleteTheme
};