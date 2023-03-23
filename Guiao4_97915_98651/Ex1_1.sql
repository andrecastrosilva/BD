/*create schema RentACar

go*/

create table RentACar.cliente(
		nif				int,
		num_carta		int,
		nome			varchar(30),
		endereco		varchar(30),

		primary key (nif),
);
create table RentACar.aluguer(
		data_aluguer		date,
		numero				int,
		duracao				int,
		nif_cliente			int,
		num_balcao			int,
		matricula_veiculo	varchar(10),

		primary key(numero)
);

create table RentACar.balcao(
		numero		int,
		nome		varchar(30),
		endereco	varchar(30),
		
		primary key(numero),
);

create table RentACar.veiculo(
		matricula		varchar(10),
		marca			varchar(9),
		ano				int,
		tipo_veiculo	int,

		primary key (matricula),
);

create table RentACar.tipo_veiculo(
		designacao		varchar(30),
		arcondicionado	varchar(30),
		codigo			int,

		primary key(codigo),
);

create table RentACar.similaridade(
		codigo_tipo_1	int,
		codigo_tipo_2	int,

		primary key(codigo_tipo_1, codigo_tipo_2),
);

create table RentACar.ligeiro(
		numlugares		int,
		portas			int,
		combustivel		varchar(30),
		codigo_tipo		int,

		primary key(codigo_tipo)
);

create table RentACar.pesado(
		peso			int,
		passageiros		int,
		codigo_tipo		int,

		primary key(codigo_tipo)
);

alter table RentACar.ligeiro add foreign key (codigo_tipo) references RentACar.tipo_veiculo(codigo);
alter table RentACar.pesado add foreign key (codigo_tipo) references RentACar.tipo_veiculo(codigo);

alter table RentACar.similaridade add foreign key (codigo_tipo_1) references RentACar.tipo_veiculo(codigo);
alter table RentACar.similaridade add foreign key (codigo_tipo_2) references RentACar.tipo_veiculo(codigo);

alter table RentACar.veiculo add foreign key (tipo_veiculo) references RentACar.tipo_veiculo(codigo);

alter table RentACar.aluguer add foreign key (nif_cliente) references RentACar.cliente(nif);
alter table RentACar.aluguer add foreign key (num_balcao) references RentACar.balcao(numero);
alter table RentACar.aluguer add foreign key (matricula_veiculo) references RentACar.veiculo(matricula);