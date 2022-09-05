DELIMITER $$
CREATE PROCEDURE spCrear_Proyecto2(in pro_id_proyecto int, in pro_nombre varchar(255), in pro_descripcion varchar(255) )
BEGIN
	Insert into proyecto ( pro_id_proyecto, pro_nombre, pro_descripcion )
			VALUES (pro_id_proyecto, pro_nombre , pro_descripcion) ;
	
END;
$$

CALL spCrear_Proyecto2 ( 4 , 'h' , 'h')

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_horas_semana`(in emp_id int, in pro_id int, in rol_id int, in cli_id int, in horas int)
BEGIN


    set @cont = 0;
    set @target = 6;

    while @cont <= @target do

            insert into hora(emp_legajo, pro_id_proyecto, rol_id_rol, cli_id_cliente, hor_fecha, hor_horas_dia)
            values (emp_id, pro_id, rol_id, cli_id, DATE_ADD(SYSDATE(), INTERVAL -@cont DAY), horas);

            set @cont = @cont + 1;

    end while;
END; $$

 
 USE tpbdd2;
CALL cargar_horas_semana (4,4,9,1,10);
CALL cargar_horas_semana (1,4,1,1,10);
CALL cargar_horas_semana (2,4,2,1,10);
CALL cargar_horas_semana (3,4,3,1,10);
CALL cargar_horas_semana (5,4,4,1,10);
CALL cargar_horas_semana (6,4,5,1,10);
CALL cargar_horas_semana (7,4,9,1,100);
CALL cargar_horas_semana (8,4,6,1,1);