SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER limite
    BEFORE INSERT OR UPDATE OF salario ON emp.funcionarios
    FOR EACH ROW
    WHEN (NEW.salario > 20000)
DECLARE

BEGIN
    :NEW.salario := :OLD.salario;
    DBMS_OUTPUT.PUT_LINE('Isso não é permitido! Chamei a puliça.' || :NEW.salario);
END;
/
CREATE OR REPLACE TRIGGER limite
    BEFORE INSERT OR UPDATE OF salario ON emp.funcionarios
    FOR EACH ROW
    
DECLARE
    avg_sal NUMBER;
BEGIN
    SELECT AVG(SALARIO) INTO avg_sal FROM funcionarios;
    IF :NEW.salario > avg_sal THEN
        :NEW.salario := :OLD.salario;
        DBMS_OUTPUT.PUT_LINE('Isso não é permitido! Chamei a puliça.' || :NEW.salario);    
    END IF;
END;
/



