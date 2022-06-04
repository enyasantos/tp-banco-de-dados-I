const { Router } = require('express');
const PassageiroController = require('./controllers/Passageiro.controller');

const routes = Router();

routes.get('/passageiros', PassageiroController.index)
routes.post('/passageiro',  PassageiroController.store)

module.exports = routes;