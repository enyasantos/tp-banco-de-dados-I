const INSERIR_PASSAGEM_QUERY = `
            INSERT INTO passagem (codigo, data_emissao, assento, codigo_pagamento, cpf_passageiro)
            VALUES ($1, $2, $3, $4, $5) RETURNING *
        `;

const LISTAR_PASSAGENS_QUERY = "SELECT * FROM passagem";

module.exports = { INSERIR_PASSAGEM_QUERY, LISTAR_PASSAGENS_QUERY };
