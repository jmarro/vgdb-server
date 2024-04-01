const services = require('../services/companies.service');

async function getAllCompanies(req, res) {
  try {
    let companies;
    if (req.query && req.query.name) {
      console.log('here',req.query.name)
      companies = await services.getSearchCompanies(req.query.name);
    } else { 
      companies = await services.getAllCompanies();
    }
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

async function updateCompany(req, res) {
  try {
    const company_id = req.params.id_company;
    console.log('request', req);
    console.log('update company', req.body);
    const response = await services.updateCompany(parseInt(company_id), req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function deleteCompany(req, res) {
  try {
    const company_id = req.params.id_company;
    console.log('delete', req);
    const response = await services.deleteCompany(parseInt(company_id));
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

module.exports = {
  getAllCompanies,
  getCompany,
  createCompany,
  updateCompany,
  deleteCompany
};