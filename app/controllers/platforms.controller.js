const services = require('../services/platforms.service');

async function getAllPlatforms(req, res) {
  try {
    let platforms;
    if (req.query && req.query.name) {
      console.log('here',req.query.name)
      platforms = await services.getSearchPlatforms(req.query.name);
    } else { 
      platforms = await services.getAllPlatforms();
    }
    res.json(platforms);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function getPlatform(req, res) {
  try {
    const id = req.params.id_platform;
    const platform = await services.getPlatform(id);
    res.json(platform);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createPlatform(req, res) {
  try {
    console.log('request', req);
    console.log('platform', req.body);
    const response = await services.createPlatform(req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function updatePlatform(req, res) {
  try {
    const platform_id = req.params.id_platform;
    console.log('request', req);
    console.log('update platform', req.body);
    const response = await services.updatePlatform(parseInt(platform_id), req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function deletePlatform(req, res) {
  try {
    const platform_id = req.params.id_platform;
    console.log('delete', req);
    const response = await services.deletePlatform(parseInt(platform_id));
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

module.exports = {
  getAllPlatforms,
  getPlatform,
  createPlatform,
  updatePlatform,
  deletePlatform
};