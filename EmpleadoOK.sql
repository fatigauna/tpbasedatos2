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