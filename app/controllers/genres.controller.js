const services = require('../services/genres.service');

async function getAllGenres(req, res) {
  try {
    let genres;
    if (req.query && req.query.name) {
      console.log('here',req.query.name)
      genres = await services.getSearchGenres(req.query.name);
    } else { 
      genres = await services.getAllGenres();
    }
    res.json(genres);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function getGenre(req, res) {
  try {
    const id = req.params.id_genre;
    const genre = await services.getGenre(id);
    res.json(genre);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createGenre(req, res) {
  try {
    console.log('request', req);
    console.log('genre', req.body);
    const response = await services.createGenre(req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function updateGenre(req, res) {
  try {
    const genre_id = req.params.id_genre;
    console.log('request', req);
    console.log('update genre', req.body);
    const response = await services.updateGenre(parseInt(genre_id), req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function deleteGenre(req, res) {
  try {
    const genre_id = req.params.id_genre;
    console.log('delete', req);
    const response = await services.deleteGenre(parseInt(genre_id));
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};


module.exports = {
  getAllGenres,
  getGenre,
  createGenre,
  updateGenre,
  deleteGenre
};