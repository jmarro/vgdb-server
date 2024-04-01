const services = require('../services/people.service');

async function getAllPeople(req, res) {
  try {
    let people;
    if (req.query && req.query.name) {
      console.log('here',req.query.name)
      people = await services.getSearchPeople(req.query.name);
    } else { 
      people = await services.getAllPeople();
    }
    res.json(people);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function getPerson(req, res) {
  try {
    const id = req.params.id_person;
    const person = await services.getPerson(id);
    res.json(person);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function createPerson(req, res) {
  try {
    console.log('request', req);
    console.log('person', req.body);
    const response = await services.createPerson(req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function updatePerson(req, res) {
  try {
    const person_id = req.params.id_person;
    console.log('request', req);
    console.log('update person', req.body);
    const response = await services.updatePerson(parseInt(person_id), req.body);
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

async function deletePerson(req, res) {
  try {
    const person_id = req.params.id_person;
    console.log('delete', req);
    const response = await services.deletePerson(parseInt(person_id));
    res.json(response);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
};

module.exports = {
  getAllPeople,
  getPerson,
  createPerson,
  updatePerson,
  deletePerson
};