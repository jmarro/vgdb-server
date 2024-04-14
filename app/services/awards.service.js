const { Op } = require('sequelize');

const Award = require('../models/Award.model');

async function getAllAwards() {
  return await Award.findAndCountAll({ limit: 6 });
};

async function getSearchAwards(search) {
  return await Award.findAndCountAll({
    where: {
      name: {
        [Op.iLike]: '%'+search+'%'
      }
    },
    limit: 9
  });
};

async function getAward(id) {
  return await Award.findAll({
    where: {
      id: id
    },
    include: ['categories']
  });
};

async function createAward(award) {
  return await Award.create(award);
};

async function updateAward(id, award) {
  console.log(id);
  await Award.update(award, {
    where: {
      id: id
    }
  });
}

async function deleteAward(id) {
  console.log(id);
  await Award.destroy({
    where: {
      id: id
    }
  });
}


module.exports = {
  getAllAwards,
  getSearchAwards,
  getAward,
  createAward,
  updateAward,
  deleteAward
};
