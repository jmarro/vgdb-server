var express = require('express');
var router = express.Router();

const controllers = require('../controllers/genres.controller');

router.get('/', controllers.getAllGenres);
router.get('/:id_genre', controllers.getGenre);
router.post('/', controllers.createGenre);

module.exports = router;
