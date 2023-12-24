const services = require('../services/platforms.service');

async function getAllPlatforms(req, res) {
  try {
		const platforms = await services.getAllPlatforms();
    res.json(platforms);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function getPlatform(req, res) {
  try {
    const id = req.params.id_platform;
    const game = await services.getPlatform(id);
    res.json(game);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createPlatform(req, res) {
  try {
    console.log('request', req);
    console.log('platform', req.body);
    const something = await services.createPlatform(req.body);
    res.json(something);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

module.exports = {
  getAllPlatforms,
  getPlatform,
  createPlatform
};