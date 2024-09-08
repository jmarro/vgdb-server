var express = require('express');
var router = express.Router();

const controllers = require('../controllers/franchises.controller');

router.get('/', controllers.getAllFranchises);
router.get('/:id_franchise', controllers.getFranchise);
router.post('/', controllers.createFranchise);
router.put('/:id_franchise', controllers.updateFranchise);
router.delete('/:id_franchise', controllers.deleteFranchise);
router.post('/:id_franchise/addCreators', controllers.addCreators);
router.post('/:id_franchise/removeCreator', controllers.removeCreator);
router.post('/:id_franchise/addParentFranchises', controllers.addParentFranchises);
router.post('/:id_franchise/removeParentFranchise', controllers.removeParentFranchise);

module.exports = router;
