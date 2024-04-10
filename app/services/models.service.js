const PlatformModel = require('../models/Platform_Model.model');

async function getAllModels() {
  return await PlatformModel.findAndCountAll({ limit: 6 });
};

async function getModel(id) {
  return await PlatformModel.findAll({
    where: {
      id: id
    }
  });
};

async function createModel(model) {
  return await PlatformModel.create(model);
};

async function updateModel(id, model) {
  console.log(id);
  await PlatformModel.update(model, {
    where: {
      id: id
    }
  });
}

async function deleteModel(id) {
  console.log(id);
  await PlatformModel.destroy({
    where: {
      id: id
    }
  });
}

module.exports = {
  getAllModels,
  getModel,
  createModel,
  updateModel,
  deleteModel
};
