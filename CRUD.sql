
 
CREATE PROCEDURE ins_proveedor
	@idProveedor tinyint,
	@nombre varchar(32),
	@telefono FTelefono,
	@correo FCorreo

AS
	declare
		@error bit;
	set @error='False';

	
	begin tran
		insert into proveedores (idProveedor,nombre)
		values(@idProveedor,@nombre);
		if @@error>0
		begin
			print ('Error en el ID del proveedor')
			set @error='True';
		end
		
		insert into telefonosProveedores (idProveedor,telefono)
		values (@idProveedor , @telefono);

		if @@error>0
		begin
			print ('Error en el telefono del proveedor')
			set @error='True';
		end

		insert into correosProveedores (idProveedor,correo)
		values (@idProveedor , @correo);
		if @@error>0
		begin
			print ('Error en el correo del proveedor')
			set @error='True';
		end

		--Validando tran---
		if @error='True'
		begin
			print ('NO se registró el proveedor')
			rollback transaction
		end

		else
		begin
			print ('Se registró el proveedor')
			commit transaction
		end;



CREATE PROCEDURE ins_supermercado
	@idSupermercado tinyint,
	@telefono FTelefono,
	@correo FCorreo

AS
	declare
		@error bit;
	set @error='False';

	
	begin tran
		insert into supermercado (idSupermercado)
		values(@idSupermercado);
		if @@error>0
		begin
			print ('Error en el ID del proveedor')
			set @error='True';
		end
		
		insert into telefonosSupermecado (idSupermercado,telefono)
		values (@idSupermercado , @telefono);

		if @@error>0
		begin
			print ('Error en el telefono del proveedor')
			set @error='True';
		end

		insert into correosSupermercado(idSupermercado,correo)
		values (@idSupermercado , @correo);
		if @@error>0
		begin
			print ('Error en el correo del proveedor')
			set @error='True';
		end

		--Validando tran---
		if @error='True'
		begin
			print ('NO se registró el proveedor')
			rollback transaction
		end

		else
		begin
			print ('Se registró el proveedor')
			commit transaction
		end;


