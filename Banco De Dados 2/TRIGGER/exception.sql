
SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER exception_teste
    BEFORE UPDATE OF salario ON emp.funcionarios
    FOR EACH ROW
    WHEN(NEW.salario < OLD.salario)
BEGIN
    raise_application_error(-20111,'Salarios não podem ser reduzidos!');

END;
/

UPDATE funcionarios SET salario = 1;