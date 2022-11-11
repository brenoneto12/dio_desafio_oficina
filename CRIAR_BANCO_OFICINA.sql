create database oficina;
use oficina;
create table cliente
(
		idCliente int auto_increment primary key,
        nome varchar(50) not null,
        endereco varchar(255),
        telefone char(9),
        CPF char(11) not null,
        constraint unique_cpf_cliente unique (CPF)
);

create table servico
(
		idServico int auto_increment primary key,
        nome_servico varchar(255) not null
);

create table pecas
(
		idPecas int auto_increment primary key,
        nome_peca varchar(255) not null,
        valor_peca float not null
);

create table veiculo
(
		idVeiculo int auto_increment primary key,
        idCliente int not null,
        marca varchar(50) not null,
        modelo varchar(50) not null,
        cor varchar(50) not null,
        ano int not null,
        km int not null,
        constraint fk_client foreign key (idCliente) references cliente (idCliente)
);

create table equipe_mecanicos
(
		idMecanico int auto_increment primary key,
        idVeiculo int not null,
        nome varchar(50) not null,
        endereco varchar(50) not null,
        especialidade varchar(50) not null,
        constraint fk_veiculo foreign key (idVeiculo) references veiculo (idVeiculo)
);

create table os
(
		idOs int auto_increment primary key,
        idMecanico int not null,
        data_emissao date not null,
        valor float not null,
        status_os enum("Orcamento", "Em manutenção", "Concluido") default "Orcamento",
        data_concluido date,
        constraint fk_equipe_mecanicos foreign key (idMecanico) references equipe_mecanicos (idMecanico)
);

create table servico_os
(
	idServico int,
    idOs int,
    valor_mao_de_obra float not null,
    primary key (idServico, idOs),
    constraint fk_servico foreign key (idServico) references servico (idServico),
    constraint fk_os foreign key (idOs) references os (idOs)
);

create table pecas_os
(
	idPecas int,
    idOs int,
    valor_pecas float not null,
    primary key (idPecas, idOs),
    constraint fk_pecas foreign key (idPecas) references pecas (idPecas),
    constraint fk_pecas_os foreign key (idOs) references os (idOs)
);

alter table cliente auto_increment=1;
alter table servico auto_increment=1;
alter table pecas auto_increment=1;
alter table veiculo auto_increment=1;
alter table equipe_mecanicos auto_increment=1;
alter table os auto_increment=1;

