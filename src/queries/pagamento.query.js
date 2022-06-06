const INSERIR_PAGAMENTO_QUERY = `
            INSERT INTO pagamento (codigo, valor)
            VALUES ($1, $2) RETURNING *
        `;

const LISTAR_PAGAMENTOS_QUERY = "SELECT * FROM pagamento";

module.exports = { INSERIR_PAGAMENTO_QUERY, LISTAR_PAGAMENTOS_QUERY };
