const Franchise = require('../models/Franchise.model');
const Franchise_Person = require('../models/Franchise_Person.model');
const Serie = require('../models/Serie.model');
const { Op } = require('sequelize');

async function getAllFranchises() {
  return await Franchise.findAndCountAll({ limit: 6 });
};

async function getSearchFranchises(search) {
  return await Franchise.findAndCountAll({
    where: {
      name: {
        [Op.iLike]: '%'+search+'%'
      }
    },
    limit: 9
  });
};

async function getFranchise(id) {
  return await Franchise.findAll({
    where: {
      id: id
    },
    include: ['company', 'creators', 'characters', 'company_creator',
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

async function updateFranchise(id, franchise) {
  console.log(id);
  await Franchise.update(franchise, {
    where: {
      id: id
    }
  });
}

async function deleteFranchise(id) {
  console.log(id);
  await Franchise.destroy({
    where: {
      id: id
    }
  });
}

async function addCreators(franchiseCreatorsArr) {
  console.log(franchiseCreatorsArr)
  return await Franchise_Person.bulkCreate(franchiseCreatorsArr);
}

async function removeCreator(franchiseCreator) {
  console.log(franchiseCreator)
  return await Franchise_Person.destroy({
    where: {
      FranchiseId: franchiseCreator.FranchiseId,
      PersonId: franchiseCreator.PersonId
    },
  });
}



module.exports = {
  getAllFranchises,
  getSearchFranchises,
  getFranchise,
  createFranchise,
  updateFranchise,
  deleteFranchise,
  addCreators,
  removeCreator
};