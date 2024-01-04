const services = require('../services/franchises.service');

async function getAllFranchises(req, res) {
  try {
		const franchises = await services.getAllFranchises();
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

module.exports = {
  getAllFranchises,
  getFranchise,
  createFranchise,
  addCreators
};