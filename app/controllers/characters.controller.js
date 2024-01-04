const services = require('../services/characters.service');

async function getAlCharacters(req, res) {
  try {
		const characters = await services.getAlCharacters();
    res.json(characters);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function getCharacter(req, res) {
  try {
    const id = req.params.id_character;
    const character = await services.getCharacter(id);
    res.json(character);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createCharacter(req, res) {
  try {
    console.log('request', req);
    console.log('character', req.body);
    const response = await services.createCharacter(req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function addCreators(req, res) {
  try {
    const character_id = req.params.id_character;
    console.log('request', req);
    console.log('persons', req.body);
    characterCreatorArr = req.body.map(creatorId => {
      return {
        CharacterId: parseInt(character_id),
        PersonId: creatorId
      }
    });
    const response = await services.addCreators(characterCreatorArr);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

module.exports = {
  getAlCharacters,
  getCharacter,
  createCharacter,
  addCreators
};