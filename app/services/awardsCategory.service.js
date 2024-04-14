const AwardCategory = require('../models/AwardCategory.model');

async function getAllCategories() {
  return await AwardCategory.findAndCountAll();
};

async function getCategory(id) {
  return await AwardCategory.findAll({
    where: {
      id: id
    }
  });
};

async function createCategory(category) {
  return await AwardCategory.create(category);
};

async function updateCategory(id, category) {
  console.log(id);
  await AwardCategory.update(category, {
    where: {
      id: id
    }
  });
}

async function deleteCategory(id) {
  console.log(id);
  await AwardCategory.destroy({
    where: {
      id: id
    }
  });
}

module.exports = {
  getAllCategories,
  getCategory,
  createCategory,
  updateCategory,
  deleteCategory
};
