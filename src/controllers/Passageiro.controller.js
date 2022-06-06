const connection = require("../database/connection");
const {
  INSERIR_PASSAGEIRO_QUERY,
  LISTAR_PASSAGEIROS_QUERY,
} = require("../queries/passageiro.query");
const { handleQueryError } = require("./utils");
class PassageiroController {
  async index(request, response) {
    connection
      .query(LISTAR_PASSAGEIROS_QUERY)
      .then((results) => response.status(200).json(results.rows))
      .catch((error) => handleQueryError(response, error));
  }

  async store(request, response) {
    const { cpf, nome, sexo, rg, data_nascimento } = request.body;
    connection
      .query(INSERIR_PASSAGEIRO_QUERY, [cpf, nome, sexo, rg, data_nascimento])
      .then((results) => response.status(201).json(results.rows[0]))
      .catch((error) => handleQueryError(response, error));
  }

  async buscarPassageiro(request, response) {
    const { cpf, nome } = request.body;
    connection.query(
      "SELECT * FROM passageiro WHERE passageiro.cpf = $1 OR passageiro.nome = $2",
      [cpf, nome],
      (error, results) => {
        if (error) {
          throw error;
        }
        response.status(200).json(results.rows);
      }
    );
  }
}

module.exports = new PassageiroController();
