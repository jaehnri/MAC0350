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

-- Instituto
INSERT INTO instituto
VALUES (1, "HUSP"),
       (2, "Sirio-libanes"),
       (3, "Albert Einstein");

-- Usuario
INSERT INTO usuario (id, nome, endereco, data_nascimento, login, senha, id_instituto)
VALUES (1, "Mateus Cordeiro", "Rua do Pao, 12", "2002-04-13 12:00:10.000000+00", "pao", "manteiga", 1)
       (2, "Cícero Brandão" , "Rua Benedita, 10", "2002-04-13 12:00:10.000000+00", "cicero", "13042002", 1)
       (3, "Jonas Souza", "Rua garrafinha, 200", "2002-04-13 12:00:10.000000+00", "umlogin", "umasenha", 1)
       (4, "Sandro Amaral", "Rua Cenoura, 517", "2002-04-13 12:00:10.000000+00", "mylogin", "mypass", 1)
       (5, "Érico Nazário", "Rua MousePad, 3108", "2002-04-13 12:00:10.000000+00", "gogogo", "comecomecome", 1)
       (6, "Natália Nakamura", "Avenida Telefonica, 10", "2002-04-13 12:00:10.000000+00", "caneta", "papel", 1)
       (7, "Laura Martins", "Rua do Pote, 1000", "2002-04-13 12:00:10.000000+00", "almaco", "cenoura", 1)
       (8, "Vitória Paz", "Avenida das Flores", "2002-04-13 12:00:10.000000+00", "pazinha", "vitoria", 1)
       (9, "Fabíola Sato", "Travessa do Armario", "2002-04-13 12:00:10.000000+00", "fabi123", "armario4", 1)
       (10, "Estela Paschoal", "Rua sem nome", "2002-04-13 12:00:10.000000+00", "star", "semsenha4321", 1)
       (11, 'Anastasia Simas Canário', 'Rua da Flor, 123', '2002-09-12 22:38:54.975379+00', 'anastasia', 'Senha123', 1),
       (12, 'Nair Lira Brás', 'Rua da Planta, 4535', '2002-09-12 22:38:54.975379+00', 'nairlira', 'Senha123', 1),
       (13, 'Luan Correia Araujo', 'Rua do Pote, 645', '2002-09-12 22:38:54.975379+00', 'luancorreia', 'Senha123', 2),
       (14, 'Esperança Homem Paula', 'Avenida da Saudade, 544', '2002-09-12 22:38:54.975379+00', 'esperanca', 'Senha123', 2),
       (15, 'Sabrina Quintal Colares', 'Rua do Roteador, 456', '2002-09-12 22:38:54.975379+00', 'sabrinaquintal', 'Senha123', 2),
       (16, 'Inácio Malafaia Ponte', 'Rua dos Copos, 4756', '2002-09-12 22:38:54.975379+00', 'inacioponte', 'Senha123', 2),
       (17, 'Isaías Loureiro Macena', 'Rua das Mesas, 356', '2002-09-12 22:38:54.975379+00', 'isaiasmacena', 'Senha123', 2),
       (18, 'Danilson Faia Paula', 'Rua dos Colchões, 345', '2002-09-12 22:38:54.975379+00', 'danilsonfaia', 'Senha123', 2),
       (19, 'Carlota Salgado Goulão', 'Rua de Mel, 534', '2002-09-12 22:38:54.975379+00', 'carlotagoulao', 'Senha123', 2),
       (20, 'Mila Maia Fazendeiro', 'Rua das Pedras, 11', '2002-09-12 22:38:54.975379+00', 'milamaia', 'Senha123', 3);

-- Perfil
INSERT INTO perfil (id, tipo)
VALUES (1, "Pesquisador"),
       (2, "Atendente"),
       (3, "Aplicador"),
       (4, "Diretor"),
       (5, "Coordenador");

-- Servico
INSERT INTO servico (id, nome, descricao)
VALUES (1, "InsExame", "Inserir um novo tipo de exame"),
       (2, "InsVirus", "Inserir um novo tipo de virus"),
       (3, "InsPerfil", "Inserir um novo perfil"),
       (4, "InsPaciente", "Inserir um novo paciente"),
       (5, "InsAplicacao", "Inserir uma aplicacao de exame");

-- HABILITA
INSERT INTO rel_perfil_servico (id_perfil, id_servico)
VALUES (1, 1), (1, 2),
       (2, 4),
       (3, 4), (3, 5),
       (4, 1), (4, 2), (4, 3), (4, 4), (4, 5)
       (5, 1), (5, 2), (5, 4), (5, 5);
