CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    autor TEXT NOT NULL,
    ano_publicacao INTEGER
);

/* ETAPA CREATE */

INSERT INTO livros(id, titulo, autor, ano_publicacao)
VALUES (1,'The Witcher', 'Andrzej Sapkowski', 2001 );

/* read */

SELECT * FROM livros;

SELECT titulo FROM livros;

/* update*/

update livros
set ano_publicacao = 2002
where id = 1;

/* Delete */

Delete FROM livros
where id = 1;

