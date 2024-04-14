const services = require('../services/awardsCategory.service');

async function getAllCategories(req, res) {
  try {
		const models = await services.getAllCategories();
    res.json(models);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function getCategory(req, res) {
  try {
    const id = req.params.id_serie;
    const model = await services.getCategory(id);
    res.json(model);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createCategory(req, res) {
  try {
    console.log('request', req);
    console.log('category', req.body);
    const response = await services.createCategory(req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function updateCategory(req, res) {
  try {
    const category_id = req.params.id_category;
    console.log('request', req);
    console.log('update category', req.body);
    const response = await services.updateCategory(parseInt(category_id), req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function deleteCategory(req, res) {
  try {
    const category_id = req.params.id_category;
    console.log('delete', req);
    const response = await services.deleteCategory(parseInt(category_id));
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

module.exports = {
  getAllCategories,
  getCategory,
  createCategory,
  updateCategory,
  deleteCategory
};