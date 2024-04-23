var express = require('express');
var router = express.Router();

const controllers = require('../controllers/games.controller');

router.get('/', controllers.getAllGames);
router.get('/:id_game', controllers.getGame);
router.post('/', controllers.createGame);
router.put('/:id_game', controllers.updateGame);
router.delete('/:id_game', controllers.deleteGame);
router.post('/:id_game/addGenres', controllers.addGenres);
router.post('/:id_game/removeGenre', controllers.removeGenre);
router.post('/:id_game/addThemes', controllers.addThemes);
router.post('/:id_game/removeTheme', controllers.removeTheme);
router.post('/:id_game/addDirectors', controllers.addDirectors);
router.post('/:id_game/removeDirector', controllers.removeDirector);
router.post('/:id_game/addPlatforms', controllers.addPlatforms);
router.post('/:id_game/removePlatform', controllers.removePlatform);
router.post('/:id_game/addDevelopers', controllers.addDevelopers);
router.post('/:id_game/removeDeveloper', controllers.removeDeveloper);
router.post('/:id_game/addPublishers', controllers.addPublishers);
router.post('/:id_game/removePublisher', controllers.removePublisher);
router.post('/:id_game/addPlayableCharacters', controllers.addPlayableCharacters);
router.post('/:id_game/removePlayableCharacter', controllers.removePlayableCharacter);
router.post('/:id_game/addAntagonistCharacters', controllers.addAntagonistCharacters);
router.post('/:id_game/removeAntagonistCharacter', controllers.removeAntagonistCharacter);
router.post('/:id_game/addSecondaryCharacters', controllers.addSecondaryCharacters);
router.post('/:id_game/removeSecondaryCharacter', controllers.removeSecondaryCharacter);
router.post('/:id_game/addVillainCharacters', controllers.addVillainCharacters);
router.post('/:id_game/removeVillainCharacter', controllers.removeVillainCharacter);
router.post('/:id_game/addAwards', controllers.addAwards);
router.post('/:id_game/removeAward', controllers.removeAward);
router.post('/:id_game/updateOwnedGame', controllers.updateOwnedGame);
router.post('/:id_game/updatePersonalStatus', controllers.updatePersonalStatus);

module.exports = router;
