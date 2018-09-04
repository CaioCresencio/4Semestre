create user user1 identified by user1 default tablespace users
quota 5m on users
temporary tablespace temp;

drop user usuario3 cascade;

grant create session
to user1;

grant create table
to user1;

grant select on
hr.employees
to user1;

select xid,status,start_time
from
v$transaction;


---------preparacao-------
create user user2 identified by user2 default tablespace users
quota 5m on users
temporary tablespace temp;

grant update
on user1.temp
to user2;

grant select on
user1.temp
to user2;

