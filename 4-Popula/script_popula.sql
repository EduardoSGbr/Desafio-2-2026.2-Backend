USE detran_desafio;

-- 1. Inserir Categorias
INSERT INTO Categoria (codigo_categoria, descricao) VALUES
(10, 'AUTOMÓVEL'),
(11, 'MOTOCICLETA'),
(12, 'CAMINHÃO'),
(13, 'ÔNIBUS'),
(14, 'CAMINHONETE');

-- 2. Inserir Modelos
INSERT INTO Modelo (codigo_modelo, descricao) VALUES
(100001, 'GOL MI'),
(100002, 'GOL 1.8'),
(100003, 'UNO CS'),
(100004, 'COROLLA XEI'),
(100005, 'CG 160 TITAN');

-- 3. Inserir Proprietários
INSERT INTO Proprietario (cpf, nome, endereco, bairro, cidade, estado, telefones, sexo, data_nascimento) VALUES
('11111111111', 'João Silva', 'Rua A, 123', 'Centro', 'São Paulo', 'SP', '11999999999', 'M', '1980-05-15'),
('22222222222', 'Maria Santos', 'Av B, 45', 'Jardins', 'São Paulo', 'SP', '11988888888', 'F', '1992-08-20'),
('33333333333', 'Carlos Pereira', 'Rua C, 789', 'Copacabana', 'Rio de Janeiro', 'RJ', '21977777777', 'M', '1975-12-10'),
('44444444444', 'Ana Costa', 'Rua D, 12', 'Savassi', 'Belo Horizonte', 'MG', '31966666666', 'F', '1988-03-25'),
('55555555555', 'Pedro Alves', 'Av E, 900', 'Batel', 'Curitiba', 'PR', '41955555555', 'M', '1995-11-05');
-- 4. Inserir Agentes de Trânsito
INSERT INTO AgenteTransito (matricula, nome, data_contratacao) VALUES
(101, 'Roberto Lima', '2015-03-10'),
(102, 'Fernanda Souza', '2018-07-01'),
(103, 'Lucas Mendes', '2020-01-15'),
(104, 'Patricia Rocha', '2012-11-20'),
(105, 'Marcelo Oliveira', '2019-05-04');

-- 5. Inserir Tipos de Infração
INSERT INTO TipoInfracao (codigo_infracao, descricao, valor) VALUES
(1, 'AVANÇO DE SINAL VERMELHO', 293.47),
(2, 'PARADA SOBRE A FAIXA DE PEDESTRES', 195.23),
(3, 'EXCESSO DE VELOCIDADE ATÉ 20%', 130.16),
(4, 'USO DE TELEMÓVEL AO VOLANTE', 293.47),
(5, 'ESTACIONAR EM LOCAL PROIBIDO', 130.16);

-- 6. Inserir Locais
INSERT INTO Local (latitude, longitude, velocidade_permitida) VALUES
(-23.55052000, -46.63330800, 60),
(-23.56141400, -46.65588100, 50),
(-22.90684700, -43.17289600, 70),
(-19.91668100, -43.93449300, 60),
(-25.42840000, -49.27330000, 40);

-- 7. Inserir Veículos
-- (Repare que associámos dois veículos ao primeiro CPF para podermos testar a consulta A mais tarde)
INSERT INTO Veiculo (placa, chassi, cor, ano_fabricacao, cpf_proprietario, codigo_modelo, codigo_categoria) VALUES
('ABC1D23', '9BWZZZ377VT000001', 'Branco', 2020, '11111111111', 100001, 10),
('XYZ9K87', '9BWZZZ377VT000002', 'Preto', 2018, '11111111111', 100002, 10),
('JKL4M56', '9BWZZZ377VT000003', 'Prata', 2019, '22222222222', 100003, 10),
('MNO7P89', '9BWZZZ377VT000004', 'Vermelho', 2022, '33333333333', 100004, 10),
('QRS0T12', '9BWZZZ377VT000005', 'Azul', 2021, '44444444444', 100005, 11);

-- 8. Inserir Infrações
INSERT INTO Infracao (data_hora, velocidade_aferida, placa_veiculo, matricula_agente, codigo_infracao, latitude, longitude) VALUES
('2024-01-15 08:30:00', NULL, 'ABC1D23', 101, 1, -23.55052000, -46.63330800),
('2024-02-10 14:15:00', 68, 'XYZ9K87', 102, 3, -23.56141400, -46.65588100),
('2024-03-05 18:45:00', NULL, 'JKL4M56', 103, 2, -22.90684700, -43.17289600),
('2024-04-12 11:00:00', NULL, 'MNO7P89', 104, 4, -19.91668100, -43.93449300),
('2024-05-20 09:20:00', 52, 'QRS0T12', 105, 3, -25.42840000, -49.27330000);