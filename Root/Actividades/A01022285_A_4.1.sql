--TRIGGER 
CREATE TRIGGER update_despedidos
AFTER DELETE ON EMPLOYEE REFERENCING
old AS old_values
FOR EACH ROW MODE db2sql
BEGIN atomic
    UPDATE statistics set numDespedidos = numDespedidos + 1;
END

--TRIGGER 
CREATE TRIGGER check_salary
BEFORE UPDATE ON EMPLOYEE REFERENCING
old AS old_emp
new as new_emp
FOR EACH ROW MODE DB2SQL
WHEN (new_emp.SALARY > (1.3*old_emp.SALARY))
BEGIN ATOMIC
    SIGNAL SQLSTATE '75001' ('Invalid salary increase - Over 30%');
END

CREATE TABLE order (
    ID INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    PID VARCHAR(10) NOT NULL,
    amount INT NOT NULL,
    status INT
)

SELECT QUANTITY FROM INVENTORY WHERE PID='100-100-01'

-- TRIGGER 
CREATE TRIGGER check_inventory
BEFORE INSERT ON ORDER REFERENCING
NEW as new_ord
FOR EACH ROW MODE DB2SQL
WHEN (new_ord.amount > (SELECT QUANTITY FROM INVENTORY WHERE PID=new_ord.PID))
BEGIN ATOMIC
    SIGNAL SQLSTATE '75001' ('Invalid insert: not enough stock!');
END

-- TRIGGER 
CREATE TRIGGER update_inv
AFTER UPDATE ON ORDER REFERENCING
NEW as new_ord
FOR EACH ROW MODE DB2SQL
WHEN (new_ord.status = 2)
BEGIN ATOMIC
    UPDATE INVENTORY SET QUANTITY = QUANTITY - new_ord.amount;
END