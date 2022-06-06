const connection = require('../database/connection');

class PassageiroController {
    async buscarTodosPassageiros(request, response) {
        connection.query('SELECT * FROM passageiro')
            .then((results) => response.status(200).json(results.rows))
            .catch(error => response.status(500).json({ error: 'Error executing query ' + error.stack }));
    }
    async buscarPassageiro(request, response) {
        const { 
          cpf,
          nome
        } = request.body;
        connection.query('SELECT * FROM passageiro WHERE passageiro.cpf = $1 OR passageiro.nome = $2', [cpf, nome], (error, results) => {
          if (error) {
            throw error
          }
          response.status(200).json(results.rows)
        })
      }

    /*async store(request, response) {
        const { 
            cpf,
            nome,
            sexo, 
            rg,
            data_nascimento
        } = request.body;
        connection.query(`
            INSERT INTO passageiro (cpf, nome, sexo, rg, data_nascimento)
            VALUES ($1, $2, $3, $4, $5) RETURNING *
        `, [cpf, nome, sexo, rg, data_nascimento])
        .then((results) => response.status(201).json(results.rows[0]))
        .catch(error => response.status(500).json({error: 'Error executing query ' + error.stack}))
    }*/
}

module.exports = new PassageiroController();