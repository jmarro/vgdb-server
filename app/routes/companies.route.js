var express = require('express');
var router = express.Router();

const controllers = require('../controllers/companies.controller');

router.get('/', controllers.getAllCompanies);
router.get('/:id_company', controllers.getCompany);
router.post('/', controllers.createCompany);
router.put('/:id_company', controllers.updateCompany);
router.delete('/:id_company', controllers.deleteCompany);
router.post('/:id_company/addPeople', controllers.addPeople);
router.post('/:id_company/removePerson', controllers.removePerson);

module.exports = router;
