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


