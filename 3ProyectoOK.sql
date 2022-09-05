DELIMITER $$
CREATE PROCEDURE spCrear_Proyecto2(in pro_id_proyecto int, in pro_nombre varchar(255), in pro_descripcion varchar(255) )
BEGIN
	Insert into proyecto ( pro_id_proyecto, pro_nombre, pro_descripcion )
			VALUES (pro_id_proyecto, pro_nombre , pro_descripcion) ;
	
END;
$$

CALL spCrear_Proyecto2 ( 1 , 'Soft Solutions' , 'a');
CALL spCrear_Proyecto2 ( 2 , 'Tech Giants' , 'b');



