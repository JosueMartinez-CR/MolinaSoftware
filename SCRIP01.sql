CREATE DATABASE MOLINASOFTWARE

-------------------------------------Supermercado -----------------------------------------
CREATE TABLE supermercado (
	idSupermercado smallint NOT NULL PRIMARY KEY 
	);

CREATE TABLE telefonosSupermecado (
	idSupermercado smallint,
	telefono char(9) 
	);

CREATE TABLE direccionSupermercado (
	idDistrito smallint,
	idSupermercado smallint,
	señas varchar(200)
);


CREATE TABLE categoria (
	idCategoria smallint,
	idZonaAlmacenamiento smallint,
	tipo varchar(32),
	cantidadProductos int 

);

CREATE TABLE zonaAlmacenamiento (
	idZonaAlmacenamiento smallint,
	idSupermercado smallint,
	nombre varchar(32)
);

-------------------------------------------Direcciones-----------------------------------
CREATE TABLE distrito (
	idDistrito tinyint,
	idProvincia tinyint,
	nombre varchar(32)
);

CREATE TABLE canton (
	idCanton tinyint,
	idProvincia tinyint,
	nombre varchar(30)
);


CREATE TABLE provincia (
	idProvincia tinyint,
	nombre varchar(30)
);


------------------------------------------Trabajadores-----------------------------------
CREATE TABLE trabajador(
	idTrabajador int,
	nombre varchar(64),
	apellido1 varchar (64),
	apellido2 varchar (64),

);


CREATE TABLE empleado(
	codigoEmpleado char(6),
	idTrabajador int,
	idSupermercado smallint

);

CREATE TABLE administrador(
	codigoAdministrador char(6),
	idTrabajador int,
);


------------------------------------------Control de Activos-----------------------------
CREATE TABLE controlActivos(
	idControl int,
	codigoEmpleado char(6),
	codigoProducto char(11),
	fecha date,
	cantidadEnStock int,
	cantidadEnSistema int

);


-------------------------------------------Proveedores------------------------------------
CREATE TABLE proveedores (
	idProveedor int, 
	nombre varchar,
	correo varchar

	);

CREATE TABLE telefonosProveedores (
	idProveedor int,
	telefono char(9)
);

CREATE TABLE correosProveedores (
	idProveedor int,
	correo varchar(9)
);

CREATE TABLE mercaderia (
 idMercaderia int,
 idProveedor smallint,
 codigoAdministrador char(6),
 fechaIngreso date,
 cantidadProductos int

);

CREATE TABLE productos (
	codigoProducto char(11),
	idMercaderia int NOT NULL PRIMARY KEY,
	idCategoria smallint ,
	nombre varchar(32),
	precioVenta money,
	precioCompra money,
	estado tinyint,
	cantidad int
)



----------------------------------------Union Supermercado Proveedores --------------------
CREATE TABLE supercadoProveedores ( 

	idSupermercado smallint NOT NULL,
	idProveedor smallint NOT NULL  

  );

-------------------------reglas----------------------

CREATE RULE RTELEFONO AS 
	@telefono like '[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' 
GO

EXEC SP_BINDRULE RTELEFONO, 'telefonosProveedores.telefono'
GO

EXEC SP_BINDRULE RTELEFONO, 'supermercado.idSupermercado'
GO



CREATE RULE RidEmpleado AS 
	@idTrabajador LIKE '[0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
GO

EXEC SP_BINDRULE RidEmpleado, 'trabajador.idTrabajador'
GO

CREATE RULE RCodigoProducto AS 
	@codigo LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
GO

EXEC SP_BINDRULE RCodigoProducto, 'productos.codigoProducto'
GO

CREATE RULE RZonaAlmacen AS 
	@numalmacen LIKE '[1-5]'
GO

EXEC SP_BINDRULE RZonaAlmacen, 'zonaAlmacenamiento.idZonaAlmacenamiento'
GO

CREATE RULE RCodigoAdm AS 
	@codadm LIKE 'ADM-[0-9][0-9][0-9]'
GO



EXEC sp_unbindrule RCodigoAdm, 'administrador.codigoAdministrador'
GO




CREATE RULE RCodigoEmp AS 
	@codemp LIKE 'EMP-[0-9][0-9][0-9]'
GO

EXEC SP_BINDRULE RCodigoEmp, 'empleado.codigoempleado'
GO

----------------------------procedimientos----------------------------




