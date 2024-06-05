const { Op } = require('sequelize');

const Company = require('../models/Company.model');

async function getAllCompanies(page) {
  const offset = 9*page;
  return await Company.findAndCountAll({ 
    limit: 9,
    offset,
    order: [['is_main', 'DESC NULLS LAST'],['active', 'DESC'], ['owner_relation','NULLS FIRST'], ['founding_year', 'ASC']]
  });
};

async function getSearchCompanies(search, page) {
  const offset = 9*page;
  return await Company.findAndCountAll({
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

async function getCompany(id) {
  return await Company.findAll({
    where: {
      id: id
    },
    include: ['parent_company', 'platforms', 'games', 'sub_companies', 'franchises', 'franchises_created']
  });
};

async function createCompany(company) {
  return await Company.create(company);
};

async function updateCompany(id, company) {
  console.log(id);
  await Company.update(company, {
    where: {
      id: id
    }
  });
}

async function deleteCompany(id, company) {
  console.log(id);
  await Company.destroy({
    where: {
      id: id
    }
  });
}

module.exports = {
  getAllCompanies,
  getSearchCompanies,
  getCompany,
  createCompany,
  updateCompany,
  deleteCompany
};