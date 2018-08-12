select * from (
(select e.*,rownum rn
from
(select * from employees order by employee_id) e
where rownum <= 50 ) ) where rn >= 6;