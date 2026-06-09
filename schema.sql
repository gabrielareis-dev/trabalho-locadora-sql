CREATE DATABASE locadoraveiculos;
USE locadoraveiculos;

CREATE TABLE Cliente (
    idCliente INT NOT NULL,
    CPF VARCHAR(20) NOT NULL, 
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(20) NOT NULL, 
    email VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    PRIMARY KEY (idCliente) 
); 

CREATE TABLE Pagamento (
    idPagamento INT NOT NULL, 
    forma ENUM ('Cartão', 'Pix', 'Dinheiro') NOT NULL,
    dataPagamento DATE NOT NULL,
    valorTotal DECIMAL (7,2) NOT NULL,
    estado ENUM ('Pago', 'Pendente') NOT NULL,
    PRIMARY KEY (idPagamento) 
);

CREATE TABLE Locacao (
    idLocacao INT NOT NULL,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL, 
    idCliente INT NOT NULL,
    idPagamento INT NOT NULL,
    PRIMARY KEY (idLocacao),
    FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento (idPagamento) 
);

CREATE TABLE Veiculo (
    idVeiculo INT NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    placa VARCHAR(10) NOT NULL, 
    valorDiaria DECIMAL (7,2) NOT NULL, 
    estado ENUM ('Disponível', 'Alugado', 'Manutenção') NOT NULL,
    PRIMARY KEY (idVeiculo)
); 

CREATE TABLE Manutencao (
    idManutencao INT NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    dataManutencao DATE NOT NULL,
    custo DECIMAL (7,2),
    idVeiculo INT NOT NULL,
    PRIMARY KEY (idManutencao),
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo (idVeiculo)
); 

CREATE TABLE LocacaoVeiculo (
    idVeiculo INT NOT NULL,
    idLocacao INT NOT NULL,
    PRIMARY KEY (idVeiculo, idLocacao),
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo (idVeiculo),
    FOREIGN KEY (idLocacao) REFERENCES Locacao (idLocacao)
);