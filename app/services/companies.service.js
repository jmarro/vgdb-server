const { Sequelize, Op } = require('sequelize');

const Company = require('../models/Company.model');
const Game = require('../models/Game.model');
const Game_Company = require('../models/Game_Company.model');

async function getAllCompanies(page) {
  const offset = 9*page;
  return await Company.findAndCountAll({ 
    limit: 9,
    offset,
    order: [['is_main', 'DESC NULLS LAST'],['active', 'DESC'], ['owner_relation','NULLS FIRST'], ['founding_year', 'ASC']]
  });
};

async function getSearchCompanies(search, page) {
  const offset = 9*page;
  return await Company.findAndCountAll({
    where: {
      name: {
        [Op.iLike]: '%'+search+'%'
      }
    },
    limit: 9,
    offset,
    order: [['name', 'ASC']]
  });
};

async function getCompany(id, pageDeveloped, pagePublished) {
  const offsetDeveloped = 9*pageDeveloped;
  const offsetPublished = 9*pagePublished;
  let order = [['score', 'DESC NULLS LAST'], ['name', 'ASC']];
  const companies =  await Company.findAll({
    where: {
      id: id
    },
    include: ['parent_company', 'platforms', 'sub_companies', 'franchises', 'franchises_created']
  });
  const games_developed = await Game.findAndCountAll({

    include: [{
      model: Company,
      as: 'companies',  // Especificamos el alias correspondiente aquí
      where: { id }, 
      through: { 
        attributes: ['type'],  // Incluir el campo 'type' de la tabla intermedia
        where: {type: 'DEVELOPER'}  // Filtrar por 'type' si se proporciona
      }
    }
    ],
    order,
    limit: 9,
    offset: offsetDeveloped,
  });

  const games_published = await Game.findAndCountAll({

    include: [{
      model: Company,
      as: 'companies',  // Especificamos el alias correspondiente aquí
      where: { id }, 
      through: { 
        attributes: ['type'],  // Incluir el campo 'type' de la tabla intermedia
        where: {type: 'PUBLISHER'}  // Filtrar por 'type' si se proporciona
      }
    }
    ],
    order,
    limit: 9,
    offset: offsetPublished,
  });
  return {
    companies,
    games_developed,
    games_published
  }
};

async function createCompany(company) {
  return await Company.create(company);
};

async function updateCompany(id, company) {
  console.log(id);
  await Company.update(company, {
    where: {
      id: id
    }
  });
}

async function deleteCompany(id, company) {
  console.log(id);
  await Company.destroy({
    where: {
      id: id
    }
  });
}

module.exports = {
  getAllCompanies,
  getSearchCompanies,
  getCompany,
  createCompany,
  updateCompany,
  deleteCompany
};