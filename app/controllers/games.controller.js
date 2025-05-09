const services = require('../services/games.service');

async function getAllGames(req, res) {
  try {
    let games;
    let page = req.query && req.query.page ? req.query.page : 0;
    let orderBy = req.query && req.query.orderBy ? req.query.orderBy : 'score';
    if (req.query && req.query.name) {
      console.log('here',req.query.name)
      games = await services.getSearchGames(req.query.name, page);
    } else { 
      games = await services.getAllGames(page, orderBy);
    }
    res.json(games);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function getGame(req, res) {
  try {
    const id = req.params.id_game;
    const game = await services.getGame(id);
    res.json(game);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createGame(req, res) {
  try {
    console.log('request', req);
    console.log('game', req.body);
    const response = await services.createGame(req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function updateGame(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('update game', req.body);
    const response = await services.updateGame(parseInt(game_id), req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function deleteGame(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('delete', req);
    const response = await services.deleteGame(parseInt(game_id));
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addGenres(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('genres', req.body);
    const gameGenresArr = req.body.map(genreId => {
      return {
        GameId: parseInt(game_id),
        GenreId: genreId
      }
    });
    const response = await services.addGenres(gameGenresArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeGenre(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      GameId: parseInt(game_id),
      GenreId: req.body.genreId
    }
    console.log('request', req);
    console.log('genre', req.body);
    const response = await services.removeGenre(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addThemes(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('themes', req.body);
    const gameThemesArr = req.body.map(themeId => {
      return {
        GameId: parseInt(game_id),
        ThemeId: themeId
      }
    });
    const response = await services.addThemes(gameThemesArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeTheme(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      GameId: parseInt(game_id),
      ThemeId: req.body.themeId
    }
    console.log('request', req);
    console.log('theme', req.body);
    const response = await services.removeTheme(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addDirectors(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('persons', req.body);
    const gameDirectorArr = req.body.map(directorId => {
      return {
        GameId: parseInt(game_id),
        PersonId: directorId
      }
    });
    const response = await services.addDirectors(gameDirectorArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeDirector(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      GameId: parseInt(game_id),
      PersonId: req.body.directorId
    }
    console.log('request', req);
    console.log('director', req.body);
    const response = await services.removeDirector(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addPlatforms(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('platforms', req.body);
    const gamePlatformsArr = req.body.map(platformId => {
      return {
        GameId: parseInt(game_id),
        PlatformId: platformId
      }
    });
    const response = await services.addPlatforms(gamePlatformsArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removePlatform(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      GameId: parseInt(game_id),
      PersonId: req.body.platformId
    }
    console.log('request', req);
    console.log('platform', req.body);
    const response = await services.removePlatform(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addDevelopers(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('companies', req.body);
    const gameCompaniesArr = req.body.map(companyId => {
      return {
        GameId: parseInt(game_id),
        CompanyId: companyId,
        type: 'DEVELOPER'
      }
    });
    const response = await services.addDevelopers(gameCompaniesArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeDeveloper(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      GameId: parseInt(game_id),
      CompanyId: req.body.companyId
    }
    console.log('request', req);
    console.log('company', req.body);
    const response = await services.removeDeveloper(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addPublishers(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('companies', req.body);
    const gameCompaniesArr = req.body.map(companyId => {
      return {
        GameId: parseInt(game_id),
        CompanyId: companyId,
        type: 'PUBLISHER'
      }
    });
    const response = await services.addPublishers(gameCompaniesArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removePublisher(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      GameId: parseInt(game_id),
      CompanyId: req.body.companyId
    }
    console.log('request', req);
    console.log('company', req.body);
    const response = await services.removePublisher(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addSecondaryCharacters(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('companies', req.body);
    const gameCharactersArr = req.body.map(characterId => {
      return {
        GameId: parseInt(game_id),
        CharacterId: characterId,
        type: 'SECONDARY'
      }
    });
    const response = await services.addSecondaryCharacters(gameCharactersArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeSecondaryCharacter(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      GameId: parseInt(game_id),
      CharacterId: req.body.characterId
    }
    console.log('request', req);
    console.log('char', req.body);
    const response = await services.removeSecondaryCharacter(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addPlayableCharacters(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('companies', req.body);
    const gameCharactersArr = req.body.map(characterId => {
      return {
        GameId: parseInt(game_id),
        CharacterId: characterId,
        type: 'PLAYABLE'
      }
    });
    const response = await services.addPlayableCharacters(gameCharactersArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removePlayableCharacter(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      GameId: parseInt(game_id),
      CharacterId: req.body.characterId
    }
    console.log('request', req);
    console.log('char', req.body);
    const response = await services.removePlayableCharacter(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addAntagonistCharacters(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('companies', req.body);
    const gameCharactersArr = req.body.map(characterId => {
      return {
        GameId: parseInt(game_id),
        CharacterId: characterId,
        type: 'ANTAGONIST'
      }
    });
    const response = await services.addAntagonistCharacters(gameCharactersArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeAntagonistCharacter(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      GameId: parseInt(game_id),
      CharacterId: req.body.characterId
    }
    console.log('request', req);
    console.log('char', req.body);
    const response = await services.removeAntagonistCharacter(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addVillainCharacters(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('companies', req.body);
    const gameCharactersArr = req.body.map(characterId => {
      return {
        GameId: parseInt(game_id),
        CharacterId: characterId,
        type: 'VILLAIN'
      }
    });
    const response = await services.addVillainCharacters(gameCharactersArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeVillainCharacter(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      GameId: parseInt(game_id),
      CharacterId: req.body.characterId
    }
    console.log('request', req);
    console.log('char', req.body);
    const response = await services.removeVillainCharacter(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addCrossoverCharacters(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('companies', req.body);
    const gameCharactersArr = req.body.map(characterId => {
      return {
        GameId: parseInt(game_id),
        CharacterId: characterId,
        type: 'CROSSOVER'
      }
    });
    const response = await services.addCrossoverCharacters(gameCharactersArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeCrossoverCharacter(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      GameId: parseInt(game_id),
      CharacterId: req.body.characterId
    }
    console.log('request', req);
    console.log('char', req.body);
    const response = await services.removeCrossoverCharacter(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addGameToCollection(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('gmaes', req.body);
    const gameGamesArr = req.body.map(gameId => {
      return {
        subGameId: parseInt(game_id),
        parentGameId: gameId,
        type: 'COLLECTION'
      }
    });
    const response = await services.addGameRelation(gameGamesArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeGameFromCollection(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      subGameId: parseInt(game_id),
      parentGameId: req.body.gameId
    }
    console.log('request', req);
    console.log('char', req.body);
    const response = await services.removeGameFromCollection(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addGameRemaster(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('gmaes', req.body);
    const gameGamesArr = req.body.map(gameId => {
      return {
        subGameId: parseInt(game_id),
        parentGameId: gameId,
        type: 'REMASTER'
      }
    });
    const response = await services.addGameRelation(gameGamesArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeGameRemaster(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      subGameId: parseInt(game_id),
      parentGameId: req.body.gameId
    }
    console.log('request', req);
    console.log('char', req.body);
    const response = await services.removeGameRemaster(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addGameRemake(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('gmaes', req.body);
    const gameGamesArr = req.body.map(gameId => {
      return {
        subGameId: parseInt(game_id),
        parentGameId: gameId,
        type: 'REMAKE'
      }
    });
    const response = await services.addGameRelation(gameGamesArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeGameRemake(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      subGameId: parseInt(game_id),
      parentGameId: req.body.gameId
    }
    console.log('request', req);
    console.log('char', req.body);
    const response = await services.removeGameRemake(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addGameSpinoff(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('gmaes', req.body);
    const gameGamesArr = req.body.map(gameId => {
      return {
        subGameId: parseInt(game_id),
        parentGameId: gameId,
        type: 'SPINOFF'
      }
    });
    const response = await services.addGameRelation(gameGamesArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeGameSpinoff(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      subGameId: parseInt(game_id),
      parentGameId: req.body.gameId
    }
    console.log('request', req);
    console.log('char', req.body);
    const response = await services.removeGameSpinoff(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addAwards(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('awards', req.body);
    const gameAwardsArr = req.body.map(award => {
      return {
        GameId: parseInt(game_id),
        AwardCategoryId: award.AwardCategoryId,
        year: award.year,
        result: award.result
      }
    });
    const response = await services.addAwards(gameAwardsArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function removeAward(req, res) {
  try {
    const game_id = req.params.id_game;
    toRemove = {
      GameId: parseInt(game_id),
      AwardCategoryId: req.body.awardCategoryId
    }
    console.log('request', req);
    console.log('char', req.body);
    const response = await services.removeAward(toRemove);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function updateOwnedGame(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('owned', req.body.owned);
    const response = await services.updateOwnedGame(parseInt(game_id), req.body.owned);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function updatePersonalStatus(req, res) {
  try {
    const game_id = req.params.id_game;
    console.log('request', req);
    console.log('personal_status', req.body.personal_status);
    const response = await services.updatePersonalStatus(parseInt(game_id), req.body.personal_status);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

module.exports = {
  getAllGames,
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
  addCrossoverCharacters,
  removeCrossoverCharacter,
  addAwards,
  removeAward,
  updateOwnedGame,
  updatePersonalStatus,
  addGameRemake,
  addGameToCollection,
  addGameRemaster,
  addGameSpinoff,
  removeGameFromCollection,
  removeGameRemake,
  removeGameRemaster,
  removeGameSpinoff
};