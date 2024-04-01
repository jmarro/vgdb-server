var express = require('express');
var router = express.Router();

const controllers = require('../controllers/people.controller');

router.get('/', controllers.getAllPeople);
router.get('/:id_person', controllers.getPerson);
router.post('/', controllers.createPerson);
router.put('/:id_person', controllers.updatePerson);
router.delete('/:id_person', controllers.deletePerson);

module.exports = router;
