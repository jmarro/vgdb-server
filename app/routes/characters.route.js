var express = require('express');
var router = express.Router();

const controllers = require('../controllers/characters.controller');

router.get('/', controllers.getAlCharacters);
router.get('/:id_character', controllers.getCharacter);
router.post('/', controllers.createCharacter);
router.put('/:id_character', controllers.updateCharacter);
router.delete('/:id_character', controllers.deleteCharacter);
router.post('/:id_character/addCreators', controllers.addCreators);
router.post('/:id_character/removeCreator', controllers.removeCreator);

module.exports = router;
