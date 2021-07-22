Drop database if exists  DBTonysKinal2019398;
create database DBTonysKinal2019398;


ALTER USER 'root'@'localhost' identified WITH mysql_native_password BY '';

create table TipoEmpleado (
	codigoTipoEmpleado int auto_increment not null,
    descripcion varchar(100) not null,
    primary key PK_codigoTipoEmpleado (codigoTipoEmpleado)
);

create table Empleados (
	codigoEmpleado int auto_increment not null,
	numeroEmpleado int not null,
    apellidosEmpleado varchar(150) not null,
    nombresEmpleado varchar(150) not null,
    direccionEmpleado varchar(150) not null,
    telefonoContacto varchar(10) not null,
    gradoCocinero varchar(50) not null,
    codigoTipoEmpleado int not null,
    primary key PK_codigoEmpleado (codigoEmpleado),
    constraint FK_Empleados_TipoEmpleado foreign key (codigoTipoEmpleado) references TipoEmpleado(codigoTipoEmpleado) on delete cascade
);

create table Empresas (
	codigoEmpresa int auto_increment not null,
    nombreEmpresa varchar(150) not null,
    direccion varchar(150) not null,
    telefono varchar(10) not null,
    primary key PK_codigoEmpresa (codigoEmpresa)
);

create table Servicios (
	codigoServicio int auto_increment not null,
    fechaServicio date not null,
    tipoServicio varchar(100) not null,
    horaServicio time not null,
    lugarServicio varchar(100) not null,
    telefonoContacto varchar(10) not null,
    codigoEmpresa int,
    primary key PK_codigoServicio (codigoServicio),
	constraint FK_Servicios_Empresas foreign key (codigoEmpresa) references Empresas (codigoEmpresa) on delete cascade
);

create table Presupuesto ( 
	codigoPresupuesto int auto_increment not null,
    fechaSolicitud date not null, 
    cantidadPresupuesto decimal(10,2) not null,
    codigoEmpresa int,
    primary key PK_codigoPresupuesto (codigoPresupuesto),
    constraint FK_Presupuesto_Empresas foreign key (codigoEmpresa) references Empresas (codigoEmpresa) on delete cascade
);

create table Servicios_has_Empleados (
	Servicios_codigoServicio int auto_increment not null,
    codigoServicio int not null,
    codigoEmpleado int not null,
	fechaEvento date not null,
    horaEvento time not null,
    lugarEvento varchar(150) not null,
    primary key PK_Servicios_codigoServicio (Servicios_codigoServicio),
    constraint FK_Servicios_has_Empleados_Servicios foreign key (codigoServicio) references Servicios (codigoServicio) on delete cascade,
	constraint FK_Servicios_has_Empleados_Empleados foreign key (codigoEmpleado) references Empleados (codigoEmpleado) on delete cascade
);

create table TipoPlato (
	codigoTipoPlato int auto_increment not null,
    descripcionTipo varchar(100) not null,
    primary key PK_codigoTipoPlato (codigoTipoPlato)
);

create table Platos (
	codigoPlato int auto_increment not null,
    cantidad int not null,
    nombrePlato varchar(50) not null,
    precioPlato decimal(10,2) not null,
    codigoTipoPlato int,
    primary key PK_codigoPlato (codigoPlato),
	constraint FK_Platos_TipoPlato foreign key (codigoTipoPlato) references TipoPlato (codigoTipoPlato) on delete cascade
);

create table Servicios_has_Platos (
	Servicios_codigoServicio int auto_increment null,
    codigoPlato int not null, 
    codigoServicio int not null,
    primary key PK_Servicios_codigoServicio (Servicios_codigoServicio),
    constraint FK_Servicios_has_Platos_Servicios foreign key (codigoServicio) references Servicios (codigoServicio) on delete cascade,
    constraint FK_Servicios_has_Platos_Platos foreign key (codigoPlato) references Platos (codigoPlato) on delete cascade
);

create table Productos (
	codigoProducto int auto_increment not null,
    nombreProducto varchar(150) not null,
    cantidad int not null,
    primary key PK_codigoProducto (codigoProducto)
);

create table Productos_has_Platos (
	Productos_codigoProducto int auto_increment not null,
    codigoPlato int not null,
    codigoProducto int not null,
    primary key PK_Productos_codigoProducto (Productos_codigoProducto),
    constraint FK_Productos_has_Platos_Productos foreign key (codigoProducto) references Productos (codigoProducto) on delete cascade,
    constraint FK_Productos_has_Platos_Platos foreign key (codigoPlato) references Platos (codigoPlato) on delete cascade
);

/*----------------------------------------------------------------------------------------*/
-- ---------------------------------- INSERTS INTO --------------------------------
insert into TipoEmpleado(descripcion) values("Cocinero");
insert into TipoEmpleado(descripcion) values("Camarero");
insert into TipoEmpleado(descripcion) values("Jefe de cocina");
insert into TipoEmpleado(descripcion) values("Asistente del cocinero");

insert into Empleados (numeroEmpleado,apellidosEmpleado,nombresEmpleado,direccionEmpleado,telefonoContacto,gradoCocinero,CodigoTipoEmpleado) values(56,"Alvarado Garcia","Luis Daniel","zona 1 Av. 6 14-10","45893274","ejecutivo",1);
insert into Empleados (numeroEmpleado,apellidosEmpleado,nombresEmpleado,direccionEmpleado,telefonoContacto,gradoCocinero,CodigoTipoEmpleado) values(85,"Monterroso Arevalo","Jose Carlos","zona 2 Av. 15 8-12","59874123","asistente del ejecutivo",2);
insert into Empleados (numeroEmpleado,apellidosEmpleado,nombresEmpleado,direccionEmpleado,telefonoContacto,gradoCocinero,CodigoTipoEmpleado) values(98,"Cruz Cifuentes","Samuel David","zona 6 Av. 17 21-8","85967425","primer chef",3);
insert into Empleados (numeroEmpleado,apellidosEmpleado,nombresEmpleado,direccionEmpleado,telefonoContacto,gradoCocinero,CodigoTipoEmpleado) values(112,"Lopez Barrera","Marco Luis","zona 3 Av. 8 15-8","25958745","aprendiz",4);
insert into Empleados (numeroEmpleado,apellidosEmpleado,nombresEmpleado,direccionEmpleado,telefonoContacto,gradoCocinero,CodigoTipoEmpleado) values(89,"Londoño Vivas","Oscar Enmanuel","zona 4 Av. 11 7-13","37859612","segundo chef",1);

insert into Empresas(nombreEmpresa,direccion,telefono) values("Pollo campero","zona 10 Av.12 3-11","65988596");
insert into Empresas(nombreEmpresa,direccion,telefono) values("Macdonald's","zona 18 Av.14 5-8","88965574");
insert into Empresas(nombreEmpresa,direccion,telefono) values("Anfora","zona 5 Av.7 10-5","12364487");
insert into Empresas(nombreEmpresa,direccion,telefono) values("Walmart","zona 7 Av.11 18-7","85967595");
insert into Empresas(nombreEmpresa,direccion,telefono) values("La torre","zona 6 Av.4 9-14","75395182");
insert into Empresas(nombreEmpresa,direccion,telefono) values("La patsi","zona 1 Av.12 10-9","26987412");

insert into Servicios(fechaServicio,tipoServicio,horaServicio,lugarServicio,telefonoContacto,CodigoEmpresa) values('2019-02-15',"Desayuno",'09:00',"zona 1","45967812",1);
insert into Servicios(fechaServicio,tipoServicio,horaServicio,lugarServicio,telefonoContacto,CodigoEmpresa) values('2019-12-07',"Bufete",'05:30',"zona 4","85769425",2);
insert into Servicios(fechaServicio,tipoServicio,horaServicio,lugarServicio,telefonoContacto,CodigoEmpresa) values('2020-03-20',"Almuerzo",'12:00',"zona 5","96328574",3);
insert into Servicios(fechaServicio,tipoServicio,horaServicio,lugarServicio,telefonoContacto,CodigoEmpresa) values('2020-07-11',"Cena",'19:00',"zona 10","55617455",2);
insert into Servicios(fechaServicio,tipoServicio,horaServicio,lugarServicio,telefonoContacto,CodigoEmpresa) values('2020-09-16',"A domicilio",'15:00',"zona 12","26597481",6);
insert into Servicios(fechaServicio,tipoServicio,horaServicio,lugarServicio,telefonoContacto,CodigoEmpresa) values('2020-07-31',"Refaccion",'16:00',"zona 18","56987425",1);
insert into Servicios(fechaServicio,tipoServicio,horaServicio,lugarServicio,telefonoContacto,CodigoEmpresa) values('2020-10-14',"Combo Familiar",'14:00',"zona 2","45968871",2);

insert into Presupuesto(fechaSolicitud,cantidadPresupuesto,codigoEmpresa) values('2018-05-06',"4500.00",1);
insert into Presupuesto(fechaSolicitud,cantidadPresupuesto,codigoEmpresa) values('2019-07-12',"3575.50",2);
insert into Presupuesto(fechaSolicitud,cantidadPresupuesto,codigoEmpresa) values('2020-11-08',"5100.00",3);
insert into Presupuesto(fechaSolicitud,cantidadPresupuesto,codigoEmpresa) values('2017-07-15',"31150.00",5);
insert into Presupuesto(fechaSolicitud,cantidadPresupuesto,codigoEmpresa) values('2019-03-08',"3540.00",4);
insert into Presupuesto(fechaSolicitud,cantidadPresupuesto,codigoEmpresa) values('2020-07-22',"2100.00",1);
insert into Presupuesto(fechaSolicitud,cantidadPresupuesto,codigoEmpresa) values('2020-08-17',"3425.00",2);

insert into TipoPlato(descripcionTipo) values("Mariscos");
insert into TipoPlato(descripcionTipo) values("Pasta");
insert into TipoPlato(descripcionTipo) values("Ensalada");
insert into TipoPlato(descripcionTipo) values("Asados");
insert into TipoPlato(descripcionTipo) values("Frituras");
insert into TipoPlato(descripcionTipo) values("Comida china");

insert into Platos(cantidad,nombrePlato,precioPlato,codigoTipoPlato) values(5,"carne asada","50.00",4);
insert into Platos(cantidad,nombrePlato,precioPlato,codigoTipoPlato) values(15,"ensalada de lechuga","45.00",3);
insert into Platos(cantidad,nombrePlato,precioPlato,codigoTipoPlato) values(3,"ceviche","55.50",1);
insert into Platos(cantidad,nombrePlato,precioPlato,codigoTipoPlato) values(7,"papas fritas","30.00",5);
insert into Platos(cantidad,nombrePlato,precioPlato,codigoTipoPlato) values(4,"Pollo asado","37.50",4);
insert into Platos(cantidad,nombrePlato,precioPlato,codigoTipoPlato) values(2,"Arroz chino","41.50",6);
insert into Platos(cantidad,nombrePlato,precioPlato,codigoTipoPlato) values(4,"Huevos fritos","32.00",5);

insert into Productos(nombreProducto,cantidad) values("Platos",20);
insert into Productos(nombreProducto,cantidad) values("Pollo",10);
insert into Productos(nombreProducto,cantidad) values("Vasos",15);
insert into Productos(nombreProducto,cantidad) values("Carne de Res",30);
insert into Productos(nombreProducto,cantidad) values("verduras",75);
insert into Productos(nombreProducto,cantidad) values("arroz",35);
insert into Productos(nombreProducto,cantidad) values("camaron",40);

insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(1,7);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(2,1);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(2,2);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(2,3);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(2,4);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(2,5);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(2,6);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(3,1);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(3,2);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(3,3);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(3,4);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(3,5);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(3,6);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(4,1);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(4,2);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(4,4);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(4,5);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(4,6);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(5,1);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(5,2);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(5,3);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(5,4);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(5,5);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(5,6);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(5,7);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(6,2);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(6,4);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(7,1);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(7,3);
insert into Servicios_has_Platos (codigoServicio,codigoPlato) values(7,5);

insert into Productos_has_Platos (codigoProducto,codigoPlato) values(2,5);
insert into Productos_has_Platos (codigoProducto,codigoPlato) values(2,6);
insert into Productos_has_Platos (codigoProducto,codigoPlato) values(4,1);
insert into Productos_has_Platos (codigoProducto,codigoPlato) values(4,6);
insert into Productos_has_Platos (codigoProducto,codigoPlato) values(5,2);
insert into Productos_has_Platos (codigoProducto,codigoPlato) values(5,4);
insert into Productos_has_Platos (codigoProducto,codigoPlato) values(5,6);
insert into Productos_has_Platos (codigoProducto,codigoPlato) values(6,6);
insert into Productos_has_Platos (codigoProducto,codigoPlato) values(7,3);

/*----------------------------CRUDS-------------------------------*/

/*---------------------- CRUD empleados --------------------------*/

-- Listar
Delimiter $$
create procedure sp_ListarEmpleados()
begin 
	select * from Empleados ;
end$$
Delimiter ;

-- Agregar
Delimiter $$
create procedure sp_AgregarEmpleados(in numeroEmpleado int,
								in apellidosEmpleado varchar(150),
								in nombresEmpleado varchar(150),
								in direccionEmpleado varchar(150),
								in telefonoContacto varchar(10),
								in gradoCocinero varchar(50),
								in codigoTipoEmpleado int)
begin
start transaction;
	insert into Empleados (numeroEmpleado,apellidosEmpleado,nombresEmpleado,direccionEmpleado,telefonoContacto,gradoCocinero,codigoTipoEmpleado)
	values(numeroEmpleado,apellidosEmpleado,nombresEmpleado,direccionEmpleado,telefonoContacto,gradoCocinero,codigoTipoEmpleado);
commit;
end $$
Delimiter ;

-- Actualizar
Delimiter $$
create procedure sp_ActualizarEmpleados(in codigoEmpleado int, 
									in numeroEmpleado int,
									in apellidosEmpleado varchar(150),
									in nombresEmpleado varchar(150),
									in direccionEmpleado varchar(150),
									in telefonoContacto varchar(10),
									in gradoCocinero varchar(50))
begin
	update Empleados set empleados.numeroEmpleado=numeroEmpleado,
						 empleados.apellidosEmpleado=apellidosEmpleado,
						 empleados.nombresEmpleado=nombresEmpleado,
						 empleados.direccionEmpleado=direccionEmpleado,
						 empleados.telefonoContacto=telefonoContacto,
						 empleados.gradoCocinero=gradoCocinero
	where empleados.codigoEmpleado=codigoEmpleado;
end $$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarEmpleados(in codigoEmpleado int)
begin
	delete from Empleados 
    where empleados.codigoEmpleado=codigoEmpleado;
end $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarEmpleados(in codigoEmpleado int)
begin
	select * from Empleados 
    where empleados.codigoEmpleado = codigoEmpleado;
end $$
Delimiter ;

/* ----------------------- CRUD Tipo Empleado -------------------*/

-- Listar
Delimiter $$
create procedure sp_ListarTipoEmpleado()
begin 
	select * from TipoEmpleado ;
end$$
Delimiter ;

-- Agregar
Delimiter $$
create procedure sp_AgregarTipoEmpleado( in descripcion varchar(100))
begin
start transaction;
	insert into TipoEmpleado (descripcion)
	values(descripcion);
commit;
end $$
Delimiter ;

-- Actualizar
Delimiter $$
create procedure sp_ActualizarTipoEmpleado(in codigoTipoEmpleadoc int, 
										in descripcionc varchar(100))
begin
	update TipoEmpleado set descripcion=descripcionc
	where codigoTipoEmpleado=codigoTipoEmpleadoc;
end $$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarTipoEmpleado(codigoTipoEmpleadoc int)
begin
start transaction;
	delete from TipoEmpleado 
    where codigoTipoEmpleado=codigoTipoEmpleadoc;
commit;
end $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarTipoEmpleado(in codigoTipoEmpleadoc int)
begin
	select * from TipoEmpleado 
    where codigoTipoEmpleado = codigoTipoEmpleadoc;
end $$
Delimiter ;

/*------------------------ CRUD Empresas ------------------------*/

-- Listar
Delimiter $$
create procedure sp_ListarEmpresas()
begin 
	select * from Empresas ;
end$$
Delimiter ;

-- Agregar
Delimiter $$
create procedure sp_AgregarEmpresas(in nombreEmpresa varchar(150), 
								in direccion varchar(150), 
                                in telefono varchar(10))
begin
start transaction;
	insert into Empresas (nombreEmpresa,direccion,telefono)
	values(nombreEmpresa,direccion,telefono);
commit;
end $$
Delimiter ;

-- Actualizar
Delimiter $$
create procedure sp_ActualizarEmpresas(in codigoEmpresa int, 
									in nombreEmpresa varchar(150), 
									in direccion varchar(150), 
									in telefono varchar(10))
begin
	update Empresas set empresas.nombreEmpresa=nombreEmpresa,
						empresas.direccion=direccion,
						empresas.telefono=telefono
	where empresas.codigoEmpresa=codigoEmpresa;
end $$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarEmpresas(in codigoEmpresa int)
begin
start transaction;
	delete from Empresas 
    where empresas.codigoEmpresa = codigoEmpresa;
commit;
end $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarEmpresas(in codigoEmpresa int)
begin
	select * from Empresas 
    where empresas.codigoEmpresa = codigoEmpresa;
end $$
Delimiter ;

/*---------------------- CRUD Servicios --------------------------*/

-- Listar
Delimiter $$
create procedure sp_ListarServicios()
begin 
	select * from Servicios ;
end$$
Delimiter ;

-- Agregar
Delimiter $$
create procedure sp_AgregarServicios( in fechaServicio date,
		in tipoServicio varchar(100), 
        in horaServicio time, 
        in lugarServicio varchar(100),
        in telefonoContacto varchar(10),
        in codigoEmpresa int)
begin
	insert into Servicios (fechaServicio,tipoServicio,horaServicio,lugarServicio,telefonoContacto,codigoEmpresa)
	values(fechaServicio,tipoServicio,horaServicio,lugarServicio,telefonoContacto,codigoEmpresa);
end $$
Delimiter ;

-- Actualizar
Delimiter $$
create procedure sp_ActualizarServicios(in codigoServicioc int, 
									in fechaServicioc date, 
                                    in tipoServicioc varchar(100), 
                                    in horaServicioc time, 
                                    in lugarServicioc varchar(100),
                                    in telefonoContactoc varchar(10))
begin
	update Servicios set fechaServicio=fechaServicioc,
						tipoServicio=tipoServicioc,
                        horaServicio=horaServicioc,
                        lugarServicio=lugarServicioc,
						telefonoContacto=telefonoContactoc
	where codigoServicio=codigoServicioc;
end $$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarServicios(in codigoServicioc int)
begin
	delete from Servicios 
    where codigoServicio=codigoServicioc;
end $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarServicios(in codigoServicioc int)
begin
	select * from Servicios 
    where codigoServicio= codigoServicioc ;
end $$
Delimiter ;

/*---------------------- CRUD Presupuesto ---------------------*/

-- Listar
Delimiter $$
create procedure sp_ListarPresupuesto()
begin 
	select * from Presupuesto ;
end$$
Delimiter ;

-- Agregar
Delimiter $$
create procedure sp_AgregarPresupuesto( in fechaSolicitud date, 
									in cantidadPresupuesto decimal(10,2),
									in codigoEmpresa int)
begin
	insert into Presupuesto (fechaSolicitud,cantidadPresupuesto,codigoEmpresa)
	values(fechaSolicitud,cantidadPresupuesto,codigoEmpresa);
end $$
Delimiter ;

-- Actualizar
Delimiter $$
create procedure sp_ActualizarPresupuesto(in codigoPresupuestoc int, 
										in fechaSolicitudc date, 
                                        in cantidadPresupuestoc decimal(10,2))
begin
	update Presupuesto set fechaSolicitud=fechaSolicitudc,
						cantidadPresupuesto=cantidadPresupuestoc
	where codigoPresupuesto=codigoPresupuestoc;
end $$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarPresupuesto(in codigoPresupuestoc int)
begin
	delete from Presupuesto 
    where codigoPresupuesto=codigoPresupuestoc;
end $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarPresupuesto(in codigoPresupuestoc int)
begin
	select * from Presupuesto 
    where codigoPresupuesto= codigoPresupuestoc ;
end $$
Delimiter ;

/*---------------------- CRUD Platos --------------------------*/

-- Listar
Delimiter $$
create procedure sp_ListarPlatos()
begin 
	select * from Platos ;
end$$
Delimiter ;

-- Agregar
Delimiter $$
create procedure sp_AgregarPlatos(in cantidad int, 
                                in nombrePlato varchar(50),
                                in precioPlato decimal(10,2), 
                                in codigoTipoPlato int)
begin
	insert into Platos (cantidad,nombrePlato,precioPlato,codigoTipoPlato)
	values(cantidad,nombrePlato,precioPlato,codigoTipoPlato);
end $$
Delimiter ;

-- Actualizar
Delimiter $$
create procedure sp_ActualizarPlatos(in codigoPlatoc int, 
								in cantidadc int, 
                                in nombrePlatoc varchar(50),
                                in precioPlatoc decimal(10,2))
begin
	update Platos set cantidad=cantidadc,
                    nombrePlato=nombrePlatoc,
                    precioPlato=precioPlatoc
	where codigoPlato=codigoPlatoc;
end $$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarPlatos(in codigoPlatoc int)
begin
	delete from Platos 
    where codigoPlato=codigoPlatoc;
end $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarPlatos(in codigoPlatoc int)
begin
	select * from Platos 
    where codigoPlato= codigoPlatoc ;
end $$
Delimiter ;

/*------------------------ CRUD Tipo Plato -----------------------*/

-- Listar
Delimiter $$
create procedure sp_ListarTipoPlato()
begin 
	select * from TipoPlato;
end$$
Delimiter ;

-- Agregar
Delimiter $$
create procedure sp_AgregarTipoPlato(in descripcionTipo varchar(100))
begin
	insert into TipoPlato (descripcionTipo)
	values(descripcionTipo);
end $$
Delimiter ;

-- Actualizar
Delimiter $$
create procedure sp_ActualizarTipoPlato(in codigoTipoPlatoc int, 
									in descripcionTipoc varchar(100))
begin
	update TipoPlato set descripcionTipo=descripcionTipoc
	where codigoTipoPlato=codigoTipoPlatoc;
end $$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarTipoPlato(in codigoTipoPlatoc int)
begin
	delete from TipoPlato 
    where codigoTipoPlato=codigoTipoPlatoc;
end $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarTipoPlato(in codigoTipoPlatoc int)
begin
	select * from TipoPlato 
    where codigoTipoPlato= codigoTipoPlatoc ;
end $$
Delimiter ;

/* --------------------- CRUD Productos ------------------------*/

-- Listar
Delimiter $$
create procedure sp_ListarProductos()
begin 
	select * from Productos;
end$$
Delimiter ;

-- Agregar
Delimiter $$
create procedure sp_AgregarProductos(in nombreProducto varchar(150),
                                in cantidad int)
begin
	insert into Productos (nombreProducto,cantidad)
	values(nombreProducto,cantidad);
end $$
Delimiter ;

-- Actualizar
Delimiter $$
create procedure sp_ActualizarProductos(in codigoProductoc int, 
									in nombreProductoc varchar(150),
                                    in cantidadc int)
begin
	update Productos set nombreProducto=nombreProductoc,
                        cantidad=cantidadc
	where codigoProducto=codigoProductoc;
end $$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarProductos(in codigoProductoc int)
begin
	delete from Productos 
    where codigoProducto=codigoProductoc;
end $$
Delimiter ;

-- Buscar
Delimiter $$
create procedure sp_BuscarProductos(in codigoProductoc int)
begin
	select * from Productos 
    where codigoProducto= codigoProductoc ;
end $$
Delimiter ;

/* --------------------- Listar Servicios_has_Platos ------------------------*/

-- Listar
Delimiter $$
create procedure sp_ListarServicios_has_Platos()
begin 
	select * from servicios_has_platos;
end$$
Delimiter ;

/* --------------------- Listar Productos_has_Platos ------------------------*/

-- Listar
Delimiter $$
create procedure sp_ListarProductos_has_Platos()
begin 
	select * from productos_has_platos;
end$$
Delimiter ;

/* --------------------- CRUD Servicios_has_Empleado ------------------------*/

-- Listar 
Delimiter $$
create procedure sp_ListarServicios_has_Empleados()
begin
	select * from Servicios_has_empleados;
end$$
Delimiter ;

-- Agregar
Delimiter $$
create procedure sp_AgregarServicios_has_Empleados(in codigoServicio int, 
												in codigoEmpleado int, 
												in fechaEvento date, 
												in horaEvento time, 
												in lugarEvento varchar(150))
begin
	insert into Servicios_has_empleados(codigoServicio, codigoEmpleado, fechaEvento, horaEvento, lugarEvento)
    values (codigoServicio, codigoEmpleado, fechaEvento, horaEvento, lugarEvento);
end$$
Delimiter ;
call sp_AgregarServicios_has_Empleados(1,2,'2020-01-03','08:10:00','Macdonalds');
call sp_AgregarServicios_has_Empleados(2,4,'2020-05-11','13:15:00','La Patsi');
call sp_AgregarServicios_has_Empleados(3,1,'2020-07-13','14:30:00','Burger King');
call sp_AgregarServicios_has_Empleados(4,3,'2020-08-22','19:20:00','Pizza Hut');
call sp_AgregarServicios_has_Empleados(5,5,'2020-11-26','15:00:00','Pollo Campero');

-- Actualizar
Delimiter $$
create procedure sp_ActualizarServicios_has_Empleados(in Servicios_codigoServicioc int,
													in fechaEventoc date,
													in horaEventoc time,
                                                    in lugarEventoc varchar(150))
begin
	update Servicios_has_Empleados set fechaEvento=fechaEventoc,
									horaEvento=horaEventoc,
									lugarEvento=lugarEventoc
	where Servicios_codigoServicio=Servicios_codigoServicioc;
end $$
Delimiter ;

-- Eliminar
Delimiter $$
create procedure sp_EliminarServicios_has_Empleados(in Servicios_codigoServicioc int)
begin
	delete from Servicios_has_Empleados 
    where Servicios_codigoServicio=Servicios_codigoServicioc;
end $$
Delimiter ;

/* --------------------- Reporte de Presupuestos ------------------------*/

Delimiter $$
create procedure sp_ListarReporte (in codEmpresa int)
begin
	select * from Empresas E inner join Presupuesto P on
    E.codigoEmpresa = P.codigoEmpresa
    inner join Servicios S on
    P.codigoEmpresa = S.codigoEmpresa
    where E.codigoEmpresa = codEmpresa group by S.tipoServicio having count(*) > 1;
end $$
Delimiter ; 

/*-------------------------------------------------------------------*/

Select * from Empresas E inner Join Presupuesto P on E.codigoEmpresa = P.codigoEmpresa 
where E.codigoEmpresa = 1 Group by P.cantidadPresupuesto; 

Select * from Empresas E inner join Servicios S on 
  E.codigoEmpresa = S.codigoEmpresa where E.codigoEmpresa = 1;
  
/* --------------------- Reporte de Servicios ------------------------*/

Delimiter $$
create procedure sp_ReporteServicio(in codServicio int)
begin
select * from servicios inner join servicios_has_platos
on servicios.codigoServicio = servicios_has_platos.codigoServicio  inner join platos on
platos.codigoPlato = servicios_has_platos.codigoPlato  inner join tipoplato on tipoplato.codigoTipoPlato = platos.codigoTipoPlato inner join productos_has_platos on platos.codigoPlato = productos_has_platos.codigoPlato
inner join productos on productos.codigoProducto = productos_has_platos.codigoProducto
where servicios.codigoServicio = codServicio;
end $$
Delimiter ;

