update temp
set salary = 10000
where last_name = 'Greene';

select salary from temp
where last_name in ('Banda','Greene');

UPDATE temp
SET salary = 7000 
WHERE last_name = 'Banda';

SAVEPOINT after_banda_sal;

UPDATE temp
SET salary = 11000 
WHERE last_name = 'Greene';

ROLLBACK TO SAVEPOINT
after_banda_sal;

SAVEPOINT 
before_greene_sal;


update temp
SET salary = 12000 
WHERE last_name = 'Greene';

UPDATE temp
SET salary = 8000 
WHERE last_name = 'Banda';

ROLLBACK 
TO SAVEPOINT
before_greene_sal;

COMMIT;

UPDATE temp
SET salary = 7050 
WHERE last_name = 'Banda';

UPDATE temp
SET salary = 10950 
WHERE last_name = 'Greene';

rollback;

