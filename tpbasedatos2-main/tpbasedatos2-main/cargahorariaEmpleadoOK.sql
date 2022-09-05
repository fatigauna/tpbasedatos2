DELIMITER $$

CREATE PROCEDURE CargaHoraria(IN emp INT, IN mes INT)

BEGIN

DECLARE hTOTAL INT;

DECLARE CargaHoraria CURSOR FOR

select sum(h.hor_horas_dia)
from hora h
where h.emp_legajo = emp and month(h.hor_fecha) = mes;


DECLARE CONTINUE HANDLER FOR NOT FOUND SET @hecho = TRUE;

OPEN CargaHoraria;

loop1: LOOP

 FETCH CargaHoraria INTO hTOTAL;

 IF @hecho THEN
 LEAVE loop1;
 END IF;


END LOOP loop1;

CLOSE CargaHoraria;

SELECT hTOTAL;

END;
$$

call CargaHoraria (1, 8);
call CargaHoraria (2, 8);
call CargaHoraria (3, 8);
call CargaHoraria (4, 8);
call CargaHoraria (6, 8);
call CargaHoraria (5, 8);
call CargaHoraria (7, 8);
call CargaHoraria (8, 8);
call CargaHoraria (9, 8);
call CargaHoraria (10, 8);
