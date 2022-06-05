const connection = require("../database/connection");
const { INSERIR_PASSSAGEIRO } = require("../queries/passageiro.query");
const { handleQueryError } = require("./utils");

class PassageiroController {
  async index(request, response) {
    connection
      .query("SELECT * FROM passageiro")
      .then((results) => response.status(200).json(results.rows))
      .catch((error) => handleQueryError(response, error));
  }

  async store(request, response) {
    const { cpf, nome, sexo, rg, data_nascimento } = request.body;
    connection
      .query(INSERIR_PASSSAGEIRO_QUERY, [cpf, nome, sexo, rg, data_nascimento])
      .then((results) => response.status(201).json(results.rows[0]))
      .catch((error) => handleQueryError(response, error));
  }
}

module.exports = new PassageiroController();
