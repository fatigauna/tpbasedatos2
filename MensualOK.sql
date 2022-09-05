DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_horas_semana`(in emp_id int, in pro_id int, in rol_id int, in cli_id int, in horas int)
BEGIN


    set @cont = 0;
    set @target = 50;

    while @cont <= @target do

            insert into hora(emp_legajo, pro_id_proyecto, rol_id_rol, cli_id_cliente, hor_fecha, hor_horas_dia)
            values (emp_id, pro_id, rol_id, cli_id, DATE_ADD(SYSDATE(), INTERVAL -@cont DAY), horas);

            set @cont = @cont + 1;

    end while;
END; $$

CALL cargar_horas_semana (1,4,1,1,8);


