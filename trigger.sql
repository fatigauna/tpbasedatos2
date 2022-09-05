DELIMITER $$
CREATE TRIGGER HORAS_BU
BEFORE UPDATE ON HORA 
FOR EACH ROW
BEGIN 
IF NEW.hor_horas_dia > 8 THEN SET NEW.hor_horas_dia = 25;
END IF; 
END $$

drop trigger horas_bu