DELIMITER $$

CREATE PROCEDURE LiqMensualCliente(IN idCli INT, IN mes INT)

BEGIN

DECLARE TOTAL INT;

DECLARE LiqMensualCliente CURSOR FOR

select sum(h.hor_horas_dia * r.rol_paga_hora)
from rol r
inner join hora h 
on r.rol_id_rol = h.rol_id_rol
where h.cli_id_cliente = idCli and month(h.hor_fecha) = mes;


DECLARE CONTINUE HANDLER FOR NOT FOUND SET @hecho = TRUE;

OPEN LiqMensualCliente;

loop1: LOOP

 FETCH LiqMensualCliente INTO TOTAL;

 IF @hecho THEN
 LEAVE loop1;
 END IF;


END LOOP loop1;

CLOSE LiqMensualCliente;

SELECT TOTAL;

END;
$$

call LiqMensualCliente (1,8)
call LiqMensualCliente (2,8)