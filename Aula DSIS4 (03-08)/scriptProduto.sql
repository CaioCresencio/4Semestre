create sequence seq_produto 
	start with 1 increment by 1;

create table Produto(
  idProduto integer not null,
  nomeProduto varchar(50) not null,
  dataFabProduto date not null,
  estoqueProduto integer not null,
  precoProduto decimal(7,2), 
  constraint pk_idProduto primary key(idProduto));