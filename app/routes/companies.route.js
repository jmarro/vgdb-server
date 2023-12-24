var express = require('express');
var router = express.Router();

const controllers = require('../controllers/companies.controller');

router.get('/', controllers.getAllCompanies);
router.get('/:id_company', controllers.getCompany);
router.post('/', controllers.createCompany);

module.exports = router;
