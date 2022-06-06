const connection = require("../database/connection");
const {
  INSERIR_PET_QUERY,
  LISTAR_PETS_QUERY,
} = require("../queries/pet.query");
const { handleQueryError } = require("./utils");

class PetController {
  async index(request, response) {
    connection
      .query(LISTAR_PETS_QUERY)
      .then((results) => response.status(200).json(results.rows))
      .catch((error) => handleQueryError(response, error));
  }

  async store(request, response) {
    const { codigo_passagem, nome, peso, porte, cor, nome_raca } = request.body;
    connection
      .query(INSERIR_PET_QUERY, [
        codigo_passagem,
        nome,
        peso,
        porte,
        cor,
        nome_raca,
      ])
      .then((results) => response.status(201).json(results.rows[0]))
      .catch((error) => handleQueryError(response, error));
  }
}

module.exports = new PetController();
