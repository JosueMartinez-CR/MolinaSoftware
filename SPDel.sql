
USE [MOLINASOFTWARE]
go
--------------------------------borrar
CREATE PROCEDURE del_proveedor 
	 @idProveedor tinyint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    
		delete from proveedores where idProveedor=@idProveedor;
	if @@error>0
		begin
			print ('No se borr� el proveedor')
			rollback transaction
		end
		else
		begin
			print ('Se borr� el proveedor')
			commit transaction
		end;
go

CREATE PROCEDURE del_telfonoProveedor 
	 @idProveedor tinyint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    
		delete from telefonosProveedores where idProveedor=@idProveedor;
		
	if @@error>0
		begin
			print ('No se borr� el telefono')
			rollback transaction
		end
		else
		begin
			print ('Se borr� el telefono')
			commit transaction
		end;

go

CREATE PROCEDURE del_correoProveedor 
	 @idProveedor tinyint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    
		delete from correosProveedores where idProveedor=@idProveedor;
	if @@error>0
		begin
			print ('No se borr� el proveedor')
			rollback transaction
		end
		else
		begin
			print ('Se borr� el proveedor')
			commit transaction
		end;
go

CREATE PROCEDURE del_supermercado 
	 @idSupermercado tinyint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    
		delete from supermercado where idSupermercado=@idSupermercado;
	if @@error>0
		begin
			print ('No se borr� el supermercado')
			rollback transaction
		end
		else
		begin
			print ('Se borr� el supermercado')
			commit transaction
		end;
go

CREATE PROCEDURE del_telefonoSupermercado
	 @idSupermercado tinyint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	

		delete from telefonosSupermecado where idSupermercado=@idSupermercado;

	if @@error>0
		begin
			print ('No se borr� el telefono')
			rollback transaction
		end
		else
		begin
			print ('Se borr� el telefono')
			commit transaction
		end;
go

CREATE PROCEDURE del_correoSupermercado 
	 @idSupermercado tinyint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	

		delete from correosSupermercado where idSupermercado=@idSupermercado;
	if @@error>0
		begin
			print ('No se borr� el correo')
			rollback transaction
		end
		else
		begin
			print ('Se borr� el correo')
			commit transaction
		end;
go









CREATE PROCEDURE del_admin 
	 @idAdmin FcodigoAdmin

AS
	declare
		@error bit;
		set @error='False';

	begin tran	

		delete from trabajador where 
			idTrabajador=(select idTrabajador from administrador where codigoAdministrador = @idAdmin );
		
	if @@error>0
		begin
			print ('No se borr� el admin')
			rollback transaction
		end
		else
		begin
			print ('Se borr� el admin')
			commit transaction
		end;
go

CREATE PROCEDURE del_empleado
	 @idEmp FcodigoEmpleado

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
		delete from trabajador where 
			idTrabajador=(select idTrabajador from empleado where codigoEmpleado = @idEmp );
		
	if @@error>0
		begin
			print ('No se borr� el empleado')
			rollback transaction
		end
		else
		begin
			print ('Se borr� el empleado')
			commit transaction
		end;
go

CREATE PROCEDURE del_zonaAlmacenamiento
	 @idZona smallint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
		delete from zonaAlmacenamiento where idZonaAlmacenamiento=@idZona;

		
	if @@error>0
		begin
			print ('No se borr� la zona')
			rollback transaction
		end
		else
		begin
			print ('Se borr� la zona')
			commit transaction
		end;
go

CREATE PROCEDURE del_categoria
	 @idCategoria smallint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
		delete from categoria where idCategoria=@idCategoria;

		
	if @@error>0
		begin
			print ('No se borr� la categoria')
			rollback transaction
		end
		else
		begin
			print ('Se borr� la categoria')
			commit transaction
		end;
go
CREATE PROCEDURE del_producto
	 @idCProducto char(12)

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
		delete from productos where codigoProducto=@idCProducto;

		
	if @@error>0
		begin
			print ('No se borr� el producto')
			rollback transaction
		end
		else
		begin
			print ('Se borr� el producto')
			commit transaction
		end;
go
CREATE PROCEDURE del_controlActivos
	 @idCActivos int

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
		delete from controlActivos where idControl=@idCActivos;

		
	if @@error>0
		begin
			print ('No se borr� el control de activos')
			rollback transaction
		end
		else
		begin
			print ('Se borr� el control de activos')
			commit transaction
		end;
go

