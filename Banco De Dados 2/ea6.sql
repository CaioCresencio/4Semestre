create table produto (
id_produto int primary key,
nome varchar(20) not null,
estoque int not null,
preco float not null);

create table item_venda(
id_item int primary key,
quantidade int not null,
id_produto int not null,
id_venda int not null,
foreign key (id_produto) references produto(id_produto) on delete cascade,
foreign key (id_venda) references venda(id_venda) on delete cascade);

create table venda(
id_venda int primary key,
data_v date not null);


create sequence seq_produto
start with 1
increment by 1
maxvalue 9999
nocycle;


create sequence seq_item
start with 1
increment by 1
maxvalue 9999
nocycle;
insert into venda (id_venda,data_v) values (1,sysdate);

insert into item_venda (id_item,quantidade,id_produto,id_venda) values(seq_item.nextval,2,1,1);
insert into produto (id_produto,nome,estoque,preco) values (seq_produto.nextval,'teste2',1,22);
drop sequence seq_produto;

delete from produto;
select * from venda;
select * from produto;
select * from item_venda;