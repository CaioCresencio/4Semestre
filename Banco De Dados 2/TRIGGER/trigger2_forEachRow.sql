SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER dml_func
    BEFORE INSERT OR UPDATE OR DELETE ON emp.funcionarios
BEGIN
    CASE
        WHEN INSERTING THEN
            DBMS_OUTPUT.PUT_lINE('Funcionario inserido');
        WHEN UPDATING THEN
            DBMS_OUTPUT.PUT_lINE('Funcionario atualizado');
        WHEN DELETING THEN
            DBMS_OUTPUT.PUT_lINE('Funcionario removido');
    END CASE;
    
END;
/
CREATE OR REPLACE TRIGGER dml_func
    BEFORE INSERT 
    OR UPDATE OF data_contr, salario 
    OR DELETE ON emp.funcionarios
    FOR EACH ROW -- EXECUTA PARA CADA LINHA
BEGIN
    CASE
        WHEN INSERTING THEN
            DBMS_OUTPUT.PUT_lINE('Funcionario inserido');
        WHEN UPDATING ('data_crt') THEN
            DBMS_OUTPUT.PUT_lINE('Data de contratação atualizada: data_crt');
        WHEN UPDATING ('salario') THEN
            DBMS_OUTPUT.PUT_lINE('Salario do funcionario atualizado: salario');
        WHEN DELETING THEN
            DBMS_OUTPUT.PUT_lINE('Funcionario removido');
        
    END CASE;
    
END;
/

CREATE OR REPLACE TRIGGER dml_func
    BEFORE UPDATE OF data_contr, salario ON emp.funcionarios
    FOR EACH ROW
    
BEGIN
    CASE
        WHEN UPDATING ('data_crt') THEN
            DBMS_OUTPUT.PUT_lINE('Data de contratação atualizada');
            DBMS_OUTPUT.PUT_lINE('Data antiga: ' || :OLD.DATA_CONTR);
            DBMS_OUTPUT.PUT_lINE('Data nova: ' || :NEW.DATA_CONTR);
        WHEN UPDATING ('salario') THEN
            DBMS_OUTPUT.PUT_LINE('Salario antigo: ' || :OLD.SALARIO);
            DBMS_OUTPUT.PUT_LINE('Salario novo: ' || :NEW.SALARIO);
        
     END CASE;
END;
/
CREATE OR REPLACE TRIGGER  imprimir_alteracao_salario
    BEFORE INSERT OR UPDATE OF salario ON emp.funcionarios
    FOR EACH ROW
    WHEN(NEW.salario > 1000)
DECLARE
    diferenca NUMBER;
BEGIN
    diferenca := :NEW.salario - :OLD.salario;
    DBMS_OUTPUT.PUT_LINE('Diferença dos salarios: ' || diferenca);
END;