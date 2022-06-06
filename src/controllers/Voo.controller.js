const connection = require('../database/connection');

class VoosController {
  async buscarTodosVoos(request, response) {
    connection.query('SELECT * FROM voo', (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }

  async buscarVoo(request, response) {
    connection.query('SELECT * FROM voo WHERE passagem.codigo = $1 OR passagem.passageiro = $2', (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }
}

module.exports = new VoosController();