var express = require('express');
var router = express.Router();

const controllers = require('../controllers/platforms.controller');

router.get('/', controllers.getAllPlatforms);
router.get('/:id_platform', controllers.getPlatform);
router.post('/', controllers.createPlatform);

module.exports = router;
