const Company = require('../models/Company.model');


async function getAllCompanies() {
  return await Company.findAndCountAll({ limit: 6 });
};

async function getCompany(id) {
  return await Company.findAll({
    where: {
      id: id
    },
    include: ['parent_company', 'platforms','games', 'sub_companies']
  });
};

async function createCompany(company) {
  return await Company.create(company);
};

module.exports = {
  getAllCompanies,
  getCompany,
  createCompany
};