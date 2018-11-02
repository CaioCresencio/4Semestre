SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE exercicio1
(sobrenome employees.first_name%TYPE)

IS
    nome VARCHAR2(50);
BEGIN
    SELECT first_name || ' ' last_name INTO nome
    FROM employees WHERE last_name = 0;
    
    DBMS_OUTPUT.PUT_LINE('Nome completo: ' || nome);
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Nenhum empregado encontrado com o sobrenome: ' || sobrenome);
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('O coando retornou mais linhas do que o permitido. Considere o uso de um cursor');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(SQLCODE);
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

DECLARE 
    nome varchar2(50);
    
BEGIN
    
    exercicio1('King');
END;