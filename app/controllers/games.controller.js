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

module.exports = {
  getAllGames,
  getGame
};