const Award = require('../models/Award.model');
const AwardCategory = require('../models/AwardCategory.model');

async function getAllAwards() {
  return await Award.findAndCountAll({ limit: 6 });
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

async function createAwardCategory(awardCategory) {
  return await AwardCategory.create(awardCategory);
};

module.exports = {
  getAllAwards,
  getAward,
  createAward,
  createAwardCategory
};
