const Franchise = require('../models/Franchise.model');
const Franchise_Franchise = require('../models/Franchise_Franchise.model');
const Franchise_Person = require('../models/Franchise_Person.model');
const Game = require('../models/Game.model');
const Serie = require('../models/Serie.model');
const { Op } = require('sequelize');

async function getAllFranchises(page) {
  const offset = 9*page;
  return await Franchise.findAndCountAll({     
    limit: 9,
    offset,
    order: [['is_main', 'DESC NULLS LAST'],['name', 'ASC']]
  });
};

async function getSearchFranchises(search, page) {
  const offset = 9*page;
  return await Franchise.findAndCountAll({
    where: {
      name: {
        [Op.iLike]: '%'+search+'%'
      }
    },
    limit: 9,
    offset,
    order: [['name', 'ASC']]
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
      include: [{model: Game, as:'games'}]
    },
    {
      model: Franchise,
      as: 'parentFranchises'
    },
    {
      model: Franchise,
      as: 'subFranchises'
    }],
    order: [[ { model: Serie, as: 'series' }, { model: Game, as: 'games' }, 'release_date', 'ASC']]
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

async function addParentFranchise(franchiseFranchiseArr) {
  console.log(franchiseFranchiseArr)
  return await Franchise_Franchise.bulkCreate(franchiseFranchiseArr);
}

async function removeParentFranchise(franchiseFranchise) {
  console.log(franchiseFranchise)
  return await Franchise_Franchise.destroy({
    where: {
      subFranchiseId: franchiseFranchise.subFranchiseId,
      parentFranchiseId: franchiseFranchise.parentFranchiseId
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
  removeCreator,
  addParentFranchise,
  removeParentFranchise
};