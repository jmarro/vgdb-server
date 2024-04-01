const { Op } = require('sequelize');

const Company = require('../models/Company.model');

async function getAllCompanies() {
  return await Company.findAndCountAll({ limit: 9 });
};

async function getSearchCompanies(search) {
  return await Company.findAndCountAll({
    where: {
      name: {
        [Op.iLike]: '%'+search+'%'
      }
    },
    limit: 9
  });
};

async function getCompany(id) {
  return await Company.findAll({
    where: {
      id: id
    },
    include: ['parent_company', 'platforms', 'games', 'sub_companies']
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