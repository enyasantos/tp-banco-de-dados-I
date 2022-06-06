const { Router } = require("express");
const PassageiroController = require("./controllers/Passageiro.controller");
const PagamentoController = require("./controllers/Pagamento.controller");

const routes = Router();

routes.get("/passageiros", PassageiroController.index);
routes.post("/passageiro", PassageiroController.store);
routes.get("/pagamentos", PagamentoController.index);
routes.post("/pagamento", PagamentoController.store);

module.exports = routes;
