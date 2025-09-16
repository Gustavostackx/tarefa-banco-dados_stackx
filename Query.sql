/* 
projeto query - stackx

*/

--tabela alunos
CREATE TABLE aluno (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    data_nascimento TEXT
);

CREATE TABLE professor (

    id INTEGER PRIMARY KEY,
    nome TEXT,
    data_nascimento TEXT

);

CREATE TABLE materia (

    id INTEGER PRIMARY KEY,

    nome TEXT,
    id_professor INTEGER,
    
    FOREIGN KEY (id_professor) REFERENCES professor(id)
);

CREATE TABLE provas (

    id_aluno INTEGER,
    id_materia INTEGER,
    nota REAL,
    data_da_prova TEXT,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id),
    FOREIGN KEY (id_materia) REFERENCES materia(id)
);

-- 2️⃣ Inserindo dados
INSERT INTO aluno (id, nome, data_nascimento) VALUES
(1, 'Joao Leno', '2005-03-15'),
(2, 'Anakin Skywalker', '2004-07-20'),
(3, 'Carla Mendes', '2006-11-05');

INSERT INTO professor (id, nome, data_nascimento) VALUES
(1, 'João Leno', '1980-02-10');

INSERT INTO materia (id, nome, id_professor) VALUES
(1, 'Matemática', 1);

INSERT INTO provas (id_aluno, id_materia, nota, data_da_prova) VALUES
(1, 1, 8.5, '2025-09-11'),
(2, 1, 7.0, '2025-09-11'),
(3, 1, 9.2, '2025-09-11');

/* 

para "rodar" o código, insira o código a seguir:
SELECT a.nome AS aluno, m.nome AS materia, p.nota, p.data_da_prova
FROM provas p
JOIN aluno a ON p.id_aluno = a.id
JOIN materia m ON p.id_materia = m.id;

*/