const Game = require('../models/Game.model');
const Game_Award = require('../models/Game_Award.model');
const Game_Character = require('../models/Game_Character.model');
const Game_Company = require('../models/Game_Company.model');
const Game_Genre = require('../models/Game_Genre.model');
const Game_Person = require('../models/Game_Person.model');
const Game_Platform = require('../models/Game_Platform.model');
const Game_Theme = require('../models/Game_Theme.model');
const AwardCategory = require('../models/AwardCategory.model');
const Character = require('../models/Character.model');

async function getAllGames() {
  return await Game.findAndCountAll({ limit: 6 });
};

async function getGame(id) {
  return await Game.findAll({
    where: {
      id: id
    },
    include: ['serie', 'franchise', 'genres', 'themes', 'directors', 'platforms', 'companies',
    {
      model: Character,
      as: 'characters',
      include: ['franchise']
    },
    {
      model: AwardCategory,
      as: 'awards',
      include: ['award']
    }]
  });
};

async function createGame(game) {
  return await Game.create(game);
};

async function addGenres(gameGenresArr) {
  console.log(gameGenresArr)
  return await Game_Genre.bulkCreate(gameGenresArr);
}

async function addThemes(gameThemesArr) {
  console.log(gameThemesArr)
  return await Game_Theme.bulkCreate(gameThemesArr);
}

async function addDirectors(gameDirectorsArr) {
  console.log(gameDirectorsArr)
  return await Game_Person.bulkCreate(gameDirectorsArr);
}

async function addPlatforms(gamePlatformsArr) {
  console.log(gamePlatformsArr)
  return await Game_Platform.bulkCreate(gamePlatformsArr);
}

async function addDevelopers(gameCompaniesArr) {
  console.log(gameCompaniesArr)
  return await Game_Company.bulkCreate(gameCompaniesArr);
}

async function addPublishers(gameCompaniesArr) {
  console.log(gameCompaniesArr)
  return await Game_Company.bulkCreate(gameCompaniesArr);
}

async function addPlayableCharacters(gameCharactersArr) {
  console.log(gameCharactersArr)
  return await Game_Character.bulkCreate(gameCharactersArr);
}

async function addSecondaryCharacters(gameCharactersArr) {
  console.log(gameCharactersArr)
  return await Game_Character.bulkCreate(gameCharactersArr);
}

async function addAntagonistCharacters(gameCharactersArr) {
  console.log(gameCharactersArr)
  return await Game_Character.bulkCreate(gameCharactersArr);
}

async function addVillainCharacters(gameCharactersArr) {
  console.log(gameCharactersArr)
  return await Game_Character.bulkCreate(gameCharactersArr);
}

async function addAwards(gameAwardsArr) {
  console.log(gameAwardsArr)
  return await Game_Award.bulkCreate(gameAwardsArr);
}

async function updateOwnedGame(id, owned) {
  console.log(id);
  await Game.update({ owned }, {
    where: {
      id: id
    }
  });
}

async function updatePersonalStatus(id, personal_status) {
  console.log(id);
  await Game.update({ personal_status }, {
    where: {
      id: id
    }
  });
}

module.exports = {
  getAllGames,
  getGame,
  createGame,
  addGenres,
  addThemes,
  addDirectors,
  addPlatforms,
  addDevelopers,
  addPublishers,
  addPlayableCharacters,
  addSecondaryCharacters,
  addAntagonistCharacters,
  addVillainCharacters,
  addAwards,
  updateOwnedGame,
  updatePersonalStatus
};