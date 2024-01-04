var express = require('express');
var router = express.Router();

const controllers = require('../controllers/characters.controller');

router.get('/', controllers.getAlCharacters);
router.get('/:id_character', controllers.getCharacter);
router.post('/', controllers.createCharacter);
router.post('/:id_character/addCreators', controllers.addCreators);

module.exports = router;
