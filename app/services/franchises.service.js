const Franchise = require('../models/Franchise.model');
const Franchise_Franchise = require('../models/Franchise_Franchise.model');
const Franchise_Person = require('../models/Franchise_Person.model');
const Person = require('../models/Person.model');
const Serie = require('../models/Serie.model');


async function getAllFranchises() {
  return await Franchise.findAndCountAll({ limit: 6 });
};

async function getFranchise(id) {
  return await Franchise.findAll({
    where: {
      id: id
    },
    include: ['company', 'creators', 'characters',
    {
      model: Serie,
      as: 'series',
      include: ['games']
    }]
  });
};

async function createFranchise(company) {
  return await Franchise.create(company);
};

async function addCreators(franchiseCreatorsArr) {
  console.log(franchiseCreatorsArr)
  return await Franchise_Person.bulkCreate(franchiseCreatorsArr);
}

module.exports = {
  getAllFranchises,
  getFranchise,
  createFranchise,
  addCreators
};