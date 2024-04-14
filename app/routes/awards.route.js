var express = require('express');
var router = express.Router();

const controllers = require('../controllers/awards.controller');

router.get('/', controllers.getAllAwards);
router.get('/:id_award', controllers.getAward);
router.post('/', controllers.createAward);
router.put('/:id_award', controllers.updateAward);
router.delete('/:id_award', controllers.deleteAward);

module.exports = router;
