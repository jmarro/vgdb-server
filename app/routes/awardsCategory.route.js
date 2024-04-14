var express = require('express');
var router = express.Router();

const controllers = require('../controllers/awardsCategory.controller');

router.get('/', controllers.getAllCategories);
router.get('/:id_category', controllers.getCategory);
router.post('/', controllers.createCategory);
router.put('/:id_category', controllers.updateCategory);
router.delete('/:id_category', controllers.deleteCategory);

module.exports = router;
