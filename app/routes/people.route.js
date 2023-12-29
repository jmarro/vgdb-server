var express = require('express');
var router = express.Router();

const controllers = require('../controllers/people.controller');

router.get('/', controllers.getAllPeople);
router.get('/:id_person', controllers.getPerson);
router.post('/', controllers.createPerson);

module.exports = router;
