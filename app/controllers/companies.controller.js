const services = require('../services/companies.service');

async function getAllCompanies(req, res) {
  try {
		const companies = await services.getAllCompanies();
    res.json(companies);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function getCompany(req, res) {
  try {
    const id = req.params.id_company;
    const company = await services.getCompany(id);
    res.json(company);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createCompany(req, res) {
  try {
    console.log('request', req);
    console.log('company', req.body);
    const response = await services.createCompany(req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

module.exports = {
  getAllCompanies,
  getCompany,
  createCompany
};