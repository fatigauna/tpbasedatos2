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
	id_Hora int not null primary key auto_increment,
	emp_legajo int not null,
    pro_id_proyecto int not null,
    rol_id_rol int not null,
    cli_id_cliente int not null,
    hor_fecha date not null,
    hor_horas_dia int not null
);

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

insert into rol
values (1, 'Project Manager', 10);

insert into rol
values (2, 'Desarrollador', 9);

insert into rol
values (3, 'Tester', 8);

insert into rol
values (4, 'Administrador', 7);

insert into rol
values (5, 'DevOps', 6);


insert into rol
values (9, 'DevOps', 1);

insert into rol
values (6, 'DevOps', 1);

DELIMITER $$

CREATE PROCEDURE RendicionHoras(IN carlos INT, IN juan INT)

BEGIN

-- //Se declara variable donde se va a guardar el valor total
DECLARE TOTAL INT;

-- //Se declara el cursor con el select con cuyos datos se va a iterar
DECLARE RendicionHoras CURSOR FOR

select sum(h.hor_horas_dia * r.rol_paga_hora)
from rol r
inner join hora h 
on r.rol_id_rol = h.rol_id_rol
where h.cli_id_cliente = carlos and month(h.hor_fecha) = juan;


-- //Declaración de un manejador de error tipo NOT FOUND
DECLARE CONTINUE HANDLER FOR NOT FOUND SET @hecho = TRUE;

-- //Se abre el cursor. Al abrir el cursor este sitúa un puntero a la primera fila del resultado de la consulta.
OPEN RendicionHoras;

-- //Empieza el bucle de lectura
loop1: LOOP
-- //Se guarda el resultado en la variable, hay una variable y un campo en el SELECT de la declaración del cursor

 FETCH RendicionHoras INTO TOTAL;

-- //Se sale del bucle cuando no hay elementos por recorrer
 IF @hecho THEN
 LEAVE loop1;
 END IF;


END LOOP loop1;

-- //Se cierra el cursor
CLOSE RendicionHoras;

-- //Se muestra el resultado
SELECT TOTAL;

END;
$$

call RendicionHoras (1,9)
