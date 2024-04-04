var express = require('express');
var router = express.Router();

const controllers = require('../controllers/series.controller');

router.get('/', controllers.getAllSeries);
router.get('/:id_serie', controllers.getSerie);
router.post('/', controllers.createSerie);
router.put('/:id_serie', controllers.updateSerie);
router.delete('/:id_serie', controllers.deleteSerie);

module.exports = router;
