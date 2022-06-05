const INSERIR_PASSSAGEIRO_QUERY = `
            INSERT INTO passageiro (cpf, nome, sexo, rg, data_nascimento)
            VALUES ($1, $2, $3, $4, $5) RETURNING *
        `;

module.exports = { INSERIR_PASSSAGEIRO_QUERY };
