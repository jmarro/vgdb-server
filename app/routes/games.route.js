var express = require('express');
var router = express.Router();

const controllers = require('../controllers/games.controller');

router.get('/', controllers.getAllGames);
router.get('/:id_game', controllers.getGame);
router.post('/', controllers.createGame);
router.post('/:id_game/addGenres', controllers.addGenres);
router.post('/:id_game/addThemes', controllers.addThemes);
router.post('/:id_game/addDirectors', controllers.addDirectors);
router.post('/:id_game/addPlatforms', controllers.addPlatforms);
router.post('/:id_game/addDevelopers', controllers.addDevelopers);
router.post('/:id_game/addPublishers', controllers.addPublishers);
router.post('/:id_game/addPlayableCharacters', controllers.addPlayableCharacters);
router.post('/:id_game/addAntagonistCharacters', controllers.addAntagonistCharacters);
router.post('/:id_game/addSecondaryCharacters', controllers.addSecondaryCharacters);
router.post('/:id_game/addVillainCharacters', controllers.addVillainCharacters);
router.post('/:id_game/addAwards', controllers.addAwards);

module.exports = router;
