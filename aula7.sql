select * from aula6_venda order by numero_venda;

create table disciplina (
nome varchar(20) not null primary key,
codigo int not null
);

create table requisitos(
nome varchar(20) not null,
requisito varchar(20) not null,
constraint ref_disciplina foreign key (nome) references disciplina(nome),
constraint ref_requisito foreign key (requisito) references disciplina(nome),
primary key (nome,requisito));