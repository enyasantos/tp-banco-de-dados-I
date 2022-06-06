const connection = require("../database/connection");
const {
  INSERIR_BAGAGEM_QUERY,
  LISTAR_BAGAGENS_QUERY,
} = require("../queries/bagagem.query");
const { handleQueryError } = require("./utils");

class BagagemController {
  async index(request, response) {
    connection
      .query(LISTAR_BAGAGENS_QUERY)
      .then((results) => response.status(200).json(results.rows))
      .catch((error) => handleQueryError(response, error));
  }

  async store(request, response) {
    const { codigo, codigo_passagem, peso, altura, largura } = request.body;
    connection
      .query(INSERIR_BAGAGEM_QUERY, [
        codigo,
        codigo_passagem,
        peso,
        altura,
        largura,
      ])
      .then((results) => response.status(201).json(results.rows[0]))
      .catch((error) => handleQueryError(response, error));
  }
}

module.exports = new BagagemController();
