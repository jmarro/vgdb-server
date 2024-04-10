var express = require('express');
var router = express.Router();

const controllers = require('../controllers/models.controller');

router.get('/', controllers.getAllModels);
router.get('/:id_model', controllers.getModel);
router.post('/', controllers.createModel);
router.put('/:id_model', controllers.updateModel);
router.delete('/:id_model', controllers.deleteModel);

module.exports = router;
