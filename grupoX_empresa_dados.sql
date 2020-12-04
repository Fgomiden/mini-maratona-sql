INSERT INTO FUNCIONARIO 
    (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr)
VALUES
    ('João', 'B', 'Silva', '12345678966','09-01-1965', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, '33344555587', 5),
    ('Fernando', 'T', 'Wong', '33344555587', '08-12-1955', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, '88866555576', 5);

SELECT * FROM FUNCIONARIO 

INSERT INTO DEPARTAMENTO 
    (Dnome, Dnumero, Cpf_gerente, Data_inicio_gerente)
VALUES
    ('Pesquisa', 5, '33344555587', '22-05-1988'),
    ('Administração', 4, '98765432168', '01-01-1995');

SELECT * FROM DEPARTAMENTO 

INSERT INTO LOCALIZACOES_DEP 
    (Dnumero, Dlocal)
VALUES
    (1, 'São Paulo'),
    (4, 'Mauá'),
    (5, 'Santo André'),
    (5, 'Itu'),
    (5, 'São Paulo');

SELECT * FROM LOCALIZACOES_DEP

INSERT INTO PROJETO 
    (Projnome, Projnumero, Projlocal, Dnum)
VALUES
    ('ProdutoX', 1, 'Santo André', 5),
    ('ProdutoY', 2, 'Itu', 5),
    ('ProdutoZ', 3, 'São Paulo', 5),
    ('Informatização', 10, 'Mauá', 4),
    ('Reorganização', 20, 'São Paulo', 1),
    ('Novosbeneficios', 30, 'Mauá', 4);

SELECT * FROM PROJETO

INSERT INTO TRABALHA_EM 
    (Fcpf, Pnr, Horas)
VALUES
    ('12345678966', 1, '32,5'),
    ('12345678966', 2, '7,5'),
    ('66688444476', 3, '40,0');

SELECT * FROM TRABALHA_EM

INSERT INTO DEPENDENTE 
    (Fcpf, Nome_dependente, Sexo, Datanasc, Parentesco)
VALUES
    ('33344555587', 'Alicia', 'F', '05-04-1966', 'Filha'),
    ('33344555587', 'Tiago', 'M', '25-10-1983', 'Filho'),
    ('33344555587', 'Janaina', 'F', '03-05-1958', 'Esposa');

SELECT * FROM DEPENDENTE


DROP TABLE FUNCIONARIO, DEPARTAMENTO
-- INSERT INTO FUNCIONARIO 
--     ( Datanasc)
-- VALUES
--     ()
--(convert(datetime,'09-01-1965',103))
