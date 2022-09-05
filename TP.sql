create database tpbdd2;
use tpbdd2;

create table empleado(
	emp_legajo int not null primary key auto_increment,
    emp_nombre varchar(255),
    emp_edad int
);

create table proyecto(
	pro_id_proyecto int not null primary key,
    pro_nombre varchar(255),
    pro_descripcion varchar(255)
);

create table rol(
	rol_id_rol int not null primary key auto_increment,
    rol_descripcion varchar(255),
    rol_paga_hora int not null
);

create table cliente(
	cli_id_cliente int not null primary key,
    cli_nombre varchar(255),
    cli_costo_dia int null
);

create table hora(
	emp_legajo int not null primary key,
    pro_id_proyecto int not null,
    rol_id_rol int not null,
    cli_id_cliente int not null,
    hor_fecha date not null,
    hor_horas_dia int not null
);

/* create table liquidacion_horas(
CURRENT_TIMESTAMP
);

create table rendicion_horas(
CURRENT_TIMESTAMP
);
*/
ALTER TABLE `tpbdd2`.`hora` 
ADD CONSTRAINT `emp_legajo`
  FOREIGN KEY (`emp_legajo`)
  REFERENCES `tpbdd2`.`empleado` (`emp_legajo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `tpbdd2`.`hora` 
ADD INDEX `id_cliente_idx` (`cli_id_cliente` ASC) VISIBLE;
;
ALTER TABLE `tpbdd2`.`hora` 
ADD CONSTRAINT `id_cliente`
  FOREIGN KEY (`cli_id_cliente`)
  REFERENCES `tpbdd2`.`cliente` (`cli_id_cliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tpbdd2`.`hora` 
ADD INDEX `id_rol_idx` (`rol_id_rol` ASC) VISIBLE;
;
ALTER TABLE `tpbdd2`.`hora` 
ADD CONSTRAINT `id_rol`
  FOREIGN KEY (`rol_id_rol`)
  REFERENCES `tpbdd2`.`rol` (`rol_id_rol`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tpbdd2`.`hora` 
ADD INDEX `id_proy_idx` (`pro_id_proyecto` ASC) VISIBLE;
;
ALTER TABLE `tpbdd2`.`hora` 
ADD CONSTRAINT `id_proy`
  FOREIGN KEY (`pro_id_proyecto`)
  REFERENCES `tpbdd2`.`proyecto` (`pro_id_proyecto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;




DELIMITER $$

CREATE PROCEDURE spCrearEmpleado (IN nombre VARCHAR (255), IN legajo INT, IN edad INT)

BEGIN
	INSERT INTO empleado (emp_nombre, emp_legajo, emp_edad) 
		VALUES (nombre , legajo , edad) ;
END;
$$

CALL spCrearEmpleado ('Juan Roma' , 009, 22);
CALL spCrearEmpleado ('Ramiro Estevez' , 007, 24);
CALL spCrearEmpleado ('Fatima Gauna' , 001, 24);
CALL spCrearEmpleado ('Francisco Camelli' , 002, 19);
CALL spCrearEmpleado ('Felix Fernandez' , 003, 25);
CALL spCrearEmpleado ('Ignacio Montero' , 004, 28);
CALL spCrearEmpleado ('Facundo Orcoyen' , 005, 20);
CALL spCrearEmpleado ('Camila Matozza' , 006, 23);
CALL spCrearEmpleado ('Rogelio Rolon' , 008, 34);
CALL spCrearEmpleado ('Ariel Gonzalez' , 010, 24);



DELIMITER $$
CREATE PROCEDURE spCrear_Proyecto2(in pro_id_proyecto int, in pro_nombre varchar(255), in pro_descripcion varchar(255) )
BEGIN
	Insert into proyecto ( pro_id_proyecto, pro_nombre, pro_descripcion )
			VALUES (pro_id_proyecto, pro_nombre , pro_descripcion) ;
	
END;
$$

CALL spCrear_Proyecto2 ( 1 , 'DOVE1' , 'saracafiumba1');
CALL spCrear_Proyecto2 ( 2 , 'DOVE2' , 'saracafiumba2');
CALL spCrear_Proyecto2 ( 3 , 'DOVE3' , 'saracafiumba3');
CALL spCrear_Proyecto2 ( 4 , 'DOVE4' , 'saracafiumba4');

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




