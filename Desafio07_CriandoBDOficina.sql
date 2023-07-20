CREATE DATABASE Oficina;
USE Oficina;

-- Criação das tabelas
CREATE TABLE Clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  telefone VARCHAR(20),
  endereco VARCHAR(100),
  cidade VARCHAR(50),
  estado VARCHAR(2),
  cep VARCHAR(10)
);

CREATE TABLE Veiculos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  placa VARCHAR(10),
  marca VARCHAR(50),
  modelo VARCHAR(50),
  ano INT,
  cor VARCHAR(20),
  cliente_id INT,
  FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE Servicos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  descricao TEXT,
  valor DECIMAL(10, 2)
);

CREATE TABLE Ordens_de_Servico (
  id INT AUTO_INCREMENT PRIMARY KEY,
  data DATE,
  valor_total DECIMAL(10, 2),
  cliente_id INT,
  veiculo_id INT,
  FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
  FOREIGN KEY (veiculo_id) REFERENCES Veiculos(id)
);

CREATE TABLE Itens_de_Ordem_de_Servico (
  id INT AUTO_INCREMENT PRIMARY KEY,
  ordem_de_servico_id INT,
  servico_id INT,
  quantidade INT,
  valor DECIMAL(10, 2),
  FOREIGN KEY (ordem_de_servico_id) REFERENCES Ordens_de_Servico(id),
  FOREIGN KEY (servico_id) REFERENCES Servicos(id)
);
