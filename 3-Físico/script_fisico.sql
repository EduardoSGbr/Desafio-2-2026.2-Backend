-- Criação do Banco de Dados
CREATE DATABASE detran_desafio;
USE detran_desafio;

-- 1. Tabelas Independentes (Sem Chaves Estrangeiras)

CREATE TABLE Categoria (
    codigo_categoria INT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE Modelo (
    codigo_modelo INT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE Proprietario (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado CHAR(2),
    telefones VARCHAR(50),
    sexo CHAR(1),
    data_nascimento DATE
);
-- 2. Tabelas de Apoio (Sem Chaves Estrangeiras)

CREATE TABLE AgenteTransito (
    matricula INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_contratacao DATE NOT NULL
);

CREATE TABLE TipoInfracao (
    codigo_infracao INT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Local (
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    velocidade_permitida INT,
    PRIMARY KEY (latitude, longitude)
);

-- 3. Tabelas Dependentes (Com Chaves Estrangeiras - FK)

CREATE TABLE Veiculo (
    placa VARCHAR(7) PRIMARY KEY,
    chassi VARCHAR(17) UNIQUE NOT NULL,
    cor VARCHAR(30),
    ano_fabricacao INT,
    cpf_proprietario VARCHAR(11) NOT NULL,
    codigo_modelo INT NOT NULL,
    codigo_categoria INT NOT NULL,
    FOREIGN KEY (cpf_proprietario) REFERENCES Proprietario(cpf),
    FOREIGN KEY (codigo_modelo) REFERENCES Modelo(codigo_modelo),
    FOREIGN KEY (codigo_categoria) REFERENCES Categoria(codigo_categoria)
);

CREATE TABLE Infracao (
    id_infracao INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    velocidade_aferida INT,
    placa_veiculo VARCHAR(7) NOT NULL,
    matricula_agente INT NOT NULL,
    codigo_infracao INT NOT NULL,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    FOREIGN KEY (placa_veiculo) REFERENCES Veiculo(placa),
    FOREIGN KEY (matricula_agente) REFERENCES AgenteTransito(matricula),
    FOREIGN KEY (codigo_infracao) REFERENCES TipoInfracao(codigo_infracao),
    FOREIGN KEY (latitude, longitude) REFERENCES Local(latitude, longitude)
);