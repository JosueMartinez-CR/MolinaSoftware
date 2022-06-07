use[MOLINASOFTWARE]
go


-----------------------------Procedimeintos consulta




CREATE PROCEDURE cons_mercaderia 
	 @idMercaderia FidMercaderia

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    
		select * from mercaderia where idMercaderia=@idMercaderia;

	if @@error>0
		begin
			print ('No se mostro la mercaderia')
			rollback transaction
		end
		else
		begin
			print ('Se mostro la mercadería')
			commit transaction
		end;
go

CREATE PROCEDURE cons_proveedor 
	 @idProveedor tinyint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    select * from proveedores p, telefonosProveedores t, correosProveedores c where p.idProveedor=@idProveedor and t.idProveedor=@idProveedor and c.idProveedor=@idProveedor

	if @@error>0
		begin
			print ('No se mostro el proveedor')
			rollback transaction
		end
		else
		begin
			print ('Se mostro el proveedor')
			commit transaction
		end;
go

CREATE PROCEDURE cons_supermercadoTelefono
	 @idSupermercado tinyint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    

		select * from telefonosSupermecado where idSupermercado=@idSupermercado;

	if @@error>0
		begin
			print ('No se mostro el telefono del supermercado')
			rollback transaction
		end
		else
		begin
			print ('Se mostro el telefono del supermercado')
			commit transaction
		end;
go

CREATE PROCEDURE cons_supermercadoCorreo
	 @idSupermercado tinyint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    

		select * from correosSupermercado where idSupermercado=@idSupermercado;

	if @@error>0
		begin
			print ('No se mostro el correo del supermercado')
			rollback transaction
		end
		else
		begin
			print ('Se mostro el correo del supermercado')
			commit transaction
		end;
go

CREATE PROCEDURE cons_admin 
	 @idAdmin int

AS
	declare
		@error bit;
		set @error='False';

	begin tran	

		select * from administrador where idTrabajador=@idAdmin;
		
	if @@error>0
		begin
			print ('No se mostro el admin')
			rollback transaction
		end
		else
		begin
			print ('Se mostro el admin')
			commit transaction
		end;
go

CREATE PROCEDURE cons_empleado
	 @idEmp int

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
		select * from empleado where idTrabajador=@idEmp;

		
	if @@error>0
		begin
			print ('No se mostro el empleado')
			rollback transaction
		end
		else
		begin
			print ('Se mostro el empleado')
			commit transaction
		end;
go

CREATE PROCEDURE cons_zonaAlmacenamiento
	 @idZona smallint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
		select * from zonaAlmacenamiento where idZonaAlmacenamiento=@idZona;

		
	if @@error>0
		begin
			print ('No se mostro la zona')
			rollback transaction
		end
		else
		begin
			print ('Se mostro la zona')
			commit transaction
		end;
go

CREATE PROCEDURE cons_categoria
	 @idCategoria smallint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
		select idCategoria, idZonaAlmacenamiento, tipo from categoria where idCategoria=@idCategoria;

		
	if @@error>0
		begin
			print ('No se mostro la categoria')
			rollback transaction
		end
		else
		begin
			print ('Se mostro la categoria')
			commit transaction
		end;
go

CREATE PROCEDURE cons_producto
	 @idCProducto char(12)

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
		select * from productos where codigoProducto=@idCProducto;

	if @@error>0
		begin
			print ('No se msotro el producto')
			rollback transaction
		end
		else
		begin
			print ('Se mostro el producto')
			commit transaction
		end;
go

CREATE PROCEDURE cons_controlActivos
	 @idCActivos int

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
		select * from controlActivos where idControl=@idCActivos;

		
	if @@error>0
		begin
			print ('No se mostro el control de activos')
			rollback transaction
		end
		else
		begin
			print ('Se mostro el control de activos')
			commit transaction
		end;
go

-------BY WEB-----


create procedure loggin 
	@codigo char(6),
	@tipoTrabajador bit
	AS
		DECLARE 
			@Tabla TABLE (nombre varchar(64));
		DECLARE
			@idTrabajador int;

		if @tipoTrabajador='True'
			begin
				IF EXISTS (SELECT * FROM administrador WHERE codigoAdministrador = @codigo)
					begin
						set @idTrabajador = (SELECT idTrabajador FROM administrador WHERE codigoAdministrador = @codigo);
						insert into @Tabla(nombre)
						select t.nombre +' '+ t.apellido1
						from [dbo].[trabajador] t  where idTrabajador = @idTrabajador
					end
			    ELSE
					INSERT INTO @Tabla(nombre) values('no existe')
					
			end
		else 
			begin
				IF EXISTS (SELECT * FROM empleado WHERE codigoEmpleado = @codigo)
					begin
						set @idTrabajador = (SELECT idTrabajador FROM empleado WHERE codigoEmpleado = @codigo);
						insert into @Tabla(nombre)
						select t.nombre +' '+ t.apellido1
						from [dbo].[trabajador] t  where idTrabajador = @idTrabajador
					end
			    ELSE
					INSERT INTO @Tabla(nombre) values('no existe')
					
			end

		select *from @Tabla
	go
			

create procedure get_productos 
as 
	select codigoProducto , nombre,precioCompra,precioVenta,estado,cantidad from productos

go

create procedure get_producto
 @codigoProducto char(12)
AS
	DECLARE
	@Tabla TABLE (	
	idMercaderia char(12),
	codigoProducto char(12),
	idCategoria smallint,
	nombre varchar(32) ,
	precioVenta smallmoney ,
	precioCompra smallmoney  ,
	estado tinyint ,
	cantidad int );

	IF EXISTS (select idMercaderia from mercaderiaProductos where codigoProducto = @codigoProducto)
					begin
						insert into @Tabla(idMercaderia,codigoProducto,idCategoria,nombre ,precioVenta ,precioCompra ,estado ,cantidad)
						SELECT
							M.idMercaderia,
							P.codigoProducto,
							P.idCategoria,
							P.nombre ,
							P.precioVenta ,
							P.precioCompra,
							P.estado ,
							P.cantidad
						FROM [dbo].[mercaderiaProductos] M, [dbo].[Productos] P
						WHERE M.codigoProducto = @codigoProducto AND P.codigoProducto = @codigoProducto
					end
	
	SELECT *From @Tabla

	go
