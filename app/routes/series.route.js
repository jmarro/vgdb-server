var express = require('express');
var router = express.Router();

const controllers = require('../controllers/series.controller');

router.get('/', controllers.getAllSeries);
router.get('/:id_serie', controllers.getSerie);
router.post('/', controllers.createSerie);

module.exports = router;
