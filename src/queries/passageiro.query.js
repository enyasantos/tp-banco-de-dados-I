const INSERIR_PASSAGEIRO_QUERY = `
            INSERT INTO passageiro (cpf, nome, sexo, rg, data_nascimento)
            VALUES ($1, $2, $3, $4, $5) RETURNING *
        `;

const LISTAR_PASSAGEIROS_QUERY = "SELECT * FROM passageiro";

module.exports = { INSERIR_PASSAGEIRO_QUERY, LISTAR_PASSAGEIROS_QUERY };
