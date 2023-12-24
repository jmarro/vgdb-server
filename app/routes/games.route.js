var express = require('express');
var router = express.Router();

const controllers = require('../controllers/games.controller');

router.get('/', controllers.getAllGames);
router.get('/:id_game', controllers.getGame);

module.exports = router;
