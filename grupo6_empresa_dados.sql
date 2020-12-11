INSERT INTO FUNCIONARIO 
    (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr)
VALUES
    ('João', 'B', 'Silva', '12345678966','1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, '33344555587', 5),
    ('Fernando', 'T', 'Wong', '33344555587', '1955-12-08', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, '88866555576', 5),
    ('Alice', 'J', 'Zelaya', '99988777767','1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, '98765432168', 4),
    ('Jennifer', 'S', 'Souza', '98765432168','1941-06-20', 'Av. Arthur Lima, 54, Santo André, SP', 'F', 43000, '88866555576', 4),
    ('Ronaldo', 'K', 'Lima', '66688444476','1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, '33344555587', 5),
    ('Joice', 'A', 'Leite', '45345345376','1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000, '33344555587', 5),
    ('André', 'V', 'Pereira', '98798798733','1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000, '98765432168', 4),
    ('Jorge', 'E', 'Brito', '88866555576','1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000, NULL, 1);

SELECT * FROM FUNCIONARIO 

INSERT INTO DEPARTAMENTO 
    (Dnome, Dnumero, Cpf_gerente, Data_inicio_gerente)
VALUES
    ('Pesquisa', 5, '33344555587', '1988-05-22'),
    ('Administração', 4, '98765432168', '1995-01-01'),
    ('Matriz', 1, '88866555576', '1981-06-19');

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
    ('12345678966', 1, 32.5),
    ('12345678966', 2, 7.5),
    ('66688444476', 3, 40.0),    
    ('45345345376', 1, 20.0),
    ('45345345376', 2, 20.0),
    ('33344555587', 2, 10.0),    
    ('33344555587', 3, 10.0),
    ('33344555587', 10, 10.0),
    ('33344555587', 20, 10.0),    
    ('99988777767', 30, 30.0),
    ('99988777767', 10, 10.0),
    ('98798798733', 10, 35.0),    
    ('98798798733', 30, 5.0),
    ('98765432168', 30, 20.0),
    ('98765432168', 20, 15.0),
    ('88866555576', 20, NULL);

SELECT * FROM TRABALHA_EM

INSERT INTO DEPENDENTE 
    (Fcpf, Nome_dependente, Sexo, Datanasc, Parentesco)
VALUES
    ('33344555587', 'Alicia', 'F', '1966-04-05', 'Filha'),
    ('33344555587', 'Tiago', 'M', '1983-10-25', 'Filho'),
    ('33344555587', 'Janaina', 'F', '1958-05-03', 'Esposa'),    
    ('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido'),    
    ('12345678966', 'Michael', 'M', '1988-01-04', 'Filho'),
    ('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha'),
    ('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');

SELECT * FROM DEPENDENTE

SELECT * FROM FUNCIONARIO WHERE Dnr = 4 AND Salario < 40000 
SELECT * FROM FUNCIONARIO WHERE Endereco like '%São Paulo%'

SELECT Pnome, Endereco 
FROM FUNCIONARIO F 
    INNER JOIN DEPARTAMENTO D 
        ON F.Dnr = D.Dnumero
WHERE D.Dnome = "Pesquisa"   

SELECT DISTINCT COUNT(*) Salario FROM FUNCIONARIO

SELECT * FROM PROJETO P JOIN DEPARTAMENTO D ON (P.Dnum = D.Dnumero) 
WHERE D.Dnome like '%Pesquisa' ORDER BY P.Projnome DESC

SELECT D.Dnome, D.Cpf_gerente FROM DEPARTAMENTO D JOIN LOCALIZACOES_DEP L 
    ON(D.Dnumero = L.Dnumero) WHERE L.Dlocal = 'Santo André' 

SELECT F2.Pnome as NomeFuncionario, F2.Unome as SobrenomeFuncionario, F1.Pnome as NomeSupervisor, F1.Unome as SobrenomeSupervisor 
FROM FUNCIONARIO F1 JOIN FUNCIONARIO F2 ON (F2.Cpf_supervisor = F1.Cpf)

SELECT Pnome as NomeFuncionario FROM FUNCIONARIO WHERE Cpf_supervisor IS NULL

SELECT DISTINCT COUNT(Nome_dependente) as qtd_dependente, Fcpf, F.Pnome
FROM FUNCIONARIO F JOIN DEPENDENTE D ON(F.CPF = D.Fcpf) 
GROUP BY Fcpf having qtd_dependente > 2

SELECT D.Dnumero as "Num_Departamento", count(f.Dnr) as "Num_de_Funcionarios", avg(f.Salario) as "Salario_Medio"
FROM FUNCIONARIO F INNER JOIN DEPARTAMENTO D ON(f.Dnr = D.Dnumero) 
GROUP BY D.Dnumero

CREATE VIEW SALARIOS_DEPARTAMENTOS AS (
    SELECT D.Dnumero as "Num_Departamento", count(f.Dnr) as "Num_de_Funcionarios", avg(f.Salario) as "Salario_Medio"
    FROM FUNCIONARIO F INNER JOIN DEPARTAMENTO D ON(f.Dnr = D.Dnumero) 
    GROUP BY D.Dnumero
)
SELECT * FROM SALARIOS_DEPARTAMENTOS WHERE Salario_Medio > 32000


/*DROP TABLE FUNCIONARIO, DEPARTAMENTO, LOCALIZACOES_DEP, PROJETO, TRABALHA_EM, DEPENDENTE
DROP TABLE LOCALIZACOES_DEP, PROJETO
DROP TABLE TRABALHA_EM, DEPENDENTE*/