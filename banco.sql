-- Criação da tabela de Usuários
CREATE TABLE Usuarios (
    usuario_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    senha_usuario VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de Lugares
CREATE TABLE Lugares (
    lugar_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_ID INT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    endereco VARCHAR(255) NOT NULL,
    preco_base_noite DECIMAL(10,2) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_ID) REFERENCES Usuarios(usuario_ID)
);

-- Criação da tabela de Hospedagens
CREATE TABLE Hospedagens (
    hospedagem_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_ID INT NOT NULL,
    lugar_ID INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    FOREIGN KEY (usuario_ID) REFERENCES Usuarios(usuario_ID),
    FOREIGN KEY (lugar_ID) REFERENCES Lugares(lugar_ID)
);

-- Criação da tabela de Avaliações
CREATE TABLE Avaliacoes (
    avaliacao_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    hospedagem_ID INT NOT NULL,
    usuario_ID INT NOT NULL,
    nota INT CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (hospedagem_ID) REFERENCES Hospedagens(hospedagem_ID),
    FOREIGN KEY (usuario_ID) REFERENCES Usuarios(usuario_ID)
);

-- Inserção de usuários de exemplo
INSERT INTO Usuarios (nome, email, senha_usuario) VALUES
('Joao Leno', 'Joao.Leno@stackx.com', 'senha123'),
('Diego Souza', 'diego.souza@tateandlyle.com', 'senha123'),
('Carla Mendes', 'carla.mendes@email.com', 'senha123'),
('Bruno Costa', 'bruno.costa@email.com', 'senha123'),
('Ana Silva', 'ana.silva@email.com', 'senha123');

-- Inserção de lugares de exemplo
INSERT INTO Lugares (usuario_ID, titulo, descricao, endereco, preco_base_noite) VALUES
(1, 'Casa na Praia', 'Casa ampla com vista para o mar', 'Av. Atlântica, 500 - Rio de Janeiro', 450.00),
(2, 'Apartamento no Centro', 'Apartamento muito confortável, próximo ao shopping', 'Rua Dr Mario Hugo Ladeira, 344 - MG', 250.00);

-- Inserção de hospedagens de exemplo
INSERT INTO Hospedagens (usuario_ID, lugar_ID, data_entrada, data_saida) VALUES
(3, 1, '2025-09-10', '2025-09-15'),
(4, 2, '2025-09-20', '2025-09-25');

-- Inserção de avaliações de exemplo
INSERT INTO Avaliacoes (hospedagem_ID, usuario_ID, nota, comentario) VALUES
(1, 3, 4, 'Casa ótima, mas o Wi-Fi poderia ser melhor.'),
(2, 4, 5, 'Apartamento excelente, muito limpo e bem localizado!');

/*explicação abaixo */
--Nomes de tabelas 
--Usuários: Para armazenar informações dos usuários do sistema.

/*Lugares: Para cadastrar os lugares disponíveis para hospedagem.

Hospedagens: Para registrar cada hospedagem feita por um usuário.

Avaliações: Para armazenar avaliações de usuários sobre as hospedagens.

Relacionamentos entre as tabelas
Usuários --> Lugares: Um usuário pode cadastrar vários lugares → usuario_ID em Lugares é chave estrangeira.

Usuários -->Hospedagens: um usuário pode ter várias hospedagens → usuario_ID em Hospedagens é chave estrangeira.

Lugares ---> Hospedagens: um lugar pode ser hospedado por vários usuários → lugar_ID em Hospedagens é chave estrangeira.

Hospedagens -->Avaliações: um hospedagem pode ter várias avaliações → hospedagem_ID em Avaliacoes é chave estrangeira.

Usuários --> Avaliações: o mesmo usuário pode fazer várias avaliações → usuario_ID em Avaliacoes é chave estrangeira.

Explicação das minhas decisões
Separação clara de entidades: Cada tabela representa uma entidade única do sistema (usuário, lugar, hospedagem, avaliação). Isso mantém o banco organizado e evita redundâncias...

Relacionamentos lógicos: Hospedagens conectam usuários e lugares, e avaliações conectam usuários e hospedagens, refletindo o fluxo natural do sistema.

Campos essenciais: Colunas como usuario_ID, lugar_ID, data_entrada e nota são indispensáveis para rastrear dados importantes e permitir consultas úteis (ex.: quais usuários ficaram em quais lugares e como avaliaram).

Uso de chaves primárias e estrangeiras: Garante integridade referencial, evitando que dados inválidos sejam inserido 
*/
