
use[MOLINASOFTWARE]
go
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
			print ('NO se registró el proveedor')
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
			

CREATE PROCEDURE ins_controlActivos 
	@idControl int,
	@codigoEmpleado FcodigoEmpleado,
	@codigoProducto char(12),
	@cantidaEnStock int	
	as
	declare
		@enSistema int, @fecha date;

		set @enSistema=(select cantidad from productos where codigoProducto = @codigoProducto);
		Set @fecha= (getdate());

		insert into controlActivos(idControl,codigoEmpleado,codigoProducto,fecha,cantidadEnStock,cantidadEnSistema)
		values (@idControl,@codigoEmpleado,@codigoProducto,@fecha,@cantidaEnStock,@enSistema)

go


-------------------------cursores



create procedure cursor_descontinuar
as
	declare
		@ganancia smallmoney,
		@precioCompra smallmoney ,
		@precioVenta smallmoney,
		@codigoProducto char(12);
	declare cursor1 CURSOR for select codigoProducto,precioCompra,precioVenta from productos;
	open cursor1
	fetch next from cursor1 into @codigoProducto,@precioCompra,@precioVenta
	while @@FETCH_STATUS = 0
	begin
		set @ganancia=@precioVenta-@precioCompra;
		if @ganancia<=0
		begin
			update productos 
			set		estado=0
			where codigoProducto=@codigoProducto;
		end;
		fetch next from cursor1 into @codigoProducto,@precioCompra,@precioVenta
	end;
	CLOSE cursor1
	DEALLOCATE cursor1

go
create procedure cursor_vigente
as
	declare
		@ganancia smallmoney,
		@precioCompra smallmoney ,
		@precioVenta smallmoney,
		@codigoProducto char(12);
	declare cursor1 CURSOR for select codigoProducto,precioCompra,precioVenta from productos;
	open cursor1
	fetch next from cursor1 into @codigoProducto,@precioCompra,@precioVenta
	while @@FETCH_STATUS = 0
	begin
		set @ganancia=@precioVenta-@precioCompra;
		if @ganancia>0
		begin
			update productos 
			set		estado=1
			where codigoProducto=@codigoProducto;
		end;
		fetch next from cursor1 into @codigoProducto,@precioCompra,@precioVenta
	end;
	CLOSE cursor1
	DEALLOCATE cursor1
-----------------------------vistas---------------------------------
create view info_productos as 
select p.nombre as producto, c.tipo as categoria, z.nombre AS almacen 
from productos p, categoria c,zonaAlmacenamiento z 
where p.idCategoria=c.idCategoria and z.idZonaAlmacenamiento=c.idZonaAlmacenamiento

go

create view info_proveedores as 

select p.nombre, c.correo from proveedores p, correosProveedores c where p.idProveedor=c.idProveedor 
union
select p.nombre, t.telefono from proveedores p, telefonosProveedores t where p.idProveedor=t.idProveedor






create view info_controles_mercaderia as 
select t.nombre+' '+t.apellido1+' '+t.apellido2 as nombre_completo,a.codigoAdministrador from trabajador t, administrador a where t.idTrabajador=a.idTrabajador
union
select t.nombre+' '+t.apellido1+' '+t.apellido2 as nombre_completo,e.codigoEmpleado from trabajador t, empleado e where t.idTrabajador=e.idTrabajador

select * from trabajador



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


create or alter trigger dbo.trigger_validar_telefonos_supermercado
on telefonosSupermecado
for insert,update
as
	declare
		@cant_telefonos tinyint,
		@idSupermercado tinyint;
		set @idSupermercado=(select idSupermercado from inserted);
		set @cant_telefonos=(select COUNT(telefono) from telefonosSupermecado where idSupermercado=@idSupermercado);

	if (@cant_telefonos>3)
	begin
		RAISERROR('Los supermercados tienen un limite de 3 telefonos',16,1)
		rollback;
	end
	else
	begin
		print ('este supermercado tiene un total de '+cast (@cant_telefonos as char(1))+' telefonos ')	
	end;

go
create or alter trigger dbo.trigger_validar_correos_supermercado
on correosSupermercado
for insert,update
as
	declare
		@cant_correos tinyint,
		@idSupermercado tinyint;
		set @idSupermercado=(select idSupermercado from inserted);
		set @cant_correos=(select COUNT(correo) from correosSupermercado where idSupermercado=@idSupermercado);

	if (@cant_correos>3)
	begin
		RAISERROR('Los supermercados tienen un limite de 3 correos',16,1)
		rollback;
	end
	else
	begin
		print ('este supermercado tiene un total de '+cast (@cant_correos as char(1))+' correos ')	
	end;


go

-----------------------------indice
create index idx_productoNombre
on productos (nombre)


create index idx_proveedorNombre
on proveedores (nombre)

create index idx_mercaderiaFecha
on mercaderia (fechaIngreso)

--------------------------------datos-----------------------------------


execute ins_supermercado 1, '8895-3002','supermolina@gmail.com'


execute ins_telefono_supermercado 1,'8895-3003'
execute ins_telefono_supermercado 1,'8895-3303'
execute ins_telefono_supermercado 1,'8895-3403'
--falta ins dir supermercado
execute ins_correo_supermercado 1, 'supermolina2@gmail.com'
execute ins_correo_supermercado 1, 'supermolina3@gmail.com'
execute ins_correo_supermercado 1, 'supermolina4@gmail.com'


execute ins_proveedor 1,1, 'Cocacola Femsa', '1233-2342', 'coca@gmail.com'
execute ins_proveedor 2,1, 'Dos Pinos', '2123-2332', 'dospinos@gmail.com'
execute ins_proveedor 3,1, 'Carnes chiken', '6425-6432', 'polloschiken@gmail.com'
execute ins_proveedor 4,1, 'Helados Frios', '5344-6643', 'heladoFreeze@gmail.com'
execute ins_proveedor 5,1, 'Whisky While', '2342-1234', 'WWWWW@gmail.com'
execute ins_proveedor 6,1, 'Arrocera Norte', '2555-4312', 'Arnort345@gmail.com'
exec ins_proveedor 123,1,'cositas frescas','4566-1233','cosfre@zv.com'



execute ins_telefono_proveedor 1,'0080-0682'
execute ins_telefono_proveedor 3,'0080-0681'


execute ins_correo_proveedor 1,'dondondond@gmail.com'
execute ins_correo_proveedor 6,'arrobabryam@gmail.com'


execute ins_trabajador_admin 1,'A122456',1,'Raul','Montenegro','Varalles'
execute ins_trabajador_admin 2,'A123457',1,'Miguel','Alvarado','Ugalde'
execute ins_trabajador_admin 3,'A127258',1,'Jose','Jimenez','Varela'
execute ins_trabajador_admin 4,'A128259',1,'Louis','Morales','Torres'


execute ins_trabajador_empleado 5,'E123456',1,'Pablo','Perez','Varalles'
execute ins_trabajador_empleado 6,'E133457',1,'Martin','Bustamante','Altozano'
execute ins_trabajador_empleado 7,'E137458',1,'Brayan','Rojas','Cascante'
execute ins_trabajador_empleado 8,'E138459',1,'Rodrigo','Liarte','Lizano'



execute ins_mercaderia 'MC2022123456',1,'A123456','2022-05-03',123
execute ins_mercaderia 'MC2022123457',2,'A123456','2022-05-03',123
execute ins_mercaderia 'MC2022123458',3,'A123457','2022-05-03',123
execute ins_mercaderia 'MC2022123459',4,'A123457','2022-05-03',123
execute ins_mercaderia 'MC2022123450',5,'A123458','2022-05-03',123



exec ins_zonaAlmacenamiento 1,1,'Abarrotez'
exec ins_zonaAlmacenamiento 2,1,'Bebidas'
exec ins_zonaAlmacenamiento 3,1,'Limpieza'
exec ins_zonaAlmacenamiento 4,1,'Refrigerado'


exec ins_categoria 1,2,'bebida'
exec ins_categoria 2,1,'verdura'
exec ins_categoria 3,4,'carnes'
exec ins_categoria 4,3,'detergentes'
exec ins_categoria 5,1,'snacks'




select * from productos




execute ins_nuevo_producto 'MC2022123456',123456789123,2,'camote',255,150,1,12
execute ins_nuevo_producto 'MC2022123456',123456789124,2,'Yuca',255,150,1,12
execute ins_nuevo_producto 'MC2022123456',123456789125,2,'papa',255,150,1,12

execute ins_nuevo_producto 'MC2022123457',123456789126,3,'filete',255,150,1,12
execute ins_nuevo_producto 'MC2022123457',123456789127,3,'pollo',255,150,1,12
execute ins_nuevo_producto 'MC2022123457',123456789128,3,'salchichon',255,150,1,12

execute ins_nuevo_producto 'MC2022123458',123456789129,1,'cocacola',255,150,1,12
execute ins_nuevo_producto 'MC2022123458',123456789133,1,'pepsi',255,150,1,12

execute ins_nuevo_producto 'MC2022123459',123456789134,4,'ace',255,150,1,12
execute ins_nuevo_producto 'MC2022123459',123456789135,4,'ariel',255,150,1,12

execute ins_nuevo_producto 'MC2022123450',123456783136,5,'picarita',255,150,1,12
execute ins_nuevo_producto 'MC2022123450',123456783137,5,'papiola',255,150,1,12
execute ins_nuevo_producto 'MC2022123450',123456783138,5,'papupapiola',255,255,1,12

execute ins_controlActivos 1,'E12345',123456789123,'2022-05-03',15,15




