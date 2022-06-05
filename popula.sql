-- Exame
INSERT INTO exame (id, tipo, descricao)
VALUES (1, 'Hemograma', 'Avaliar saúde das hemácias, leucócitos e plaquetas.'),
       (2, 'Exame de urina', 'Detectar infecção urinária.'),
       (3, 'Exame de fezes', 'De'),
       (4, 'PCR', 'Detectar COVID-19'),
       (5, 'Dosagem de anticorpos', 'Detectar a presença do HIV.');

-- Vírus
INSERT INTO virus (id, nome)
VALUES (1, 'HIV'),
       (2, 'COVID-19'),
       (3, 'Rinovírus'),
       (4, 'Poliovírus'),
       (5, 'Rotavírus');

-- Paciente
INSERT INTO paciente (id, nome, endereco, data_nascimento)
VALUES (1, 'João Henri Carrenho Rocha', 'Rua das Flores, 189', '2002-09-12 22:38:54.975379+00'),
       (2, 'Max Cabrajac Goritz', 'Rua das Amoras, 234', '2002-04-12 22:38:54.975379+00'),
       (3, 'Heloisa Rei Pardo', 'Rua das Casas, 213', '2002-09-12 22:38:54.975379+00'),
       (4, 'Neide Franco Meneses', 'Rua do Carmo, 789', '2002-09-12 22:38:54.975379+00'),
       (5, 'Nicolas Henrique Carreiro', 'Rua das Naves, 123', '2002-09-12 22:38:54.975379+00');

-- Amostra
INSERT INTO amostra (id, tipo_material)
VALUES (1, 'Fezes'),
       (2, 'Urina'),
       (3, 'Sangue'),
       (4, 'Saliva');

-- Identifica
INSERT INTO rel_exame_virus (id_exame, id_virus)
VALUES (1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
       (2, 1), (2, 5),
       (3, 4),
       (4, 2),
       (5, 1)
