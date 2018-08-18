select * from produto;
delete produto;

drop sequence id_produto;
create sequence id_produto
start with 1
increment by 1;

select * from produto;

select * from (
(select e.*,rownum rn
from
(select * from produto order by idproduto) e
where rownum <= 210) ) where rn >= 1;