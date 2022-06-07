USE [MOLINASOFTWARE];
go

CREATE PROCEDURE upd_proveedor

	@lastId tinyint,
	@idProveedor tinyint,
	@idSupermercado tinyint,
	@nombre varchar(32)
	
AS
	update proveedores 
	set 
		idProveedor = @idProveedor,
		nombre=@nombre
	where idProveedor = @lastId 
	
go


CREATE PROCEDURE upd_telefono_proveedor
	@idProveedor tinyint,
	@lastTel FTelefono,
	@telefono FTelefono
	
AS

	update telefonosProveedores
	set
		telefono = @telefono
	where idProveedor = @idProveedor and telefono = @lastTel

go

CREATE PROCEDURE upd_correo_proveedor

	@idProveedor tinyint,
	@lastCor FCorreo,
	@correo FCorreo
	
AS
	update correosProveedores
	set 
		correo = @correo
		where idProveedor = @idProveedor and correo=@lastCor

go



CREATE PROCEDURE upd_supermercado
	@lastId tinyint,
	@idSupermercado tinyint
	
AS
	update supermercado
	set 
		idSupermercado = @idSupermercado
		where idSupermercado = @lastId 
	
go


CREATE PROCEDURE upd_telefono_supermercado
	@idSupermercado tinyint,
	@lastTel FTelefono,
	@telefono FTelefono
	
AS

	update telefonosSupermecado
	set
		telefono = @telefono
	where idSupermercado = @idSupermercado and telefono = @lastTel

go

CREATE PROCEDURE upd_correo_supermercado

	@idSupermercado tinyint,
	@lastCor FCorreo,
	@correo FCorreo
	
AS
	update correosSupermercado
	set 
		correo = @correo
		where @idSupermercado = @idSupermercado and correo=@lastCor

go


CREATE PROCEDURE upd_trabajador
	@idTrabajador int,
	@nombre varchar(64) ,
	@apellido1 varchar (32),
	@apellido2 varchar (32)
AS
	update trabajador
	set
		idTrabajador = @idTrabajador,
		nombre= @nombre,
		apellido1= @apellido1,
		apellido2= @apellido2 
	where idTrabajador = @idTrabajador
		
go

CREATE PROCEDURE upd_admin
	@idTrabajador int,
	@codigoAdmin FCodigoAdmin
AS 
	update administrador
	set 
		codigoAdministrador = @codigoAdmin
		where idTrabajador = @idTrabajador
go

CREATE PROCEDURE upd_empleado
	@idTrabajador int,
	@codigoEmpleado FCodigoEmpleado
AS
	update empleado
	set
		codigoEmpleado = @codigoEmpleado
		where idTrabajador = @idTrabajador

go

CREATE PROCEDURE upd_mercaderia
	 @last_idMercaeria FidMercaderia,
	 @idMercaderia FidMercaderia,
	 @idProveedor tinyint ,
	 @codigoAdministrador FcodigoAdmin,
	 @fechaIngreso date ,
	 @cantidadProductos int
AS
	update mercaderia
		set
		idMercaderia = @idMercaderia,
		idProveedor = @idProveedor,
		codigoAdministrador= @codigoAdministrador,
		fechaIngreso = @fechaIngreso,
		cantidadProductos = @cantidadProductos
		where idMercaderia = @last_idMercaeria;
		

go

CREATE PROCEDURE upd_zonaAlmacenamiento
	@lastId smallint,
	@idZonaAlmacenamiento smallint,
	@idSupermercado tinyint,
	@nombre varchar(32)
AS
	UPDATE zonaAlmacenamiento
		set
		idZonaAlmacenamiento = @idZonaAlmacenamiento,
		idSupermercado = @idSupermercado,
		nombre = @nombre

		where idZonaAlmacenamiento = @lastId;
go


CREATE PROCEDURE upd_categoria 
	@lastId smallint,
	@idCategoria smallint,
	@idZonaAlmacenamiento smallint,
	@tipo varchar(32)

	AS
		UPDATE categoria
		set
		idCategoria = @idCategoria,
		idZonaAlmacenamiento = @idZonaAlmacenamiento,
		tipo=@tipo
		where idCategoria = @lastId;

go


CREATE PROCEDURE upd_producto 
	@lastCodigo char(12),
	@codigoProducto char(12),
	@idCategoria smallint,
	@nombre varchar(32) ,
	@precioVenta smallmoney ,
	@precioCompra smallmoney  ,
	@estado tinyint ,
	@cantidad int 

	AS 
		UPDATE productos 
		set 
			codigoProducto = @codigoProducto,
			idCategoria = @idCategoria,
			nombre = @nombre,
			precioVenta = @precioVenta,
			precioCompra = @precioCompra,
			estado =@estado,
			cantidad = @cantidad
			where codigoProducto = @lastCodigo;

go

CREATE PROCEDURE upd_controlActivos
	@lastId int,
	@idControl int,
	@codigoEmpleado FcodigoEmpleado,
	@codigoProducto char(12),
	@cantidaEnStock int	

AS
	UPDATE controlActivos 
	SET
		idControl = @idControl,
		codigoEmpleado = @codigoEmpleado,
		codigoProducto =@codigoProducto,
		cantidadEnStock =@cantidaEnStock

		where idControl = @lastId ;

go
	

