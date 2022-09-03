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
	


	create procedure get_proveedores
	as 
	select *from proveedores;
	
	go

	create procedure get_proveedor
	@idProveedor tinyint
	as 
	select *from proveedores where idProveedor = @idProveedor
	go

	

	CREATE PROCEDURE cons_provedorTelefono
	 @idProveedor tinyint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    

		select * from telefonosProveedores where idProveedor=@idProveedor;

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

	CREATE PROCEDURE cons_provedorCorreo
	 @idProveedor tinyint

AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    

		select * from correosProveedores where idProveedor=@idProveedor;

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


-----Consultas avanzadas----

--Invertario completo (alfabeticamente y fecha de ingraso de la mercaderia)(productos, codigo, cantidad, nombre)
CREATE PROCEDURE consulta_inventario


AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    

		select m.idMercaderia, p.nombre ,p.codigoProducto, p.cantidad, p.precioVenta 
		from mercaderia m, mercaderiaProductos mp,productos p 
		where m.idMercaderia=mp.idMercaderia and mp.codigoProducto=p.codigoProducto
		order by p.nombre

	if @@error>0
		begin
			print ('Se muestra el inventario')
			rollback transaction
		end
		else
		begin
			print ('No se muestra el inventario')
			commit transaction
		end;
go

--Cosulta de producto por categoria (indicar zona de almacenamiento)
--'bebida''verdura''carnes''detergentes''snacks'
CREATE PROCEDURE consulta_pproductos_CategoriaNombre
	@nombre varchar(32)
AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    

		select * from info_productos where categoria=@nombre

	if @@error>0
		begin
			print ('Se muestra el producto')
			rollback transaction
		end
		else
		begin
			print ('No se muestra el producto')
			commit transaction
		end;
go



---proveedores(telefono correo)
CREATE PROCEDURE consulta_ProvedoresCorreoTel
AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    

		select * from info_proveedores

	if @@error>0
		begin
			print ('Se muestran los contactos')
			rollback transaction
		end
		else
		begin
			print ('No se muestran los contactos')
			commit transaction
		end;
go
--Consultar el ultimo empleado que realizo un control 
--de inventario a cierto producto (por ID) 
--(muestra el codigo de empleado y su nombre)
CREATE PROCEDURE consulta_ultimoControlActivo_codProducto
	@codigo char(12)
AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    

		select  * from empleado e, trabajador t, controlActivos c ,productos p
		where c.codigoEmpleado=e.codigoEmpleado and t.idTrabajador=e.idTrabajador and c.codigoProducto=p.codigoProducto and p.codigoProducto=@codigo
		order by c.fecha DESC 

	if @@error>0
		begin
			print ('Se muestra el control')
			rollback transaction
		end
		else
		begin
			print ('No se muestra el control')
			commit transaction
		end;
go
--Consultar historial de producto por codigo (muestra mercaderia fecha de ingraso etc)
CREATE PROCEDURE consulta_HistorialProducto_codProducto
	@codigo char(12)
AS
	declare
		@error bit;
		set @error='False';

	begin tran	
	    

		select m.idMercaderia, m.fechaIngreso, t.nombre+' '+t.apellido1+' '+t.apellido2 as 'Encargado', p.nombre ,p.codigoProducto
		from mercaderia m, mercaderiaProductos mp,productos p, administrador a, trabajador t
		where m.idMercaderia=mp.idMercaderia and mp.codigoProducto=p.codigoProducto and a.codigoAdministrador=m.codigoAdministrador and t.idTrabajador=a.idTrabajador and p.codigoProducto=@codigo
		order by p.nombre

	if @@error>0
		begin
			print ('Se muestra el control')
			rollback transaction
		end
		else
		begin
			print ('No se muestra el control')
			commit transaction
		end;
go