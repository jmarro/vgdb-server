const services = require('../services/series.service');

async function getAllSeries(req, res) {
  try {
		const series = await services.getAllSeries();
    res.json(series);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function getSerie(req, res) {
  try {
    const id = req.params.id_serie;
    const serie = await services.getSerie(id);
    res.json(serie);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createSerie(req, res) {
  try {
    console.log('request', req);
    console.log('serie', req.body);
    const response = await services.createSerie(req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function updateSerie(req, res) {
  try {
    const serie_id = req.params.id_serie;
    console.log('request', req);
    console.log('update serie', req.body);
    const response = await services.updateSerie(parseInt(serie_id), req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function deleteSerie(req, res) {
  try {
    const serie_id = req.params.id_serie;
    console.log('delete', req);
    const response = await services.deleteSerie(parseInt(serie_id));
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

module.exports = {
  getAllSeries,
  getSerie,
  createSerie,
  updateSerie,
  deleteSerie
};