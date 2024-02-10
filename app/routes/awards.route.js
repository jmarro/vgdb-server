var express = require('express');
var router = express.Router();

const controllers = require('../controllers/awards.controller');

router.get('/', controllers.getAllAwards);
router.get('/:id_award', controllers.getAward);
router.post('/', controllers.createAward);
router.post('/category', controllers.createAwardCategory);

module.exports = router;
