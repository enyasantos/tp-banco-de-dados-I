const connection = require('../database/connection');

class PassagemControler {
  async buscarTodasPassagens(request, response) {
    connection.query('SELECT * FROM passagem', (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }

  async buscarPassagem(request, response) {
    connection.query('SELECT * FROM passagem', (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }
}

module.exports = new PassagemControler();