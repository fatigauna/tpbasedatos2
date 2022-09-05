DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_horas_semana`(in emp_id int, in pro_id int, in rol_id int, in cli_id int, in horas int)
BEGIN


    set @cont = 0;
    set @target = 37;

    while @cont <= @target do

            insert into hora(emp_legajo, pro_id_proyecto, rol_id_rol, cli_id_cliente, hor_fecha, hor_horas_dia)
            values (emp_id, pro_id, rol_id, cli_id, DATE_ADD(SYSDATE(), INTERVAL -@cont DAY), horas);

            set @cont = @cont + 1;

    end while;
END; $$

CALL cargar_horas_semana (1,1,1,1,8);
CALL cargar_horas_semana (2,1,2,1,7);
CALL cargar_horas_semana (3,1,3,1,6);
CALL cargar_horas_semana (4,1,4,1,5);
CALL cargar_horas_semana (5,2,1,2,9);
CALL cargar_horas_semana (6,2,2,2,5);
CALL cargar_horas_semana (7,2,3,2,2);
CALL cargar_horas_semana (8,2,4,2,3);


