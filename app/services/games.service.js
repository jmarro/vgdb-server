const { Op } = require('sequelize');

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
const Serie = require('../models/Serie.model');

async function getAllGames(page) {
  const offset = 9*page;
  return await Game.findAndCountAll({ 
    limit: 9,
    offset,
    order: [['score', 'DESC NULLS LAST'], ['name', 'ASC']]
  });
};

async function getSearchGames(search, page) {
  const offset = 9*page;
  return await Game.findAndCountAll({
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

async function getGame(id) {
  return await Game.findAll({
    where: {
      id: id
    },
    include: ['franchise', 'genres', 'themes', 'directors', 'platforms', 'companies',
    {
      model: Character,
      as: 'characters',
      include: ['franchise']
    },
    {
      model: AwardCategory,
      as: 'awards',
      include: ['award']
    },
    {
      model: Serie,
      as: 'serie',
      include: ['games']
    },]
  });
};

async function createGame(game) {
  return await Game.create(game);
};

async function updateGame(id, game) {
  console.log(id);
  await Game.update(game, {
    where: {
      id: id
    }
  });
}

async function deleteGame(id) {
  console.log(id);
  await Game.destroy({
    where: {
      id: id
    }
  });
}

async function addGenres(gameGenresArr) {
  console.log(gameGenresArr)
  return await Game_Genre.bulkCreate(gameGenresArr);
}

async function removeGenre(gameGenre) {
  console.log(gameGenre)
  return await Game_Genre.destroy({
    where: {
      GameId: gameGenre.GameId,
      GenreId: gameGenre.GenreId
    }
  });
}

async function addThemes(gameThemesArr) {
  console.log(gameThemesArr)
  return await Game_Theme.bulkCreate(gameThemesArr);
}

async function removeTheme(gameTheme) {
  console.log(gameTheme)
  return await Game_Theme.destroy({
    where: {
      GameId: gameTheme.GameId,
      ThemeId: gameTheme.ThemeId
    }
  });
}

async function addDirectors(gameDirectorsArr) {
  console.log(gameDirectorsArr)
  return await Game_Person.bulkCreate(gameDirectorsArr);
}

async function removeDirector(gameDirector) {
  console.log(gameDirector)
  return await Game_Person.destroy({
    where: {
      GameId: gameDirector.GameId,
      PersonId: gameDirector.PersonId
    }
  });
}

async function addPlatforms(gamePlatformsArr) {
  console.log(gamePlatformsArr)
  return await Game_Platform.bulkCreate(gamePlatformsArr);
}

async function removePlatform(gamePlatform) {
  console.log(gamePlatform)
  return await Game_Platform.destroy({
    where: {
      GameId: gamePlatform.GameId,
      PlatformId: gamePlatform.PersonId
    }
  });
}

async function addDevelopers(gameCompaniesArr) {
  console.log(gameCompaniesArr)
  return await Game_Company.bulkCreate(gameCompaniesArr);
}

async function removeDeveloper(gameCompany) {
  console.log(gameCompany)
  return await Game_Company.destroy({
    where: {
      GameId: gameCompany.GameId,
      CompanyId: gameCompany.CompanyId,
      type: 'DEVELOPER'
    }
  });
}

async function addPublishers(gameCompaniesArr) {
  console.log(gameCompaniesArr)
  return await Game_Company.bulkCreate(gameCompaniesArr);
}

async function removePublisher(gameCompany) {
  console.log(gameCompany)
  return await Game_Company.destroy({
    where: {
      GameId: gameCompany.GameId,
      CompanyId: gameCompany.CompanyId,
      type: 'PUBLISHER'
    }
  });
}

async function addPlayableCharacters(gameCharactersArr) {
  console.log(gameCharactersArr)
  return await Game_Character.bulkCreate(gameCharactersArr);
}

async function removePlayableCharacter(gameCharacter) {
  console.log(gameCharacter)
  return await Game_Character.destroy({
    where: {
      GameId: gameCharacter.GameId,
      CharacterId: gameCharacter.CharacterId,
      type: 'PLAYABLE'
    }
  });
}

async function addSecondaryCharacters(gameCharactersArr) {
  console.log(gameCharactersArr)
  return await Game_Character.bulkCreate(gameCharactersArr);
}

async function removeSecondaryCharacter(gameCharacter) {
  console.log(gameCharacter)
  return await Game_Character.destroy({
    where: {
      GameId: gameCharacter.GameId,
      CharacterId: gameCharacter.CharacterId,
      type: 'SECONDARY'
    }
  });
}

async function addAntagonistCharacters(gameCharactersArr) {
  console.log(gameCharactersArr)
  return await Game_Character.bulkCreate(gameCharactersArr);
}

async function removeAntagonistCharacter(gameCharacter) {
  console.log(gameCharacter)
  return await Game_Character.destroy({
    where: {
      GameId: gameCharacter.GameId,
      CharacterId: gameCharacter.CharacterId,
      type: 'ANTAGONIST'
    }
  });
}

async function addVillainCharacters(gameCharactersArr) {
  console.log(gameCharactersArr)
  return await Game_Character.bulkCreate(gameCharactersArr);
}

async function removeVillainCharacter(gameCharacter) {
  console.log(gameCharacter)
  return await Game_Character.destroy({
    where: {
      GameId: gameCharacter.GameId,
      CharacterId: gameCharacter.CharacterId,
      type: 'VILLAIN'
    }
  });
}

async function addAwards(gameAwardsArr) {
  console.log(gameAwardsArr)
  return await Game_Award.bulkCreate(gameAwardsArr);
}

async function removeAward(gameAward) {
  console.log(gameAward)
  return await Game_Award.destroy({
    where: {
      GameId: gameAward.GameId,
      AwardCategoryId: gameAward.AwardCategoryId
    }
  });
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
  getSearchGames,
  getGame,
  createGame,
  updateGame,
  deleteGame,
  addGenres,
  removeGenre,
  addThemes,
  removeTheme,
  addDirectors,
  removeDirector,
  addPlatforms,
  removePlatform,
  addDevelopers,
  removeDeveloper,
  addPublishers,
  removePublisher,
  addPlayableCharacters,
  removePlayableCharacter,
  addSecondaryCharacters,
  removeSecondaryCharacter,
  addAntagonistCharacters,
  removeAntagonistCharacter,
  addVillainCharacters,
  removeVillainCharacter,
  addAwards,
  removeAward,
  updateOwnedGame,
  updatePersonalStatus
};