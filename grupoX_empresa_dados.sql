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


DROP TABLE FUNCIONARIO, DEPARTAMENTO
-- INSERT INTO FUNCIONARIO 
--     ( Datanasc)
-- VALUES
--     ()
--(convert(datetime,'09-01-1965',103))
