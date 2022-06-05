CREATE TABLE Tipo(
  modelo varchar(25) NOT NULL,
  capacidade INT,
  PRIMARY KEY(modelo)
);

CREATE TABLE Aviao(
  registro varchar(25) NOT NULL,
  cor varchar(25),
  ano_fabricacao INT,
  modelo varchar(25),
  PRIMARY KEY(registro)
);

CREATE TABLE Voo(
  codigo varchar(20) NOT NULL,
  data DATE,
  registro varchar(25),
  cpf_piloto char(11),
  codigo_itinerario INT,
  PRIMARY KEY(codigo)
);

CREATE TABLE Pagamento(
  codigo INT NOT NULL,
  valor REAL,
  PRIMARY KEY(codigo)
);

CREATE TABLE Dinheiro(
  codigo_pagamento INT NOT NULL,
  valor_pago REAL,
  troco REAL,
  PRIMARY KEY(codigo_pagamento)
);

CREATE TABLE CartaoCredito(
  codigo_pagamento INT NOT NULL,
  numero_cartao INT,
  bandeira varchar(30),
  data_expiracao date,
  codigo_seguranca INT,
  PRIMARY KEY(codigo_pagamento)
);

CREATE TABLE Debito(
  codigo_pagamento INT NOT NULL,
  agencia INT,
  conta INT,
  PRIMARY KEY(codigo_pagamento)
);

CREATE TABLE Passageiro(
  cpf char(11) NOT NULL,
  nome varchar(50),
  sexo char(13),
  rg char(10),
  data_nascimento DATE,
  PRIMARY KEY(cpf)
);

CREATE TABLE TelefonePassageiro(
  cpf_passageiro char(11) NOT NULL,
  telefone INT,
  PRIMARY KEY(cpf_passageiro)
);

CREATE TABLE Piloto(
  cpf char(11) NOT NULL,
  rg varchar(13) NOT NULL,
  salario REAL NOT NULL,
  nome varchar(50) NOT NULL,
  sexo varchar(13) NOT NULL,
  carga_horaria INT NOT NULL,
  data_nascimento DATE NOT NULL,
  numero_licenca varchar(6) NOT NULL,
  PRIMARY KEY(cpf)
);

CREATE TABLE ComissarioBordo(
  cpf char(11) NOT NULL,
  rg varchar(13) NOT NULL,
  salario REAL NOT NULL,
  nome varchar(50) NOT NULL,
  sexo varchar(13) NOT NULL,
  carga_horaria INT NOT NULL,
  data_nascimento DATE NOT NULL,
  cht varchar(10) NOT NULL,
  PRIMARY KEY(cpf)
);

CREATE TABLE TrabalhaEm(
  cpf_comissario char(11) NOT NULL,
  codigo_voo varchar(20) NOT NULL,
  PRIMARY KEY(cpf_comissario, codigo_voo)
);

CREATE TABLE Passagem(
  codigo char(13) NOT NULL,
  data_emissao DATE NOT NULL,
  assento INT NOT NULL,
  codigo_pagamento INT NOT NULL,
  cpf_passageiro char(11) NOT NULL,
  PRIMARY KEY(codigo)
);

CREATE TABLE Raca(
  nome varchar(50) NOT NULL,
  especie varchar(50) NOT NULL,
  PRIMARY KEY(nome)
);

CREATE TABLE Pet(
  codigo_passagem char(13) NOT NULL,
  nome varchar(50) NOT NULL,
  peso REAL NOT NULL,
  porte varchar(25) NOT NULL,
  cor varchar(25),
  nome_raca varchar(50) NOT NULL,
  PRIMARY KEY(codigo_passagem, nome)
);

CREATE TABLE Bagagem(
  codigo char(13) NOT NULL, /*Dominio escolhido arbitrariamente*/
  codigo_passagem char(13) NOT NULL, 
  peso REAL NOT NULL,
  largura REAL NOT NULL,
  altura REAL NOT NULL,
  PRIMARY KEY(codigo)
);

CREATE TABLE Aeroporto(
  nome varchar(50) NOT NULL,
  numero INT NOT NULL, 
  cidade varchar(50) NOT NULL,
  logradouro varchar(50) NOT NULL,
  estado char(2) NOT NULL,
  pais varchar(50) NOT NULL,
  codigo_postal char(8) NOT NULL,
  PRIMARY KEY(nome)
);

CREATE TABLE Itinerario(
  codigo INT NOT NULL, 
  tempo_duracao_minutos INT NOT NULL, 
  aeroporto_origem varchar(50) NOT NULL,
  aeroporto_destino varchar(50) NOT NULL,
  PRIMARY KEY(codigo)
);

ALTER TABLE Aviao ADD FOREIGN KEY (modelo) REFERENCES Tipo(modelo);

ALTER TABLE Voo ADD FOREIGN KEY (registro) REFERENCES Aviao(registro);

ALTER TABLE Voo ADD FOREIGN KEY (cpf_piloto) REFERENCES Piloto(cpf);

ALTER TABLE Voo ADD FOREIGN KEY (codigo_itinerario) REFERENCES Itinerario(codigo);

ALTER TABLE Dinheiro ADD FOREIGN KEY (codigo_pagamento) REFERENCES Pagamento(codigo) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE CartaoCredito ADD FOREIGN KEY (codigo_pagamento) REFERENCES Pagamento(codigo) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Debito 
ADD FOREIGN KEY (codigo_pagamento) REFERENCES Pagamento(codigo) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE TelefonePassageiro ADD FOREIGN KEY (cpf_passageiro) REFERENCES Passageiro(cpf) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE TrabalhaEm ADD FOREIGN KEY (cpf_comissario) REFERENCES ComissarioBordo(cpf) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE TrabalhaEm ADD FOREIGN KEY (codigo_voo) REFERENCES Voo(codigo) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Passagem ADD FOREIGN KEY (codigo_pagamento) REFERENCES Pagamento(codigo);

ALTER TABLE Passagem ADD FOREIGN KEY (cpf_passageiro) REFERENCES Passageiro(cpf);

ALTER TABLE Pet ADD FOREIGN KEY (codigo_passagem) REFERENCES Passagem(codigo);

ALTER TABLE Pet ADD FOREIGN KEY (nome_raca) REFERENCES Raca(nome);

ALTER TABLE Bagagem ADD FOREIGN KEY (codigo_passagem) REFERENCES Passagem(codigo);

ALTER TABLE Itinerario ADD FOREIGN KEY (aeroporto_origem) REFERENCES Aeroporto(nome);

ALTER TABLE Itinerario ADD FOREIGN KEY (aeroporto_destino) REFERENCES Aeroporto(nome);
