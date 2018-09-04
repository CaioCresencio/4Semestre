create sequence aula6_seq_produto 
	start with 1 increment by 1;
	
create sequence aula6_seq_venda 
	start with 1 increment by 1;

create table aula6_produto(
	id_produto integer not null,
	nome_produto varchar(50) not null,
	estoque_produto integer not null,
	preco_produto decimal(7,2), 
	constraint aula6_pk_idProduto primary key(id_produto)
);
  
create table aula6_venda(
	numero_venda integer not null,
	data_venda date not null,
	quantidade_venda integer not null,
	id_produto integer not null,
	constraint aula6_pk_numeroVenda primary key(numero_venda),
	constraint aula6_fk_idProduto foreign key(id_produto) references aula6_produto(id_produto)
);
	
select * from aula6_produto;

select * from aula6_venda;

select v.numero_venda,v.data_venda,v.quantidade_venda,id_produto,nome_produto,
(v.quantidade_venda * preco_produto) as total
from aula6_venda v 
join aula6_produto p 
using(id_produto);

select * from (
(select e.*,rownum rn
from
(select v.numero_venda,v.data_venda,v.quantidade_venda,id_produto,nome_produto,
(v.quantidade_venda * preco_produto) as total
from aula6_venda v 
join aula6_produto p 
using(id_produto) order by numero_venda) e
where rownum <= 10 ) ) where rn >= 1;

delete aula6_produto;
delete aula6_venda;
drop sequence aula6_seq_venda;