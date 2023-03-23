create table empresa (
	nif_fornecedor	int,
	nif				int,

	primary key (nif)
);

create table produto (
	codigo				int,
	nif_empresa			int,
	nome				varchar(30),
	iva					float,
	preco				float,
	quantidade_armazem	int,

	primary key (codigo, nif_empresa),
	foreign key (nif_empresa) references empresa(nif)
);

create table tipo_fornecedor (
	designacao		varchar(30),
	cod_interno		int,

	primary key (cod_interno)
);

create table fornecedor (
	nif						int,
	tipo_cod_interno		int,
	nome					varchar(30),
	fax						varchar(9),
	endereco				varchar(30),
	condicao_pagamento		int,

	primary key (nif),
	foreign key (tipo_cod_interno) references tipo_fornecedor(cod_interno),
);

create table encomenda (
	num				int,
	nif_empresa		int,
	data_encomenda	date,
	nif_fornecedor	int,

	primary key (num, nif_empresa, nif_fornecedor),
	foreign key (nif_empresa) references empresa(nif),
	foreign key (nif_fornecedor) references fornecedor(nif)
);

create table tem (
	quantidade		int,
	encomenda_num	int,
	codigo_produto	int,
	nif_empresa		int,

	primary key (encomenda_num, codigo_produto),
	foreign key (codigo_produto, nif_empresa) references produto(codigo, nif_empresa)
);

create table fornece (
	nif_empresa		int,
	nif_fornecedor	int,

	primary key (nif_empresa, nif_fornecedor),
	foreign key (nif_empresa) references empresa(nif),
	foreign key (nif_fornecedor) references fornecedor(nif)
);