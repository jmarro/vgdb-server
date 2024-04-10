const services = require('../services/models.service');

async function getAllModels(req, res) {
  try {
		const models = await services.getAllModels();
    res.json(models);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function getModel(req, res) {
  try {
    const id = req.params.id_serie;
    const model = await services.getModel(id);
    res.json(model);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createModel(req, res) {
  try {
    console.log('request', req);
    console.log('model', req.body);
    const response = await services.createModel(req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function updateModel(req, res) {
  try {
    const model_id = req.params.id_model;
    console.log('request', req);
    console.log('update model', req.body);
    const response = await services.updateModel(parseInt(model_id), req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function deleteModel(req, res) {
  try {
    const model_id = req.params.id_model;
    console.log('delete', req);
    const response = await services.deleteModel(parseInt(model_id));
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

module.exports = {
  getAllModels,
  getModel,
  createModel,
  updateModel,
  deleteModel
};