
use[MOLINASOFTWARE]
CREATE PROCEDURE ins_proveedor
	@idProveedor tinyint,
	@idSupermercado tinyint,
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

		insert into supercadoProveedores (idSupermercado, idProveedor)
		values (@idSupermercado, @idProveedor)
		if @@error>0
		begin
			print ('Debe ingresar un Supermercado valido')
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


GO


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
			print ('NO se registró el supermercado')
			rollback transaction
		end

		else
		begin
			print ('Se registró el proveedor')
			commit transaction
		end;
GO

CREATE PROCEDURE ins_telefono_proveedor
	@idProveedor tinyint,
	@telefono FTelefono

AS
	declare
		@error bit;
		set @error='False';
	
	begin tran
		insert into telefonosProveedores (idProveedor,telefono)
		values (@idProveedor,@telefono)
		if @@error>0
		begin
			print ('Error al insertar el telefono')
			set @error='True';
			rollback transaction
		end
		else
		begin
			print ('Se registró el teléfono del proveedor')
			commit transaction
		end;

go


CREATE PROCEDURE ins_correo_proveedor
	@idProveedor tinyint,
	@correo FCorreo

AS
	declare
		@error bit;
		set @error='False';

	begin tran
		insert into correosProveedores (idProveedor, correo)
		values (@idProveedor,@correo)
	if @@error>0
		begin
			print ('Error al insertar el correo')
			set @error='True';
			rollback transaction
		end
		else
		begin
			print ('Se registró el correo del proveedor')
			commit transaction
		end;

go

CREATE PROCEDURE ins_telefono_supermercado
	@idSupermercado tinyint,
	@telefono FTelefono

AS
	declare
		@error bit;
		set @error='False';

	begin tran
		insert into telefonosSupermecado(idSupermercado,telefono)
		values (@idSupermercado,@telefono)

	if @@error>0
		begin
			print ('Error al insertar el telefono')
			rollback transaction
		end
		else
		begin
			print ('Se registró telefono del supermercado')
			commit transaction
		end;
go



CREATE PROCEDURE ins_correo_supermercado
	@idSupermercado tinyint,
	@correo FCorreo
AS
	declare
		@error bit;
		set @error='False';

	begin tran
		insert into correosSupermercado(idSupermercado, correo)
		values (@idSupermercado,@correo)

	if @@error>0
		begin
			print ('Error al insertar el correo del supermercado')
			rollback transaction
		end

		else
		begin
			print ('Se registró el correo del supermercado')
			commit transaction
		end;
go



CREATE PROCEDURE ins_trabajador_admin
    @idTrabajador int,
	@codigoAdmin FCodigoAdmin,
	@idSupermercado tinyint,
	@nombre varchar(64) ,
	@apellido1 varchar (32),
	@apellido2 varchar (32)

	as
		declare 
			@error bit;
			set @error = 'False';

		begin tran
			insert into trabajador (idTrabajador,idSupermercado,nombre,apellido1,apellido2)
			values(@idTrabajador,@idSupermercado,@nombre,@apellido1,@apellido2)
			
			if @@error >0 
				begin 
					print('No ha sido posible insertar al trabajador')
					set @error='True';
				end;
			
			insert into administrador (idTrabajador,codigoAdministrador)
			values (@idTrabajador,@codigoAdmin)
			if @@error>0
				begin 
					print('Error al insertar como admin')
					set @error='True';
				end;


		if @error='True'
			begin
				print ('NO se registró el admin')
				rollback transaction
			end

			else
			begin
				print ('Se registró el admin')
				commit transaction
			end;

	go

CREATE PROCEDURE ins_trabajador_empleado
    @idTrabajador int,
	@codigoEmpleado FCodigoEmpleado,
	@idSupermercado tinyint,
	@nombre varchar(64) ,
	@apellido1 varchar (32),
	@apellido2 varchar (32)

	as
		declare 
			@error bit;
			set @error = 'False';

		begin tran
			insert into trabajador (idTrabajador,idSupermercado,nombre,apellido1,apellido2)
			values(@idTrabajador,@idSupermercado,@nombre,@apellido1,@apellido2)
			
			if @@error >0 
				begin 
					print('No ha sido posible insertar al trabajador')
					set @error='True';
				end;
			
			insert into empleado(idTrabajador,codigoEmpleado)
			values (@idTrabajador,@codigoEmpleado)
			if @@error>0
				begin 
					print('Error al insertar como empleado')
					set @error='True';
				end;


		if @error='True'
			begin
				print ('NO se registró el admin')
				rollback transaction
			end

			else
			begin
				print ('Se registró el admin')
				commit transaction
			end;

	go		


------------------------------------------------------
CREATE PROCEDURE ins_mercaderia 
	 @idMercaderia FidMercaderia,
	 @idProveedor tinyint ,
	 @codigoAdministrador FcodigoAdmin,
	 @fechaIngreso date ,
	 @cantidadProductos int
AS
	declare
		@error bit;
		set @error='False';

	begin tran	

		insert into mercaderia (idMercaderia,idProveedor,codigoAdministrador ,fechaIngreso,cantidadProductos)
		values (@idMercaderia,@idProveedor,@codigoAdministrador ,@fechaIngreso,@cantidadProductos)

	if @@error>0
		begin
			print ('No se insertó la mercaderia')
			rollback transaction
		end
		else
		begin
			print ('Se insertó la mercadería')
			commit transaction
		end;
go


CREATE PROCEDURE ins_zonaAlmacenamiento 
	@idZonaAlmacenamiento smallint,
	@idSupermercado tinyint,
	@nombre varchar(32)

	AS 
		insert into zonaAlmacenamiento(idZonaAlmacenamiento,idSupermercado,nombre)
		values (@idZonaAlmacenamiento,@idSupermercado,@nombre)


go


CREATE PROCEDURE ins_categoria 
	@idCategoria smallint,
	@idZonaAlmacenamiento smallint,
	@tipo varchar(32)

	AS 
		insert into categoria(idCategoria,idZonaAlmacenamiento,tipo,cantidadProductos)
		values (@idCategoria,@idZonaAlmacenamiento,@tipo,0)

go


CREATE PROCEDURE ins_nuevo_producto
	@idMercaderia FidMercaderia,
	@codigoProducto char(12),
	@idCategoria smallint,
	@nombre varchar(32) ,
	@precioVenta smallmoney ,
	@precioCompra smallmoney  ,
	@estado tinyint ,
	@cantidad int 

	AS 
		declare 
			@error bit;
			set @error='False';
		
		begin tran
			insert into productos(codigoProducto,idCategoria,nombre,precioVenta,precioCompra,estado,cantidad)
			values(@codigoProducto,@idCategoria,@nombre,@precioVenta,@precioCompra,@estado,@cantidad)
			
			if @@error>0
				begin 
					print('Error al insertar el producto')
					set @error='True';
				end

				insert into mercaderiaProductos(idMercaderia,codigoProducto)
				values (@idMercaderia,@codigoProducto)
			if @@error>0
				begin 
					print('Error al ingresar a la tabla mercaderia productos')
					set @error='True';
				end

			if @error='True'
			begin
				print ('NO se registró el producto')
				rollback transaction
			end

			else
			begin
				print ('Se registró el producto')
				commit transaction
			end;

	go
			


-----------------------------vistas---------------------------------
--create view productos as select * from
--create view productos as select *
--create view productos as select *

go
----------procedimientos con trigger-------------
create or alter trigger trigger_evita_mod_supermercado
on supermercado 
for insert,update
as 
	declare 
		@cantSupermercado tinyint;
		
		set @cantSupermercado=(select count(*) from supermercado);
		if (@cantSupermercado>1)
		begin
			RAISERROR('No se puede incertar mas de un supermercado',16,1)
			rollback;
		end
		else
		begin
			print('Se incerto correctamente')
		end;
go

create or alter trigger dbo.trigger_validar_telefono_proveedor
on telefonosProveedores
for insert,update
as
	declare
		@cant_telefonos tinyint,
		@idProvedor tinyint;
		set @idProvedor=(select idProveedor from inserted);
		set @cant_telefonos=(select COUNT(telefono) from telefonosProveedores where idProveedor=@idProvedor);

	if (@cant_telefonos>2)
	begin
		RAISERROR('Los proveedores tienen un limite de dos telefonos',16,1)
		rollback;
	end
	else
	begin
		print ('este proveedor tiene un total de '+cast (@cant_telefonos as char(1))+' telefonos ')	
	end;
go

create or alter trigger dbo.trigger_validar_correo_proveedor
on correosProveedores
for insert,update
as
	declare
		@cant_correos tinyint,
		@idProvedor tinyint;
		set @idProvedor=(select idProveedor from inserted);
		set @cant_correos=(select COUNT(correo) from correosProveedores where idProveedor=@idProvedor);

	if (@cant_correos>2)
	begin
		RAISERROR('Los proveedores tienen un limite de dos correos',16,1)
		rollback;
	end
	else
	begin
		print ('este proveedor tiene un total de '+cast (@cant_correos as char(1))+' correos ')	
	end;







go







--------------------------------datos-----------------------------------


execute ins_supermercado 1, '8895-3002','algo@gmail.com'


exec ins_zonaAlmacenamiento 123,123,'Frescas'
exec ins_categoria 123,123,'verduras'

exec ins_proveedor 123,123,'cositas frescas','4566-1233','cosfre@zv.com'
exec ins_mercaderia 'MC2022123456',123,'A123456','2022-05-03',123
exec ins_nuevo_producto 'MC2022123456',123456789123,123,'camote',255,150,1,12


execute ins_proveedor 1,1, 'e', '2020-2020', 'pan@gmail.com'
execute ins_proveedor 2,1, 'x', '2020-2020', 'pan@gmail.com'
execute ins_proveedor 3,1, 'b', '2020-2020', 'pan@gmail.com'

execute ins_telefono_proveedor 1,'0080-0682'
execute ins_telefono_proveedor 1,'0080-0681'
delete from telefonosProveedores where telefono='0080-0681'
delete from telefonosProveedores where telefono='0080-0682'



execute ins_correo_proveedor 1,'cooreoooo@gmail.com'
delete from correosProveedores where correo='cooreo@gmail.com'
delete from Proveedores where telefono='0080-0682'

select * from telefonosProveedores
select * from Proveedores
select * from correosProveedores
execute ins_supermercado 1, '8895-3002','algo@gmail.com'
select * from supermercado
