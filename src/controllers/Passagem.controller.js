const connection = require("../database/connection");
const {
  INSERIR_PASSAGEM_QUERY,
  LISTAR_PASSAGENS_QUERY,
} = require("../queries/passagem.query");
const { handleQueryError } = require("./utils");
class PassagemControler {
  async index(request, response) {
    connection
      .query(LISTAR_PASSAGENS_QUERY)
      .then((results) => response.status(200).json(results.rows))
      .catch((error) => handleQueryError(response, error));
  }

  async store(request, response) {
    const { codigo, data_emissao, assento, codigo_pagamento, cpf_passageiro } =
      request.body;
    connection
      .query(INSERIR_PASSAGEM_QUERY, [
        codigo,
        data_emissao,
        assento,
        codigo_pagamento,
        cpf_passageiro,
      ])
      .then((results) => response.status(201).json(results.rows[0]))
      .catch((error) => handleQueryError(response, error));
  }

  async buscarPassagem(request, response) {
    const {codigo, cpf_passageiro} = request.body;
    connection.query(
      `SELECT * FROM passagem, bagagem, pet
      WHERE passagem.codigo = $1 OR passagem.cpf_passageiro = $2 
      AND bagagem.codigo_passagem = passagem.codigo 
      AND pet.codigo_passagem = passagem.codigo`,
      [codigo, cpf_passageiro],
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    });
  }
}

module.exports = new PassagemControler();
