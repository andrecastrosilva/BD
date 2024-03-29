CREATE TABLE PESSOA (
	nome VARCHAR(50) NOT NULL,
	num_cc VARCHAR(12) NOT NULL,
	morada VARCHAR(50) NOT NULL,
	data_nasc DATE NOT NULL,
	PRIMARY KEY (num_cc)
);

CREATE TABLE TURMA (
	designacao VARCHAR(100) NOT NULL,
	id VARCHAR(50) NOT NULL,
	ano_letivo INT NOT NULL,
	max_alunos INT NOT NULL CHECK (max_alunos > 0),
	PRIMARY KEY (id)
);

CREATE TABLE ALUNO (
	num_cc VARCHAR(12) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	morada VARCHAR(50) NOT NULL,
	data_nasc DATE NOT NULL,
	PRIMARY KEY (num_cc),
	FOREIGN KEY (num_cc) REFERENCES PESSOA(num_cc),
);

CREATE TABLE ENC_EDUCACAO (
	email VARCHAR(50) NOT NULL,
	num_cc_educando VARCHAR(12) NOT NULL,
	telefone VARCHAR(9) NOT NULL,
	autorizado BIT NOT NULL,
	PRIMARY KEY (num_cc_educando, email),
	FOREIGN KEY (num_cc_educando) REFERENCES ALUNO(num_cc),
);

CREATE TABLE PROFESSOR (
	telefone VARCHAR(9) NOT NULL,
	id_turma VARCHAR(50) NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	num_func INT NOT NULL CHECK (num_func > 0),
	num_cc VARCHAR(12) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	morada VARCHAR(50) NOT NULL,
	data_nasc DATE NOT NULL,
	PRIMARY KEY (num_cc),
	FOREIGN KEY (num_cc) REFERENCES PESSOA(num_cc),
	FOREIGN KEY (id_turma) REFERENCES TURMA(id),
);

CREATE TABLE ATIVIDADE (
	designacao VARCHAR(100) NOT NULL,
	id VARCHAR(50) NOT NULL,
	custo INT NOT NULL CHECK (custo >= 0),
	PRIMARY KEY (id)
);

CREATE TABLE TEM (
	id_atividade VARCHAR(50) NOT NULL,
	id_turma VARCHAR(50) NOT NULL,
	PRIMARY KEY (id_atividade, id_turma),
	FOREIGN KEY (id_atividade) REFERENCES ATIVIDADE(id),
	FOREIGN KEY (id_turma) REFERENCES TURMA(id)
);

CREATE TABLE FREQUENTA (
	id_atividade VARCHAR(50) NOT NULL,
	num_cc VARCHAR(12) NOT NULL,
	id_turma VARCHAR(50) NOT NULL,
	PRIMARY KEY (id_atividade, num_cc),
	FOREIGN KEY (id_atividade) REFERENCES ATIVIDADE(id),
	FOREIGN KEY (num_cc) REFERENCES ALUNO(num_cc),
	FOREIGN KEY (id_turma) REFERENCES TURMA(id)
);