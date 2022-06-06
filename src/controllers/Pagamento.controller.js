const connection = require("../database/connection");
const {
  INSERIR_PAGAMENTO_QUERY,
  LISTAR_PAGAMENTOS_QUERY,
} = require("../queries/pagamento.query");
const { handleQueryError } = require("./utils");

class PagamentoController {
  async index(request, response) {
    connection
      .query(LISTAR_PAGAMENTOS_QUERY)
      .then((results) => response.status(200).json(results.rows))
      .catch((error) => handleQueryError(response, error));
  }

  async store(request, response) {
    const { codigo, valor } = request.body;
    connection
      .query(INSERIR_PAGAMENTO_QUERY, [codigo, valor])
      .then((results) => response.status(201).json(results.rows[0]))
      .catch((error) => handleQueryError(response, error));
  }
}

module.exports = new PagamentoController();
