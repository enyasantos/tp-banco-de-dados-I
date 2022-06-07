const connection = require('../database/connection');

class VoosController {
  async buscarTodosVoos(request, response) {
    connection.query('SELECT * FROM voo, itinerario, piloto, aviao, comissariobordo, trabalhaem', (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }

  async buscarVoo(request, response) {
    const {codigo, data} = request.body;
    connection.query(`
      SELECT * FROM voo, itinerario, piloto, aviao, comissariobordo, trabalhaem
      WHERE (voo.data = $2  OR voo.codigo = $1) 
      AND itinerario.codigo = voo.codigo_itinerario
      AND piloto.cpf = voo.cpf_piloto
      AND aviao.registro = voo.registro
      AND trabalhaem.cpf_comissario = comissariobordo.cpf
      AND voo.codigo = trabalhaem.codigo_voo
    `, [codigo, data], 
    (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }
}

module.exports = new VoosController();