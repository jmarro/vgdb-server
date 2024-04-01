var express = require('express');
var router = express.Router();

const controllers = require('../controllers/companies.controller');

router.get('/', controllers.getAllCompanies);
router.get('/:id_company', controllers.getCompany);
router.post('/', controllers.createCompany);
router.put('/:id_company', controllers.updateCompany);
router.delete('/:id_company', controllers.deleteCompany);

module.exports = router;
