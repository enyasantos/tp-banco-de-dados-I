const { Router } = require("express");
const PassageiroController = require("./controllers/Passageiro.controller");
const PassagemController = require("./controllers/Passagem.controller");
const VoosController = require("./controllers/Voo.controller");
const PagamentoController = require("./controllers/Pagamento.controller");
const PassagemController = require("./controllers/Passagem.controller");

const routes = Router();

//endpoints de passageiros
routes.get("/passageiros", PassageiroController.index);
routes.post("/passageiro", PassageiroController.store);
routes.post("/buscar-passageiro", PassageiroController.buscarPassageiro);
//endpoints de pagamentos
routes.get("/pagamentos", PagamentoController.index);
routes.post("/pagamento", PagamentoController.store);
//endpoints de passagens
routes.get("/passagens", PassagemController.index);
routes.post("/passagem", PassagemController.store);
routes.post("/buscar-passagem", PassagemController.buscarPassagem);
//endpoints de voos
routes.post("/voos", VoosController.buscarTodosVoos);
routes.post("/buscar-voo", VoosController.buscarVoo);

module.exports = routes;
