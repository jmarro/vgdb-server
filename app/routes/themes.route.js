var express = require('express');
var router = express.Router();

const controllers = require('../controllers/themes.controller');

router.get('/', controllers.getAllThemes);
router.get('/:id_theme', controllers.getTheme);
router.post('/', controllers.createTheme);

module.exports = router;
