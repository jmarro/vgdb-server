const services = require('../services/awards.service');

async function getAllAwards(req, res) {
  try {
    let awards;
    let page = req.query && req.query.page ? req.query.page : 0;
    if (req.query && req.query.name) {
      console.log('here',req.query.name)
      awards = await services.getSearchAwards(req.query.name, page);
    } else { 
      awards = await services.getAllAwards(page);
    }
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

async function updateAward(req, res) {
  try {
    const award_id = req.params.id_award;
    console.log('request', req);
    console.log('update award', req.body);
    const response = await services.updateAward(parseInt(award_id), req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function deleteAward(req, res) {
  try {
    const award_id = req.params.id_award;
    console.log('delete', req);
    const response = await services.deleteAward(parseInt(award_id));
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
  updateAward,
  deleteAward
};