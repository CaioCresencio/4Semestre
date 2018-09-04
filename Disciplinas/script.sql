insert into disciplina (codigo_disc,nome_disc) values(1,'POO');
insert into disciplina (codigo_disc,nome_disc) values(2,'EDA');
insert into disciplina (codigo_disc,nome_disc) values(3,'LPE');
insert into requisitos (nome_disc,requisito) values ('POO','EDA');
insert into requisitos (nome,requisito) values ('POO','LPE');

select d.*, r.disciplina from disciplina d where nome = (select r.disciplina from requisitos r);
select * from disciplina join requisitos using(nome_disc);
select * from requisitos where nome_disc like 'POO' and requisito like 'EDA';
select * from disciplina;
select * from requisitos;
delete disciplina where nome_disc like 'LPV';
create table disciplina (
nome_disc varchar(20) primary key,
codigo_disc int not null
);

create table requisitos(
nome_disc varchar(20) not null,
requisito varchar(20) not null,
constraint ref_disciplina foreign key (nome_disc) references disciplina(nome_disc),
constraint ref_requisito foreign key (requisito) references disciplina(nome_disc),
primary key (nome_disc,requisito));

delete disciplina;
delete requisitos;

create sequence seq_disciplina
start with 1
increment by 1
nocycle;

drop table disciplina;
drop table requisitos;