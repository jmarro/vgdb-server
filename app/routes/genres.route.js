var express = require('express');
var router = express.Router();

const controllers = require('../controllers/genres.controller');

router.get('/', controllers.getAllGenres);
router.get('/:id_genre', controllers.getGenre);
router.post('/', controllers.createGenre);
router.put('/:id_genre', controllers.updateGenre);
router.delete('/:id_genre', controllers.deleteGenre);
module.exports = router;
