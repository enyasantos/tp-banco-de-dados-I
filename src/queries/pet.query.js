const INSERIR_PET_QUERY = `
            INSERT INTO pet (codigo_passagem, nome, peso, porte, cor, nome_raca)
            VALUES ($1, $2, $3, $4, $5, $6) RETURNING *
        `;

const LISTAR_PETS_QUERY = "SELECT * FROM pet";

module.exports = { INSERIR_PET_QUERY, LISTAR_PETS_QUERY };
