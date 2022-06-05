CREATE TABLE exame (
    id uuid PRIMARY KEY,
    tipo text NOT NULL,
    descricao text
);

CREATE TABLE virus (
    id uuid PRIMARY KEY,
    nome text NOT NULL
);

CREATE TABLE paciente (
    id uuid PRIMARY KEY,
    nome text NOT NULL,
    endereco text NOT NULL,
    data_nascimento timestamp NOT NULL
);

CREATE TABLE amostra (
    id uuid PRIMARY KEY,
    tipo_material text NOT NULL
);

CREATE TABLE instituto (
    id uuid PRIMARY KEY,
    nome text NOT NULL,
    endereco text NOT NULL
);

CREATE TABLE usuario (
    id uuid PRIMARY KEY,
    nome text NOT NULL,
    endereco text NOT NULL,
    data_nascimento timestamp NOT NULL,
    login text NOT NULL,
    senha text NOT NULL,
    id_instituto uuid NOT NULL,
    CONSTRAINT fk_id_instituto FOREIGN KEY (id_instituto) REFERENCES instituto(id) -- Trabalha-Em
);

CREATE TABLE tutor (
    id uuid PRIMARY KEY,
    CONSTRAINT fk_id_tutor FOREIGN KEY (id) REFERENCES usuario(id)
);

CREATE TABLE tutelado (
    id uuid PRIMARY KEY,
    tipo text NOT NULL,
    CONSTRAINT fk_id_tutelado FOREIGN KEY (id) REFERENCES usuario(id)
);

CREATE TABLE perfil (
    id uuid PRIMARY KEY,
    tipo text NOT NULL
);

CREATE TABLE servico (
    id uuid PRIMARY KEY,
    acao text NOT NULL,
    nome text NOT NULL,
    descricao text null
);

-- ==============================================================

-- Tutela
CREATE TABLE rel_tutor_tutelado (
    id_tutor uuid NOT NULL,
    id_tutelado uuid PRIMARY KEY,
    id_perfil uuid NOT NULL,
    CONSTRAINT fk_id_tutelado FOREIGN KEY (id_tutelado) REFERENCES tutelado(id),
    CONSTRAINT fk_id_tutor FOREIGN KEY (id_tutor) REFERENCES tutor(id),
    CONSTRAINT fk_id_perfil FOREIGN KEY (id_perfil) REFERENCES perfil(id)
);

-- Habilita
CREATE TABLE rel_tutela_servico {
    id_tutelado uuid NOT NULL,
    id_servico uuid NOT NULL,
    CONSTRAINT rel_tutela_servico_pk PRIMARY KEY (id_tutelado, id_servico)
    CONSTRAINT fk_id_tutelado FOREIGN KEY (id_tutelado) REFERENCES rel_tutor_tutelado(id_tutelado)
    CONSTRAINT fk_id_tutelado FOREIGN KEY (id_servico) REFERENCES servico(id_tutelado)
}

-- Identifica
CREATE TABLE rel_exame_virus (
    id_exame uuid NOT NULL,
    id_virus uuid NOT NULL,
    CONSTRAINT rel_exame_virus_pk PRIMARY KEY (id_exame, id_virus),
    CONSTRAINT fk_id_exame FOREIGN KEY (id_exame) REFERENCES exame(id),
    CONSTRAINT fk_id_virus FOREIGN KEY (id_virus) REFERENCES virus(id)
);

-- Aplicação
CREATE TABLE rel_paciente_amostra_exame (
    id_exame uuid NOT NULL,
    id_amostra uuid NOT NULL,
    id_paciente uuid NOT NULL,
    data_exame timestamp,
    data_coleta timestamp,
    resultado boolean,
    CONSTRAINT rel_paciente_amostra_exame_pk PRIMARY KEY (id_exame, id_amostra, id_paciente),
    CONSTRAINT fk_id_exame FOREIGN KEY (id_exame) REFERENCES exame(id),
    CONSTRAINT fk_id_amostra FOREIGN KEY (id_amostra) REFERENCES amostra(id),
    CONSTRAINT fk_id_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id)
);

-- Habilita
CREATE TABLE rel_perfil_servico (
    id_perfil uuid NOT NULL,
    id_servico uuid NOT NULL,
    CONSTRAINT rel_perfil_servico_pk PRIMARY KEY (id_perfil, id_servico),
    CONSTRAINT fk_id_perfil FOREIGN KEY (id_perfil) REFERENCES perfil(id),
    CONSTRAINT fk_id_servico FOREIGN KEY (id_servico) REFERENCES servico(id)
);

-- Tem-Perfil
CREATE TABLE rel_usuario_perfil (
    id_perfil uuid NOT NULL,
    id_usuario uuid NOT NULL,
    CONSTRAINT rel_perfil_usuario_pk PRIMARY KEY (id_perfil, id_usuario),
    CONSTRAINT fk_id_perfil FOREIGN KEY (id_perfil) REFERENCES perfil(id),
    CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

-- Audita
CREATE TABLE rel_usuario_perfil (
	id_usuario uuid NOT NULL,
	id_servico uuid NOT NULL,
	data_inicio timestamp,
	data_fim timestamp,
	CONSTRAINT fk_id_servico FOREIGN KEY (id_servico) REFERENCES servico(id)
	CONSTRAINT fk_id_usuario FOREIGN KEY (id_servico) REFERENCES usuario(id)
);

-- Restringe
CREATE TABLE rel_tutela_servico (
    id_tutelado uuid NOT NULL,
    id_perfil uuid NOT NULL,
    id_servico uuid NOT NULL,
    CONSTRAINT rel_usuario_servico_pk PRIMARY KEY (id_perfil, id_servico),
    CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES tutelado(id),
    CONSTRAINT fk_id_perfil FOREIGN KEY (id_perfil) REFERENCES tutelado(id_perfil),
    CONSTRAINT fk_id_servico FOREIGN KEY (id_servico) REFERENCES servico(id)
);
