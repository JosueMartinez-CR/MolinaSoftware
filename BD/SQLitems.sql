USE [MOLINASOFTWARE]
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
GO
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



go


create view info_controles_mercaderia as 
select t.nombre+' '+t.apellido1+' '+t.apellido2 as nombre_completo,a.codigoAdministrador from trabajador t, administrador a where t.idTrabajador=a.idTrabajador
union
select t.nombre+' '+t.apellido1+' '+t.apellido2 as nombre_completo,e.codigoEmpleado from trabajador t, empleado e where t.idTrabajador=e.idTrabajador




go

----------procedimientos con trigger-------------
----------No mas supermercados
create or alter trigger trigger_evita_mod_supermercado
on supermercado 
for insert
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

---No mas de 3 telefonos proveedores
create or alter trigger dbo.trigger_validar_telefono_proveedor
on telefonosProveedores
for insert
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

----No más de 3 correos provedores
create or alter trigger dbo.trigger_validar_correo_proveedor
on correosProveedores
for insert
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

----No mas de tres telefonos supermercados
create or alter trigger dbo.trigger_validar_telefonos_supermercado
on telefonosSupermecado
for insert
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

----No más de 3 correos supermercado
create or alter trigger dbo.trigger_validar_correos_supermercado
on correosSupermercado
for insert
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
