SET SERVEROUT ON
CREATE OR REPLACE FUNCTION qtd_salario_maior
(
    empid employees.employee_id%TYPE
)
RETURN NUMBER
IS 
    qtd NUMBER;
BEGIN
    SELECT COUNT(*) INTO qtd
    FROM employees
    WHERE salary > (SELECT salary
                    FROM employees
                    WHERE employee_id = empid);
    return qtd;
END;
/

DECLARE 
    empno employees.employee_id%TYPE := &empno;
BEGIN
    DBMS_OUTPUT_LINE(qtd_salario_maior(empno));
END;
/

select employee_id, qtd_salario_maior(employee_id) from employees; -- USANDO A FUNÇÃO

drop function nome_função;
drop procedure nome_procedure;
