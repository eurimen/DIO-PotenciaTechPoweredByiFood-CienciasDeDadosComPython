-- Inserção de dados fictícios com nomes aleatórios de pessoas
INSERT INTO Clientes (nome, telefone, endereco, cidade, estado, cep) VALUES
('João da Silva', '11111111', 'Rua A, 123', 'São Paulo', 'SP', '12345-678'),
('Maria Oliveira', '22222222', 'Rua B, 456', 'Rio de Janeiro', 'RJ', '98765-4321'),
('José Santos', '33333333', 'Rua C, 789', 'Belo Horizonte', 'MG', '45678-901'),
('Ana Souza', '44444444', 'Rua D, 1011', 'Curitiba', 'PR', '89012-345'),
('Pedro Pereira', '55555555', 'Rua E, 1213', 'Porto Alegre', 'RS', '23456-789'),
('Fernanda Lima', '66666666', 'Rua F, 1415', 'Salvador', 'BA', '67890-123'),
('Ricardo Gomes', '77777777', 'Rua G, 1617', 'Fortaleza', 'CE', '34567-890'),
('Carla Martins', '88888888', 'Rua H, 1819', 'Recife', 'PE', '56789-012'),
('Marcos Costa', '99999999', 'Rua I, 2021', 'Manaus', 'AM', '67890-123'),
('Juliana Ferreira', '1010101010', 'Rua J, 2223', 'Florianópolis', 'SC', '89012-345');

-- Visualizando dados Tabela Clientes
SELECT * FROM Clientes;

INSERT INTO Veiculos (placa, marca, modelo, ano, cor, cliente_id) VALUES
('ABC1234', 'Fiat', 'Uno', 2010, 'Vermelho', 1),
('DEF5678', 'Volkswagen', 'Gol', 2015, 'Prata', 2),
('GHI9012', 'Ford', 'Ka', 2018, 'Branco', 3),
('JKL3456', 'Chevrolet', 'Onix', 2022, 'Preto', 4),
('MNO7890', 'Renault', 'Sandero', 2019, 'Azul', 5),
('PQR1234', 'Hyundai', 'HB20', 2017, 'Cinza', 6),
('STU5678', 'Toyota', 'Corolla', 2020, 'Prata', 7),
('VWX9012', 'Honda', 'Civic', 2023, 'Branco', 8),
('YZA3456', 'Jeep', 'Renegade', 2021, 'Vermelho', 9),
('BCD7890', 'Nissan', 'Kicks', 2019, 'Preto', 10);

INSERT INTO Servicos (nome, descricao, valor) VALUES
('Troca de óleo', 'Troca do óleo do motor, filtro de óleo e filtro de ar', 100.00),
('Revisão geral', 'Revisão de todos os sistemas do veículo, incluindo freios, suspensão e pneus', 200.00),
('Alinhamento e balanceamento', 'Ajuste do alinhamento das rodas e balanceamento dos pneus', 80.00),
('Troca de pastilhas de freio', 'Substituição das pastilhas de freio dianteiras e traseiras', 150.00),
('Troca de bateria', 'Substituição da bateria do veículo', 180.00),
('Polimento e cristalização', 'Polimento e cristalização da pintura do veículo', 250.00),
('Troca de correia dentada', 'Substituição da correia dentada do motor', 300.00),
('Troca de amortecedores', 'Substituição dos amortecedores dianteiros e traseiros', 400.00),
('Reparo de ar-condicionado', 'Reparo e recarga do sistema de ar-condicionado', 150.00),
('Troca de pneus', 'Substituição de todos os pneus do veículo', 500.00);

INSERT INTO Ordens_de_Servico (data, valor_total, cliente_id, veiculo_id) VALUES
('2023-03-08', 100.00, 1, 1),
('2023-03-15', 200.00, 2, 2),
('2023-03-22', 300.00, 3, 3),
('2023-03-29', 400.00, 4, 4),
('2023-04-05', 500.00, 5, 5),
('2023-04-12', 600.00, 6, 6),
('2023-04-19', 700.00, 7, 7),
('2023-04-26', 800.00, 8, 8),
('2023-05-03', 900.00, 9, 9),
('2023-05-10', 1000.00, 10, 10);

-- Recuperar todos os clientes
SELECT * FROM Clientes;

-- Recuperar todos os veículos
SELECT * FROM Veiculos;

-- Recuperar todos os serviços
SELECT * FROM Servicos;

-- Recuperar todas as ordens de serviço
SELECT * FROM Ordens_de_Servico;

-- Recuperar todos os itens de ordem de serviço
SELECT * FROM Itens_de_Ordem_de_Servico;

-- Recuperar informações de um cliente específico
SELECT * FROM Clientes WHERE nome = 'João da Silva';

-- Recuperar ordens de serviço de um cliente específico
SELECT * FROM Ordens_de_Servico WHERE cliente_id = 1;

-- Recuperar veículos de um cliente específico
SELECT * FROM Veiculos WHERE cliente_id = 2;

-- Recuperar ordens de serviço de um veículo específico
SELECT * FROM Ordens_de_Servico WHERE veiculo_id = 3;

-- Recuperar serviços com valor acima de R$ 200
SELECT * FROM Servicos WHERE valor > 200.00;

-- Adicionar um atributo derivado para mostrar o nome completo do cliente
SELECT CONCAT(nome, ' - ', cidade) AS nome_completo FROM Clientes;

-- Adicionar um atributo derivado para calcular o valor total dos serviços em cada ordem de serviço
SELECT o.id AS ordem_id, SUM(i.valor) AS valor_total_servicos
FROM Ordens_de_Servico o
JOIN Itens_de_Ordem_de_Servico i ON o.id = i.ordem_de_servico_id
GROUP BY o.id;

-- Ordenar clientes por nome em ordem alfabética
SELECT * FROM Clientes ORDER BY nome;

-- Ordenar serviços por valor em ordem decrescente
SELECT * FROM Servicos ORDER BY valor DESC;

-- Ordenar veículos por ano em ordem crescente
SELECT * FROM Veiculos ORDER BY ano;

-- Recuperar clientes que possuem ordens de serviço com valor total superior a R$ 500
SELECT c.id, c.nome, SUM(o.valor_total) AS valor_total_os
FROM Clientes c
JOIN Ordens_de_Servico o ON c.id = o.cliente_id
GROUP BY c.id, c.nome
HAVING SUM(o.valor_total) > 500;

-- Recuperar informações completas de todas as ordens de serviço, incluindo dados do cliente e do veículo
SELECT os.id AS ordem_id, os.data, os.valor_total, c.nome AS nome_cliente, v.modelo AS modelo_veiculo
FROM Ordens_de_Servico os
JOIN Clientes c ON os.cliente_id = c.id
JOIN Veiculos v ON os.veiculo_id = v.id;

-- Recuperar informações de todos os itens de ordem de serviço, incluindo dados do serviço e da ordem de serviço
SELECT i.id AS item_id, i.quantidade, i.valor, s.nome AS nome_servico, os.data AS data_os
FROM Itens_de_Ordem_de_Servico i
JOIN Servicos s ON i.servico_id = s.id
JOIN Ordens_de_Servico os ON i.ordem_de_servico_id = os.id;
