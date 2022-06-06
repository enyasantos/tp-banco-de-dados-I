const { Router } = require("express");
const PassageiroController = require("./controllers/Passageiro.controller");
const PassagemController = require("./controllers/Passagem.controller");
const PagamentoController = require("./controllers/Pagamento.controller");
const BagagemController = require("./controllers/Bagagem.controller");
const VoosController = require("./controllers/Voo.controller");

const routes = Router();

//endpoints de passageiros
routes.get("/passageiros", PassageiroController.index);
routes.post("/passageiro", PassageiroController.store);
routes.get("/buscar-passageiro", PassageiroController.buscarPassageiro);
//endpoints de pagamentos
routes.get("/pagamentos", PagamentoController.index);
routes.post("/pagamento", PagamentoController.store);
//endpoints de passagens
routes.get("/passagens", PassagemController.index);
routes.post("/passagem", PassagemController.store);
routes.get("/buscar-passagem", PassagemController.buscarPassagem);
//endpoints de voos
routes.get("/voos", VoosController.buscarTodosVoos);
routes.get("/buscar-voo", VoosController.buscarVoo);
//endpoints de bagagem
routes.get("/bagagens", BagagemController.index);
routes.post("/bagagem", BagagemController.store);

module.exports = routes;
