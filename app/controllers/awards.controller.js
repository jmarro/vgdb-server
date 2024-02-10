const services = require('../services/awards.service');

async function getAllAwards(req, res) {
  try {
		const awards = await services.getAllAwards();
    res.json(awards);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function getAward(req, res) {
  try {
    const id = req.params.id_award;
    const award = await services.getAward(id);
    res.json(award);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createAward(req, res) {
  try {
    console.log('request', req);
    console.log('award', req.body);
    const response = await services.createAward(req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createAwardCategory(req, res) {
  try {
    console.log('request', req);
    console.log('awardCat', req.body);
    const response = await services.createAwardCategory(req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};


module.exports = {
  getAllAwards,
  getAward,
  createAward,
  createAwardCategory
};