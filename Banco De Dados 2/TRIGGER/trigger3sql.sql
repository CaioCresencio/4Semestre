SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER on_update_departamento
    BEFORE UPDATE OF codigo OR DELETE ON emp.departamentos
    FOR EACH ROW
BEGIN
    CASE
        WHEN UPDATING THEN
            update funcionarios set cod_depto = :NEW.codigo
            WHERE cod_depto = :OLD.codigo;
            DBMS_OUTPUT.PUT_LINE('codigo alterado');

        WHEN DELETING THEN 
            update funcionarios set cod_depto = NULL
            WHERE cod_depto = :OLD.codigo;
    END CASE;    
END;
/

update departamentos set codigo = 2;
delete from departamentos;

select * from departamentos;
insert into departamentos (codigo,total_salarios,cod_depto,nome) values (3,0,'teste','teste1');