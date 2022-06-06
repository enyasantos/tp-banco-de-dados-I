const INSERIR_BAGAGEM_QUERY = `
            INSERT INTO bagagem (codigo, codigo_passagem, peso, altura, largura)
            VALUES ($1, $2, $3, $4, $5) RETURNING *
        `;

const LISTAR_BAGAGENS_QUERY = "SELECT * FROM bagagem";

module.exports = { INSERIR_BAGAGEM_QUERY, LISTAR_BAGAGENS_QUERY };
