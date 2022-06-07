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
    const { keyword } = request.params;
    connection.query(`
      SELECT 
      voo.codigo, voo.data, voo.registro, cpf_piloto, cpf_comissario,
      voo.codigo_itinerario, tempo_duracao_minutos,
      aeroporto_origem, aeroporto_destino, codigo_itinerario
      FROM voo, itinerario, piloto, aviao, comissariobordo, trabalhaem
      WHERE voo.codigo = $1
      AND itinerario.codigo = voo.codigo_itinerario
      AND piloto.cpf = voo.cpf_piloto
      AND aviao.registro = voo.registro
      AND trabalhaem.cpf_comissario = comissariobordo.cpf
      AND voo.codigo = trabalhaem.codigo_voo
    `, [keyword], 
    (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }
}

module.exports = new VoosController();