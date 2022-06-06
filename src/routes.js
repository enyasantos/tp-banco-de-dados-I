const { Router } = require('express');
const PassageiroController = require('./controllers/Passageiro.controller');
const PassagemController = require('./controllers/Passagem.controller');

const routes = Router();

routes.get('/passageiros', PassageiroController.buscarTodosPassageiros)
routes.post('/buscar-passageiro', PassageiroController.buscarPassageiro)
routes.post('/passagens', PassagemController.buscarTodasPassagens)
routes.post('/buscar-passagem', PassagemController.buscarPassagem)



routes.post('/passageiro',  PassageiroController.store)



module.exports = routes;