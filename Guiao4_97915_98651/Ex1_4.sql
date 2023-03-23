

create table medicamentos_medico (
	numero_sns		int,
	nome			varchar(30),
	especialidade	varchar(30),

	primary key (numero_sns)
);

create table medicamentos_paciente (
	no_utente		int,
	data_nascimento date,
	nome			varchar(30),
	endereco		varchar(30),

	primary key (no_utente)
);

create table medicamentos_farmacia (
	telefone	varchar(9),
	endereço	varchar(30),
	nome		varchar(30),
	nif			int,

	primary key (nif)
);

create table medicamentos_farmaceutica (
	no_registo		int,
	telefone		varchar(9),
	endereço		varchar(30),
	nome			varchar(30),

	primary key (no_registo)
);

create table medicamentos_prescricao (
	numero_unico		int,
	data_				date,
	medico_numero_sns	int,
	no_utente_paciente	int,
	nif_farmacia		int,

	primary key (numero_unico),
	foreign key (nif_farmacia) references medicamentos_farmacia(nif),
	foreign key (medico_numero_sns) references medicamentos_medico(numero_sns),
	foreign key (no_utente_paciente) references medicamentos_paciente(no_utente)
);

create table medicamentos_farmaco (
	no_registo_farmaceutica		int,
	formula						varchar(30),
	nome						varchar(30),

	primary key (no_registo_farmaceutica, nome),
	foreign key (no_registo_farmaceutica) references medicamentos_farmaceutica(no_registo),
);

create table medicamentos_tem (
	no_unico_prescricao int,
	nome_farmaco varchar(30),
	no_registo_farmaceutica int,
	primary key (no_unico_prescricao, nome_farmaco),
	foreign key (no_registo_farmaceutica, nome_farmaco) references medicamentos_farmaco(no_registo_farmaceutica, nome),
	foreign key (no_unico_prescricao) references medicamentos_prescricao(numero_unico),
);