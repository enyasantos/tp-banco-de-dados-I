const INSERIR_TELEFONE_QUERY = `
        INSERT INTO telefonepassageiro (cpf_passageiro, telefone)
        VALUES ($1, $2) RETURNING *
    `;

module.exports = { INSERIR_TELEFONE_QUERY };
