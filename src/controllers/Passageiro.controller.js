const connection = require("../database/connection");
const {
  INSERIR_PASSAGEIRO_QUERY,
  LISTAR_PASSAGEIROS_QUERY,
} = require("../queries/passageiro.query");
const {
  INSERIR_TELEFONE_QUERY,
} = require("../queries/telefonepassageiro.query")
const { handleQueryError } = require("./utils");
class PassageiroController {
  async index(request, response) {
    connection
      .query(LISTAR_PASSAGEIROS_QUERY)
      .then((results) => response.status(200).json(results.rows))
      .catch((error) => handleQueryError(response, error));
  }

  async store(request, response) {
    const { cpf, nome, sexo, rg, data_nascimento, telefones } = request.body;
    console.log(telefones)
    connection
      .query(INSERIR_PASSAGEIRO_QUERY, [cpf, nome, sexo, rg, data_nascimento])
      .then((results) => {
        if(telefones.length > 0) {
          const result2 = telefones.map((telefone) => {
            console.log(results.rows[0].cpf, telefone)
            return connection.query(INSERIR_TELEFONE_QUERY, [results.rows[0].cpf, telefone])
          })
          response.status(201).json({ passageiro: results.rows[0], telefones: result2})
        } else {
          response.status(201).json({ passageiro: results.rows[0] })
        }
      })
      .catch((error) => {
        console.log(error)
        handleQueryError(response, error)
      });
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

  async deletePassageiro(request, response) {
    const id = parseInt(request.params.id)
  
    connection.query('DELETE FROM passageiro WHERE id = $1', [id], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows);
    })
  }
}

module.exports = new PassageiroController();
