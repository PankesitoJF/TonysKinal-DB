Use DBTonysKinal2019398;

-- Agregar Empleados --
Delimiter $$
	create procedure sp_AgregarEmpleados
		(in Codigo_Empleado int
        ,in Numero_Empleado int
		,in Apellidos_Empleados varchar(20)
        ,in Nombres_Empleado varchar (20)
        ,in direccion_Empleado varchar (25)
        ,in Telefono_Contacto int
        ,in Grado_Cocinero varchar(50)
        ,in Codigo_Tipo_Empleado int
        ,in tipo_Empleado_Codigo_Empleado int)
	begin
		Insert into Empleados(Codigo_Empleado,Numero_Empleado,Apellidos_Empleados,Nombres_Empleado,direccion_Empleado,Telefono_Contacto,Grado_Cocinero,Codigo_Tipo_Empleado,tipo_Empleado_Codigo_Empleado)
		values (Codigo_Empleado,Numero_Empleado,Apellidos_Empleados,Nombres_Empleado,direccion_Empleado,Telefono_Contacto,Grado_Cocinero,Codigo_Tipo_Empleado,tipo_Empleado_Codigo_Empleado);
		
	end$$
Delimiter ;


-- Agregar Empresas --
Delimiter $$
	create procedure sp_AgregarEmpresas
        (in codigo_Empresa int
        ,in Nombre_Empresa varchar(25)
		,in Direccion varchar (25)
		,in Telefono int )
    begin
		Insert into Empresas (codigo_Empresa,Nombre_Empresa,Direccion,Telefono)
        values (codigo_Empresa,Nombre_Empresa,Direccion,Telefono);
	
    end$$
delimiter ;
	
-- Agregar Platos --
Delimiter $$
	create procedure sp_AgregarPlatos
		(in codigo_Plato int
        ,in Cantidad int 
        ,in Nombre_Plato varchar(50)
        ,in Descripcion_Plato varchar (150)
        ,in Precio_Plato decimal (10,2)
        ,in Codigo_Tipo_Plato int 
        ,in TipoPlato_CodigoTipoPlato int)
	Begin
		Insert into Platos (codigo_Plato,Cantidad,Nombre_Plato,Descripcion_Plato,Precio_Plato,Codigo_Tipo_Plato,TipoPlato_CodigoTipoPlato)
        values (codigo_Plato,Cantidad,Nombre_Plato,Descripcion_Plato,Precio_Plato,Codigo_Tipo_Plato,TipoPlato_CodigoTipoPlato);
        
	End$$
Delimiter ;
	
    
-- Agregar Presupuesto --
Delimiter $$
	Create procedure sp_AgregarPresupuesto
		(in Codigo_Presupuesto int
        ,in Fecha_Solicitud date
        ,in Cantidad_Presupuesto decimal (10,2)
        ,in Codigo_Empresa int
        ,in Empresas_Codigo_Empresas int )
	Begin
		Insert into Presupuesto (Codigo_Presupuesto,Fecha_Solicitud,Cantidad_Presupuesto,Codigo_Empresa,Empresas_Codigo_Empresas)
        values (Codigo_Presupuesto,Fecha_Solicitud,Cantidad_Presupuesto,Codigo_Empresa,Empresas_Codigo_Empresas);
	
    End $$
Delimiter ;

-- Agregar Productos --
Delimiter $$
	create procedure sp_AgregarProductos
		(in Codigo_Productos int
        ,in Nombre varchar (55)
        ,in Cantidad int)
	begin
		Insert into Productos (Codigo_Productos,Nombre,Cantidad)
        values (Codigo_Productos,Nombre,Cantidad);
	
    End$$
Delimiter ;

-- Agregar Productos/Plato --
Delimiter $$
	create procedure sp_AgregarProductos_Has_Platos
		(in Productos_Codigo_Producto int
        ,in Platos_Codigo_Plato int )
	Begin
		Insert into productos_has_platos (Productos_Codigo_Producto,Platos_Codigo_Plato)
		Values  (Productos_Codigo_Producto,Platos_Codigo_Plato);
	
    End $$
Delimiter;

-- Agregar Servicios
Delimiter $$
	Create procedure sp_AgregarServicios
		(in Codigo_Servicio int
        ,in Fecha_Servicio date
        ,in Tipo_Servicio varchar (100)
        ,in Hora_Servicios time 
        ,in Lugar_Servicio varchar (100)
        ,in Telefono_Contacto int 
        ,in Codigo_Empresa int 
        ,in Emppresas_Codigo_Empresas int )
	Begin
		Insert into Servicios (Codigo_Servicio,Fecha_Servicio,Tipo_Servicio,Hora_Servicios,Lugar_Servicio,Telefono_Contacto,Codigo_Empresa,Emppresas_Codigo_Empresas)
        values (Codigo_Servicio,Fecha_Servicio,Tipo_Servicio,Hora_Servicios,Lugar_Servicio,Telefono_Contacto,Codigo_Empresa,Emppresas_Codigo_Empresas);
        
	End $$
Delimiter ;


-- Agregar Servicios/Empleado --
Delimiter $$
	Create procedure sp_AgregarServicios_Has_Empleados
		(in Servicios_Codigo_Servicio int 
        ,in Empleados_Codigo_Empleados int 
        ,in Fecha_Evento date
        ,in Hora_Evento time
        ,in Lugar_Evento varchar(150))
	begin
		Insert into servicios_has_empleados (Servicios_Codigo_Servicio,Empleados_Codigo_Empleados,Fecha_Evento,Hora_Evento,Lugar_Evento)
        values (Servicios_Codigo_Servicio,Empleados_Codigo_Empleados,Fecha_Evento,Hora_Evento,Lugar_Evento);
	
    End $$
Delimiter ;

-- Agregar Servicios/PLatos
Delimiter $$
		Create procedure sp_AgregarServicios_Has_Platos
			(in Servicios_Codigos_Servicios int
            ,in Platos_Codigo_Plato int)
		Begin 
			insert into servicios_has_platos (Servicios_Codigos_Servicios,Servicios_Codigos_Servicios)
            values (Servicios_Codigos_Servicios,Servicios_Codigos_Servicios);
	
    End $$
Delimter ;

-- Agregar Tipo/Empleado --
 Delimiter $$
		create procedure sp_AgregarTipo_Empleado
			(in Codigo_Tipo_Empleado int
            ,in descripcion varchar (100))
		Begin
			Insert into tipo_empleado(Codigo_Tipo_Empleado,descripcion)
            values (Codigo_Tipo_Empleado,descripcion);
		
	end $$
Delimiter ;	
	
-- Agregar Tipo de Platos --
Delimiter $$
		create procedure sp_AgregarTipo_Platos
			(in Codigo_Tipo_Plato int
            ,in Descripcion_Tipo varchar (100))
		Begin
			Insert into tipo_platos(Codigo_Tipo_Plato,Descripcion_Tipo)
            values (Codigo_Tipo_Plato,Descripcion_Tipo);
		
	end $$
Delimiter ;	