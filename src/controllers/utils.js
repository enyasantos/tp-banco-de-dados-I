const handleQueryError = (response, error) =>
  response.status(500).json({ error: "Error executing query " + error.stack });

module.exports = { handleQueryError };
