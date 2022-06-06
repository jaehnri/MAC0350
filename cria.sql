CREATE TABLE exame (
    id int PRIMARY KEY,
    tipo text NOT NULL,
    descricao text
);

CREATE TABLE virus (
    id int PRIMARY KEY,
    nome text NOT NULL
);

CREATE TABLE paciente (
    id int PRIMARY KEY,
    nome text NOT NULL,
    endereco text NOT NULL,
    data_nascimento timestamp NOT NULL
);

CREATE TABLE amostra (
    id int PRIMARY KEY,
    tipo_material text NOT NULL
);

CREATE TABLE instituto (
    id int PRIMARY KEY,
    nome text NOT NULL,
    endereco text NOT NULL
);

CREATE TABLE usuario (
    id int PRIMARY KEY,
    nome text NOT NULL,
    endereco text NOT NULL,
    data_nascimento timestamp NOT NULL,
    login text NOT NULL,
    senha text NOT NULL,
    id_instituto int NOT NULL,
    CONSTRAINT fk_id_instituto FOREIGN KEY (id_instituto) REFERENCES instituto(id) -- Trabalha-Em
);

CREATE TABLE tutor (
    id int PRIMARY KEY,
    data_inicio timestamp NOT NULL,
    CONSTRAINT fk_id_tutor FOREIGN KEY (id) REFERENCES usuario(id)
);

CREATE TABLE tutelado (
    id int PRIMARY KEY,
    tipo text NOT NULL,
    id_tutor int NOT NULL,
    id_perfil int NOT NULL,
    CONSTRAINT fk_id_tutelado FOREIGN KEY (id) REFERENCES usuario(id)
    CONSTRAINT fk_id_tutor FOREIGN KEY (id_tutor) REFERENCES tutor(id),
    CONSTRAINT fk_id_perfil FOREIGN KEY (id_perfil) REFERENCES perfil(id)
);

CREATE TABLE perfil (
    id int PRIMARY KEY,
    tipo text NOT NULL
);

CREATE TABLE servico (
    id int PRIMARY KEY,
    nome text NOT NULL,
    descricao text null
);

-- ==============================================================

-- Identifica
CREATE TABLE rel_exame_virus (
    id_exame int NOT NULL,
    id_virus int NOT NULL,
    CONSTRAINT rel_exame_virus_pk PRIMARY KEY (id_exame, id_virus),
    CONSTRAINT fk_id_exame FOREIGN KEY (id_exame) REFERENCES exame(id),
    CONSTRAINT fk_id_virus FOREIGN KEY (id_virus) REFERENCES virus(id)
);

-- Aplicação
CREATE TABLE rel_paciente_amostra_exame (
    id_exame int NOT NULL,
    id_amostra int NOT NULL,
    id_paciente int NOT NULL,
    data_exame timestamp,
    data_coleta timestamp,
    CONSTRAINT rel_paciente_amostra_exame_pk PRIMARY KEY (id_exame, id_amostra, id_paciente, data_exame),
    CONSTRAINT fk_id_exame FOREIGN KEY (id_exame) REFERENCES exame(id),
    CONSTRAINT fk_id_amostra FOREIGN KEY (id_amostra) REFERENCES amostra(id),
    CONSTRAINT fk_id_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id)
);

-- Habilita
CREATE TABLE rel_perfil_servico (
    id_perfil int NOT NULL,
    id_servico int NOT NULL,
    CONSTRAINT rel_perfil_servico_pk PRIMARY KEY (id_perfil, id_servico),
    CONSTRAINT fk_id_perfil FOREIGN KEY (id_perfil) REFERENCES perfil(id),
    CONSTRAINT fk_id_servico FOREIGN KEY (id_servico) REFERENCES servico(id)
);

-- Tem-Perfil
CREATE TABLE rel_usuario_perfil (
    id_perfil int NOT NULL,
    id_usuario int NOT NULL,
    CONSTRAINT rel_perfil_usuario_pk PRIMARY KEY (id_perfil, id_usuario),
    CONSTRAINT fk_id_perfil FOREIGN KEY (id_perfil) REFERENCES perfil(id),
    CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

-- Audita
CREATE TABLE rel_usuario_servico (
	id_usuario int NOT NULL,
	id_servico int NOT NULL,
	data_inicio timestamp,
	data_fim timestamp,
    CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id),
	CONSTRAINT fk_id_servico FOREIGN KEY (id_servico) REFERENCES servico(id)
);

-- Restringe
CREATE TABLE rel_tutela_servico (
    id_tutelado int NOT NULL,
    id_servico int NOT NULL,
    CONSTRAINT rel_usuario_servico_pk PRIMARY KEY (id_tutelado, id_servico),
    CONSTRAINT fk_id_tutelado FOREIGN KEY (id_tutelado) REFERENCES tutelado(id),
    CONSTRAINT fk_id_servico FOREIGN KEY (id_servico) REFERENCES servico(id)
);
