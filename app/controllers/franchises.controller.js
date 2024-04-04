const services = require('../services/franchises.service');

async function getAllFranchises(req, res) {
  try {
    let franchises;
    if (req.query && req.query.name) {
      console.log('here',req.query.name)
      franchises = await services.getSearchFranchises(req.query.name);
    } else { 
      franchises = await services.getAllFranchises();
    }
    res.json(franchises);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function getFranchise(req, res) {
  try {
    const id = req.params.id_franchise;
    const franchise = await services.getFranchise(id);
    res.json(franchise);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createFranchise(req, res) {
  try {
    console.log('request', req);
    console.log('franch', req.body);
    const response = await services.createFranchise(req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function updateFranchise(req, res) {
  try {
    const franchise_id = req.params.id_franchise;
    console.log('request', req);
    console.log('update franchise', req.body);
    const response = await services.updateFranchise(parseInt(franchise_id), req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function deleteFranchise(req, res) {
  try {
    const franchise_id = req.params.id_franchise;
    console.log('delete', req);
    const response = await services.deleteFranchise(parseInt(franchise_id));
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addCreators(req, res) {
  try {
    const franchise_id = req.params.id_franchise;
    console.log('request', req);
    console.log('persons', req.body);
    franchiseCreatorArr = req.body.map(creatorId => {
      return {
        FranchiseId: parseInt(franchise_id),
        PersonId: creatorId
      }
    });
    const response = await services.addCreators(franchiseCreatorArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeCreator(req, res) {
  try {
    const franchise_id = req.params.id_franchise;
    toRemove = {
      FranchiseId: parseInt(franchise_id),
      PersonId: req.body.creatorId
    }
    console.log('request', req);
    console.log('persons', req.body);
    const response = await services.removeCreator(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

module.exports = {
  getAllFranchises,
  getFranchise,
  createFranchise,
  updateFranchise,
  deleteFranchise,
  addCreators,
  removeCreator
};