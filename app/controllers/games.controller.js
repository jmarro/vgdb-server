const services = require('../services/games.service');

async function getAllGames(req, res) {
  try {
		const games = await services.getAllGames();
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
    const response = await services.addGenres(gameThemesArr);
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