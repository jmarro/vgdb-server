var express = require('express');
var router = express.Router();

const controllers = require('../controllers/franchises.controller');

router.get('/', controllers.getAllFranchises);
router.get('/:id_franchise', controllers.getFranchise);
router.post('/', controllers.createFranchise);
router.post('/:id_franchise/addCreators', controllers.addCreators);

module.exports = router;
