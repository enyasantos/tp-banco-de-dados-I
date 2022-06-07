CREATE TABLE Tipo(
  modelo varchar(25) NOT NULL UNIQUE,
  capacidade INT,
  PRIMARY KEY(modelo)
);

CREATE TABLE Aviao(
  registro varchar(25) NOT NULL UNIQUE,
  cor varchar(25),
  ano_fabricacao INT,
  modelo varchar(25),
  PRIMARY KEY(registro)
);

CREATE TABLE Voo(
  codigo varchar(20) NOT NULL UNIQUE,
  data DATE,
  registro varchar(25),
  cpf_piloto char(11),
  codigo_itinerario INT,
  PRIMARY KEY(codigo)
);

CREATE TABLE Pagamento(
  codigo INT NOT NULL UNIQUE,
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

CREATE TABLE Boleto(
  codigo_pagamento INT NOT NULL,
  codigo_barras varchar(13),
  PRIMARY KEY(codigo_pagamento)
);

CREATE TABLE Passageiro(
  cpf char(11) NOT NULL UNIQUE,
  nome varchar(50),
  sexo char(13),
  rg char(10) NOT NULL UNIQUE,
  data_nascimento DATE,
  PRIMARY KEY(cpf)
);

CREATE TABLE TelefonePassageiro(
  cpf_passageiro char(11) NOT NULL,
  telefone char(11) NOT NULL,
  PRIMARY KEY(cpf_passageiro, telefone)
);

CREATE TABLE Piloto(
  cpf char(11) NOT NULL UNIQUE,
  rg varchar(13) NOT NULL UNIQUE,
  salario REAL NOT NULL,
  nome varchar(50) NOT NULL,
  sexo varchar(13) NOT NULL,
  carga_horaria INT NOT NULL,
  data_nascimento DATE NOT NULL,
  numero_licenca varchar(6) NOT NULL,
  PRIMARY KEY(cpf)
);

CREATE TABLE ComissarioBordo(
  cpf char(11) NOT NULL UNIQUE,
  rg varchar(13) NOT NULL UNIQUE,
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
  codigo char(13) NOT NULL UNIQUE,
  data_emissao DATE NOT NULL,
  assento INT NOT NULL,
  codigo_voo varchar(20) NOT NULL,
  codigo_pagamento INT NOT NULL,
  cpf_passageiro char(11) NOT NULL,
  PRIMARY KEY(codigo)
);

CREATE TABLE Raca(
  nome varchar(50) NOT NULL UNIQUE,
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
  codigo char(13) NOT NULL UNIQUE, /*Dominio escolhido arbitrariamente*/
  codigo_passagem char(13) NOT NULL, 
  peso REAL NOT NULL,
  largura REAL NOT NULL,
  altura REAL NOT NULL,
  profundidade REAL NOT NULL,
  PRIMARY KEY(codigo)
);

CREATE TABLE Aeroporto(
  nome varchar(50) NOT NULL UNIQUE,
  numero INT NOT NULL UNIQUE, 
  cidade varchar(50) NOT NULL,
  logradouro varchar(50) NOT NULL,
  estado char(2) NOT NULL,
  pais varchar(50) NOT NULL,
  codigo_postal char(8) NOT NULL,
  PRIMARY KEY(nome)
);

CREATE TABLE Itinerario(
  codigo INT NOT NULL UNIQUE, 
  tempo_duracao_minutos INT NOT NULL,
  horario TIME NOT NULL, 
  aeroporto_origem varchar(50) NOT NULL,
  aeroporto_destino varchar(50) NOT NULL,
  PRIMARY KEY(codigo)
);

ALTER TABLE Aviao ADD FOREIGN KEY (modelo) REFERENCES Tipo(modelo) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Voo ADD FOREIGN KEY (registro) REFERENCES Aviao(registro) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Voo ADD FOREIGN KEY (cpf_piloto) REFERENCES Piloto(cpf) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Voo ADD FOREIGN KEY (codigo_itinerario) REFERENCES Itinerario(codigo) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Dinheiro ADD FOREIGN KEY (codigo_pagamento) REFERENCES Pagamento(codigo) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE CartaoCredito ADD FOREIGN KEY (codigo_pagamento) REFERENCES Pagamento(codigo) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Debito ADD FOREIGN KEY (codigo_pagamento) REFERENCES Pagamento(codigo) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Boleto ADD FOREIGN KEY (codigo_pagamento) REFERENCES Pagamento(codigo) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE TelefonePassageiro ADD FOREIGN KEY (cpf_passageiro) REFERENCES Passageiro(cpf) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE TrabalhaEm ADD FOREIGN KEY (cpf_comissario) REFERENCES ComissarioBordo(cpf) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE TrabalhaEm ADD FOREIGN KEY (codigo_voo) REFERENCES Voo(codigo) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Passagem ADD FOREIGN KEY (codigo_pagamento) REFERENCES Pagamento(codigo) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Passagem ADD FOREIGN KEY (codigo_voo) REFERENCES Voo(codigo) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Passagem ADD FOREIGN KEY (cpf_passageiro) REFERENCES Passageiro(cpf) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Pet ADD FOREIGN KEY (codigo_passagem) REFERENCES Passagem(codigo) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Pet ADD FOREIGN KEY (nome_raca) REFERENCES Raca(nome) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Bagagem ADD FOREIGN KEY (codigo_passagem) REFERENCES Passagem(codigo) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Itinerario ADD FOREIGN KEY (aeroporto_origem) REFERENCES Aeroporto(nome) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE Itinerario ADD FOREIGN KEY (aeroporto_destino) REFERENCES Aeroporto(nome) ON DELETE NO ACTION ON UPDATE CASCADE;


/* TIPO */
INSERT INTO tipo(modelo, capacidade)
VALUES ('Airbus A380', 853);
	
INSERT INTO tipo(modelo, capacidade)
VALUES ('Boeing 707', 166);

INSERT INTO tipo(modelo, capacidade)
VALUES ('Airbus A319', 156);
	
INSERT INTO tipo(modelo, capacidade)
VALUES ('ATR 42–500', 52);
	
INSERT INTO tipo(modelo, capacidade)
VALUES ('Embraer 190', 124);

INSERT INTO tipo(modelo, capacidade)
VALUES ('Boeing 757', 279);

/* PILOTO */
INSERT INTO piloto(cpf, rg, salario, nome, sexo, carga_horaria, data_nascimento, numero_licenca)
VALUES ('34346555920', 'MG261719030', '5360.40', 'Kaio Oliveira Carlos', 'Masculino', 40, TO_DATE('17/12/1975', 'DD/MM/YYYY'), '402441');

INSERT INTO piloto(cpf, rg, salario, nome, sexo, carga_horaria, data_nascimento, numero_licenca)
VALUES ('62702562235', 'SP778222200', '5600.00', 'Artyom Calçada Quadros', 'Masculino', 44, TO_DATE('21/02/1977', 'DD/MM/YYYY'), '050453');

INSERT INTO piloto(cpf, rg, salario, nome, sexo, carga_horaria, data_nascimento, numero_licenca)
VALUES ('53983625809', 'MG778222200', '6360.40', 'Adélia Salgueiro Jordão', 'Feminino', 44, TO_DATE('12/05/1980', 'DD/MM/YYYY'), '843663');

INSERT INTO piloto(cpf, rg, salario, nome, sexo, carga_horaria, data_nascimento, numero_licenca)
VALUES ('56800561195', 'MG945826202', '5002.25', 'Anais Lagoa Seabra', 'Feminino', 40, TO_DATE('10/10/1990', 'DD/MM/YYYY'), '953996');

INSERT INTO piloto(cpf, rg, salario, nome, sexo, carga_horaria, data_nascimento, numero_licenca)
VALUES ('47420630841', 'RJ062305107', '5360.40', 'Lázaro Anjos Mainha', 'Masculino', 40, TO_DATE('10/09/1977', 'DD/MM/YYYY'), '393237');

INSERT INTO piloto(cpf, rg, salario, nome, sexo, carga_horaria, data_nascimento, numero_licenca)
VALUES ('65193378892', 'MG851884300', '5600.40', 'Jael Prudente Ferrão', 'Masculino', 44, TO_DATE('06/01/1985', 'DD/MM/YYYY'), '849672');


/* COMISSARIO */
INSERT INTO comissariobordo(cpf, rg, salario, nome, sexo, carga_horaria, data_nascimento, cht)
VALUES ('96465590287', 'AC710850361', '3997.00', 'Agostinho Rijo Nogueira', 'Masculino', 40, TO_DATE('08/02/1971', 'DD/MM/YYYY'), '6589598259');

INSERT INTO comissariobordo(cpf, rg, salario, nome, sexo, carga_horaria, data_nascimento, cht)
VALUES ('32122843929', 'MG154543262', '4591.05', 'Carla Ferreira Rodrigues', 'Feminino', 44, TO_DATE('28/11/1995', 'DD/MM/YYYY'), '9751587871');

INSERT INTO comissariobordo(cpf, rg, salario, nome, sexo, carga_horaria, data_nascimento, cht)
VALUES ('37083365362', 'SP605288798', '3900.15', 'Fernanda Ribeiro Costa', 'Feminino', 40, TO_DATE('10/10/1980', 'DD/MM/YYYY'), '9703099176');

INSERT INTO comissariobordo(cpf, rg, salario, nome, sexo, carga_horaria, data_nascimento, cht)
VALUES ('21397522302', 'MS710850361', '4591.00', 'Breno Pereira Rodrigues', 'Masculino', 44, TO_DATE('05/03/1976', 'DD/MM/YYYY'), '6589598259');

INSERT INTO comissariobordo(cpf, rg, salario, nome, sexo, carga_horaria, data_nascimento, cht)
VALUES ('96465590247', 'BA060942448', '3997.00', 'Luana Rocha Santos', 'Feminino', 40, TO_DATE('22/02/1980', 'DD/MM/YYYY'), '4997561893');

INSERT INTO comissariobordo(cpf, rg, salario, nome, sexo, carga_horaria, data_nascimento, cht)
VALUES ('07360850067', 'RS718812834', '5291.00', 'Martim Cunha Pereira', 'Masculino', 44, TO_DATE('14/04/1999', 'DD/MM/YYYY'), '5382089063');
 
/* AEROPORTO */
INSERT INTO aeroporto(nome, numero, cidade, logradouro, estado, pais, codigo_postal)
VALUES ('Aeroporto Deputado Freitas Nobre', 342, 'São Paulo', 'Avenida Washington Luís', 'SP', 'Brasil', '04626911');

INSERT INTO aeroporto(nome, numero, cidade, logradouro, estado, pais, codigo_postal)
VALUES ('Aeroporto Carlos Drummond de Andrade', 204, 'Belo Horizonte', 'Praça Bagatelle', 'MG', 'Brasil', '31270705');

INSERT INTO aeroporto(nome, numero, cidade, logradouro, estado, pais, codigo_postal)
VALUES ('Aeroporto Zumbi dos Palmares', 105, 'Rio Largo', 'Rodovia BR', 'AL', 'Brasil', '57100971');

INSERT INTO aeroporto(nome, numero, cidade, logradouro, estado, pais, codigo_postal)
VALUES ('Aeroporto Internacional de Campo Grande', 13, 'Campo Grande', 'Av. Duque de Caxias', 'MS', 'Brasil', '79101901');

INSERT INTO aeroporto(nome, numero, cidade, logradouro, estado, pais, codigo_postal)
VALUES ('Aeroporto Salgado Filho', 90010, 'Porto Alegre', 'Av. Severo Dullius', 'RS', 'Brasil', '90200310');

INSERT INTO aeroporto(nome, numero, cidade, logradouro, estado, pais, codigo_postal)
VALUES ('Aeroporto de Porto Seguro', 123, 'Porto Seguro', 'Estr. do Aeroporto', 'BA', 'Brasil', '45810000');

/* PASSAGEIRO */
INSERT INTO passageiro(cpf, nome, sexo, rg, data_nascimento)
VALUES ('33659790340', 'Otávio Ribeiro Sousa', 'Masculino', 'MG00591799', TO_DATE('13/11/1975', 'DD/MM/YYYY'));

INSERT INTO passageiro(cpf, nome, sexo, rg, data_nascimento)
VALUES ('22346376063', 'Joao Barros Castro', 'Masculino', 'SP12726331', TO_DATE('22/09/1989', 'DD/MM/YYYY'));

INSERT INTO passageiro(cpf, nome, sexo, rg, data_nascimento)
VALUES ('55405991244', 'Gabrielly Carvalho Goncalves', 'Feminino', 'RJ23780730', TO_DATE('01/01/2000', 'DD/MM/YYYY'));

INSERT INTO passageiro(cpf, nome, sexo, rg, data_nascimento)
VALUES ('37270919869', 'Carolina Lima Gomes', 'Feminino', 'PA27276533', TO_DATE('09/04/2002', 'DD/MM/YYYY'));

INSERT INTO passageiro(cpf, nome, sexo, rg, data_nascimento)
VALUES ('06774716611', 'Victor Alves Dias', 'Masculino', 'DF35489930', TO_DATE('26/06/1988', 'DD/MM/YYYY'));

INSERT INTO passageiro(cpf, nome, sexo, rg, data_nascimento)
VALUES ('10891340304', 'Melissa Carvalho Almeida', 'Feminino', 'PB56516468', TO_DATE('11/07/1961', 'DD/MM/YYYY'));

/* RAÇA */
INSERT INTO raca(nome, especie)
VALUES ('Buldogue', 'Cachorro');

INSERT INTO raca(nome, especie)
VALUES ('Golden Retriever', 'Cachorro');

INSERT INTO raca(nome, especie)
VALUES ('Poodle', 'Cachorro');

INSERT INTO raca(nome, especie)
VALUES ('Persa', 'Gato');

INSERT INTO raca(nome, especie)
VALUES ('Siamês', 'Gato');

INSERT INTO raca(nome, especie)
VALUES ('Siberiano', 'Gato');

/* PAGAMENTO */
INSERT INTO pagamento(codigo, valor)
VALUES (5548373, '800.40');

INSERT INTO pagamento(codigo, valor)
VALUES (0406206, '6908.50');

INSERT INTO pagamento(codigo, valor)
VALUES (7512889, '1337.99');

INSERT INTO pagamento(codigo, valor)
VALUES (3502754, '2330.39');

INSERT INTO pagamento(codigo, valor)
VALUES (1085067, '915.20');

INSERT INTO pagamento(codigo, valor)
VALUES (6082841, '950.89');

/* DINHEIRO */
INSERT INTO dinheiro(codigo_pagamento, valor_pago, troco)
VALUES (1085067, '920', '4.8');

INSERT INTO dinheiro(codigo_pagamento, valor_pago, troco)
VALUES (6082841, '955', '4.11');


/* CARTAO */
INSERT INTO cartaocredito(codigo_pagamento, numero_cartao, bandeira, data_expiracao, codigo_seguranca)
VALUES (3502754, 23565467, 'Mastercard', TO_DATE('31/05/2027', 'DD/MM/YYYY'), 432);


/* DEBTIO */
INSERT INTO debito(codigo_pagamento, agencia, conta)
VALUES (0406206, 341202, 630456);

INSERT INTO debito(codigo_pagamento, agencia, conta)
VALUES (7512889, 515602, 763546);

/* BOLETO */
INSERT INTO boleto(codigo_pagamento, codigo_barras)
VALUES (5548373, '5069119824480');

/* AVIAO */
INSERT INTO aviao(registro, cor, ano_fabricacao, modelo)
VALUES (0125546, 'azul', 1999, 'Airbus A380');

INSERT INTO aviao(registro, cor, ano_fabricacao, modelo)
VALUES (1236542, 'amarelo', 1999, 'Boeing 707');

INSERT INTO aviao(registro, cor, ano_fabricacao, modelo)
VALUES (6532454, 'verde', 2000, 'Airbus A319');

INSERT INTO aviao(registro, cor, ano_fabricacao, modelo)
VALUES (4521365, 'rosa', 1999, 'ATR 42–500');

INSERT INTO aviao(registro, cor, ano_fabricacao, modelo)
VALUES (6332542, 'preto', 1970, 'Embraer 190');

INSERT INTO aviao(registro, cor, ano_fabricacao, modelo)
VALUES (3632254, 'branco', 1992, 'Boeing 757');

/* ITINERARIO */
INSERT INTO itinerario(codigo, tempo_duracao_minutos, horario, aeroporto_origem, aeroporto_destino)
VALUES (1, 50, '13:30:00', 'Aeroporto Deputado Freitas Nobre', 'Aeroporto Carlos Drummond de Andrade');

INSERT INTO itinerario(codigo, tempo_duracao_minutos, horario, aeroporto_origem, aeroporto_destino)
VALUES (2, 45, '15:30:00', 'Aeroporto Carlos Drummond de Andrade', 'Aeroporto Zumbi dos Palmares');

INSERT INTO itinerario(codigo, tempo_duracao_minutos, horario, aeroporto_origem, aeroporto_destino)
VALUES (3, 60, '9:30:00', 'Aeroporto Zumbi dos Palmares', 'Aeroporto Internacional de Campo Grande');

INSERT INTO itinerario(codigo, tempo_duracao_minutos, horario, aeroporto_origem, aeroporto_destino)
VALUES (4, 70, '10:00:00', 'Aeroporto Internacional de Campo Grande', 'Aeroporto Salgado Filho');

INSERT INTO itinerario(codigo, tempo_duracao_minutos, horario, aeroporto_origem, aeroporto_destino)
VALUES (5, 35, '20:00:00', 'Aeroporto Salgado Filho', 'Aeroporto de Porto Seguro');

INSERT INTO itinerario(codigo, tempo_duracao_minutos, horario, aeroporto_origem, aeroporto_destino)
VALUES (6, 90, '17:50:00', 'Aeroporto de Porto Seguro', 'Aeroporto Deputado Freitas Nobre');

/* VOO */
INSERT INTO voo(codigo, data, registro, cpf_piloto, codigo_itinerario)
VALUES (1, TO_DATE('21/02/2022', 'DD/MM/YYYY'), 0125546, '34346555920',2);

INSERT INTO voo(codigo, data, registro, cpf_piloto, codigo_itinerario)
VALUES (2, TO_DATE('14/08/2021', 'DD/MM/YYYY'), 1236542, '62702562235',3);

INSERT INTO voo(codigo, data, registro, cpf_piloto, codigo_itinerario)
VALUES (3, TO_DATE('24/08/2020', 'DD/MM/YYYY'), 6532454, '53983625809',4);

INSERT INTO voo(codigo, data, registro, cpf_piloto, codigo_itinerario)
VALUES (4, TO_DATE('17/12/2021', 'DD/MM/YYYY'), 4521365, '56800561195',6);

INSERT INTO voo(codigo, data, registro, cpf_piloto, codigo_itinerario)
VALUES (5, TO_DATE('08/08/2021', 'DD/MM/YYYY'), 6332542, '47420630841',1);

INSERT INTO voo(codigo, data, registro, cpf_piloto, codigo_itinerario)
VALUES (6, TO_DATE('11/05/2020', 'DD/MM/YYYY'), 3632254, '65193378892',5);

/* TRABALHA_EM */
INSERT INTO trabalhaem(cpf_comissario, codigo_voo)
VALUES ('96465590287', '1');

INSERT INTO trabalhaem(cpf_comissario, codigo_voo)
VALUES ('96465590287', '2');

INSERT INTO trabalhaem(cpf_comissario, codigo_voo)
VALUES ('32122843929', '2');

INSERT INTO trabalhaem(cpf_comissario, codigo_voo)
VALUES ('32122843929', '3');

INSERT INTO trabalhaem(cpf_comissario, codigo_voo)
VALUES ('37083365362', '3');

INSERT INTO trabalhaem(cpf_comissario, codigo_voo)
VALUES ('37083365362', '4');

INSERT INTO trabalhaem(cpf_comissario, codigo_voo)
VALUES ('21397522302', '4');

INSERT INTO trabalhaem(cpf_comissario, codigo_voo)
VALUES ('21397522302', '5');

INSERT INTO trabalhaem(cpf_comissario, codigo_voo)
VALUES ('96465590287', '5');

INSERT INTO trabalhaem(cpf_comissario, codigo_voo)
VALUES ('96465590287', '6');

INSERT INTO trabalhaem(cpf_comissario, codigo_voo)
VALUES ('07360850067', '6');

INSERT INTO trabalhaem(cpf_comissario, codigo_voo)
VALUES ('07360850067', '1');

/* PASSAGEM */
INSERT INTO passagem(codigo, data_emissao, assento, codigo_voo, codigo_pagamento, cpf_passageiro)
VALUES (1, TO_DATE('01/05/2022', 'DD/MM/YYYY'), 5, 2, 5548373,'33659790340');

INSERT INTO passagem(codigo, data_emissao, assento, codigo_voo,codigo_pagamento, cpf_passageiro)
VALUES (2, TO_DATE('15/05/2022', 'DD/MM/YYYY'), 3, 4, 0406206,'22346376063');

INSERT INTO passagem(codigo, data_emissao, assento, codigo_voo,codigo_pagamento, cpf_passageiro)
VALUES (3, TO_DATE('20/05/2022', 'DD/MM/YYYY'), 4, 5, 7512889,'55405991244');

INSERT INTO passagem(codigo, data_emissao, assento, codigo_voo,codigo_pagamento, cpf_passageiro)
VALUES (4, TO_DATE('10/05/2022', 'DD/MM/YYYY'), 1, 1, 1085067,'37270919869');

INSERT INTO passagem(codigo, data_emissao, assento, codigo_voo,codigo_pagamento, cpf_passageiro)
VALUES (5, TO_DATE('23/05/2022', 'DD/MM/YYYY'), 2, 6, 6082841,'06774716611');

INSERT INTO passagem(codigo, data_emissao, assento, codigo_voo,codigo_pagamento, cpf_passageiro)
VALUES (6, TO_DATE('04/06/2022', 'DD/MM/YYYY'), 6, 3, 3502754,'10891340304');


/* PET */
INSERT INTO pet(codigo_passagem, nome, peso, porte, cor, nome_raca)
VALUES (1, 'Matilda', 12.0,'pequeno','marrom','Buldogue');

INSERT INTO pet(codigo_passagem, nome, peso, porte, cor, nome_raca)
VALUES (2, 'Maralvo', 22.3,'grande', 'amarelo', 'Golden Retriever');

INSERT INTO pet(codigo_passagem, nome, peso, porte, cor, nome_raca)
VALUES (3, 'Maggie', 16.1,'medio', 'branco', 'Poodle');

INSERT INTO pet(codigo_passagem, nome, peso, porte, cor, nome_raca)
VALUES (4, 'Donnie', 10.4,'pequeno', 'branco', 'Persa');

INSERT INTO pet(codigo_passagem, nome, peso, porte, cor, nome_raca)
VALUES (5, 'Tibursio', 9.9,'pequeno', 'bege', 'Siamês');

INSERT INTO pet(codigo_passagem, nome, peso, porte, cor, nome_raca)
VALUES (6, 'Tibbers', 12.5,'pequeno', 'cinza', 'Siberiano');

/* BAGAGEM */
INSERT INTO bagagem(codigo, codigo_passagem, peso, largura, altura, profundidade)
VALUES (1, 3, 12.5,35.5,45.5, 10.3);

INSERT INTO bagagem(codigo, codigo_passagem, peso, largura, altura, profundidade)
VALUES (2, 1, 12.5,35.5,45.5, 20.5);

INSERT INTO bagagem(codigo, codigo_passagem, peso, largura, altura, profundidade)
VALUES (3, 2, 12.5,35.5,45.5, 6.12);

INSERT INTO bagagem(codigo, codigo_passagem, peso, largura, altura, profundidade)
VALUES (4, 5, 12.5,35.5,45.5, 12.5);

INSERT INTO bagagem(codigo, codigo_passagem, peso, largura, altura, profundidade)
VALUES (5, 6, 12.5,35.5,45.5, 10.3);

INSERT INTO bagagem(codigo, codigo_passagem, peso, largura, altura, profundidade)
VALUES (6, 4, 12.5,35.5,45.5, 20.5);

INSERT INTO bagagem(codigo, codigo_passagem, peso, largura, altura, profundidade)
VALUES (7, 3, 12.5,45.5,55.5, 20.5);

INSERT INTO bagagem(codigo, codigo_passagem, peso, largura, altura, profundidade)
VALUES (8, 3, 12.5,45.5,55.5, 5.63);

INSERT INTO bagagem(codigo, codigo_passagem, peso, largura, altura, profundidade)
VALUES (9, 4, 12.5,45.5,55.5, 25.33);

/* Telefone Passageiro */
INSERT INTO telefonepassageiro(cpf_passageiro, telefone)
VALUES ('06774716611', '61988882121');

INSERT INTO telefonepassageiro(cpf_passageiro, telefone)
VALUES ('06774716611', '61984382822');

INSERT INTO telefonepassageiro(cpf_passageiro, telefone)
VALUES ('10891340304', '83988875423');

INSERT INTO telefonepassageiro(cpf_passageiro, telefone)
VALUES ('22346376063', '1198763390');

INSERT INTO telefonepassageiro(cpf_passageiro, telefone)
VALUES ('22346376063', '11912358845');

INSERT INTO telefonepassageiro(cpf_passageiro, telefone)
VALUES ('55405991244', '22987334445');
