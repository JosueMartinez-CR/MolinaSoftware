CREATE DATABASE MOLINASOFTWARE
USE [MOLINASOFTWARE]

 -------------------------------DATATYPE+RULE---------------------------

 ------------------Formato Telefonos ---------------------------
CREATE RULE RTelefono AS 
	@telefono like ('[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
GO

EXEC sp_addtype 		FTelefono,	'char(9)',		'not null'
GO

EXEC sp_bindrule 	'RTelefono', 'FTelefono'
GO
-----------------Formato Correos-----------------------------
CREATE RULE RCorreo AS 
	@correo like '%_@__%.__%'
GO
EXEC sp_addtype 		FCorreo,	'varchar(64)',		'not null'
GO
EXEC sp_bindrule 	'RCorreo', 'FCorreo'
GO

----------------Formato idMercadería --------------------
CREATE RULE RMercaderia AS 
	@idMercaderia like ('MC'+cast(YEAR(GETDATE()) as varchar(4))+'%')
GO
EXEC sp_addtype 		FidMercaderia,	'char(12)',		'not null'
GO
EXEC sp_bindrule 	'RMercaderia', 'FidMercaderia'
GO

-----------------Formato codigoAdmin --------------------------
CREATE RULE RcodigoAdmin AS 
	@codigoAdministrador like ('A[0-9][0-9][0-9][0-9][0-9]')
GO
EXEC sp_addtype 		FcodigoAdmin,	'char(6)',		'not null'
GO
EXEC sp_bindrule 	'RcodigoAdmin', 'FcodigoAdmin'
GO

-----------------Formato codigoEmpleado --------------------------
CREATE RULE RcodigoEmpleado AS 
	@codigoEmpleado like ('E[0-9][0-9][0-9][0-9][0-9]')
GO
EXEC sp_addtype 		FcodigoEmpleado,	'char(6)',		'not null'
GO
EXEC sp_bindrule 	'RcodigoEmpleado', 'FcodigoEmpleado'
GO




------------------------TABLAS-------------------------------------

-------------------------------------Supermercado -----------------------------------------
CREATE TABLE supermercado (
	idSupermercado tinyint NOT NULL PRIMARY KEY 
	);

CREATE TABLE telefonosSupermecado (
	idSupermercado tinyint NOT NULL,
	telefono FTelefono, 

	constraint PK_telefonos_supermercado
		primary key (idSupermercado,telefono),

	constraint FK_telefonos_supermercado_id
		foreign key (idSupermercado) references supermercado,


	);



CREATE TABLE correosSupermercado (
	idSupermercado tinyint NOT NULL,
	correo FCorreo,

	constraint PK_correos_supermercado
		primary key (idSupermercado,correo),

	constraint FK_correo_supermercado_id
		foreign key (idSupermercado) references supermercado,

	
);
-------------------------------------------Direcciones-----------------------------------
CREATE TABLE provincia (
	idProvincia tinyint NOT NULL PRIMARY KEY,
	nombre varchar(30) NOT NULL
);


CREATE TABLE canton (
	idCanton tinyint NOT NULL PRIMARY KEY,
	idProvincia tinyint NOT NULL,
	nombre varchar(30) NOT NULL

	constraint FK_canton_provincia_
		foreign key (idProvincia) references provincia,
);


CREATE TABLE distrito (
	idDistrito tinyint NOT NULL PRIMARY KEY,
	idCanton tinyint NOT NULL,
	nombre varchar(32) NOT NULL

	constraint FK_distrito_canton
		foreign key (idCanton) references canton,
);



CREATE TABLE direccionSupermercado (
	idDistrito tinyint NOT NULL,
	idSupermercado tinyint NOT NULL,
	señas varchar(200) 

	constraint PK_direccion
		primary key (idSupermercado,idDistrito),
	constraint FK_direccion_distrito
		foreign key (idDistrito) references distrito,
	constraint FK_direccion_supermercado
		foreign key (idSupermercado) references supermercado,
);

------------------------------Almacenamientos------------------------------
CREATE TABLE zonaAlmacenamiento (
	idZonaAlmacenamiento smallint NOT NULL PRIMARY KEY,
	idSupermercado tinyint NOT NULL,
	nombre varchar(32) NOT NULL
	
	constraint FK_zonaAlm_supermercado 
		foreign key (idSupermercado) references supermercado
);

CREATE TABLE categoria (
	idCategoria smallint NOT NULL PRIMARY KEY,
	idZonaAlmacenamiento smallint NOT NULL,
	tipo varchar(32) NOT NULL,
	cantidadProductos int NOT NULL

	constraint FK_categotia_zonaAlm 
		foreign key (idZonaAlmacenamiento) references zonaAlmacenamiento
);




------------------------------------------Trabajadores-----------------------------------
CREATE TABLE trabajador(
	idTrabajador int NOT NULL PRIMARY KEY,
	idSupermercado tinyint NOT NULL,
	nombre varchar(64) NOT NULL,
	apellido1 varchar (32) NOT NULL,
	apellido2 varchar (32) NOT NULL,

	constraint FK_trabajador_supermercado
		foreign key (idSupermercado) references supermercado,
);


CREATE TABLE empleado(
	codigoEmpleado FcodigoEmpleado PRIMARY KEY,
	idTrabajador int NOT NULL, 

	constraint FK_empleado_trabajador
		foreign key (idTrabajador) references trabajador,

);

CREATE TABLE administrador(
	codigoAdministrador FcodigoAdmin PRIMARY KEY,
	idTrabajador int NOT NULL,

	constraint FK_admin_trabajador
		foreign key (idTrabajador) references trabajador,
);


-------------------------------------------Proveedores------------------------------------
CREATE TABLE proveedores (
	idProveedor tinyint NOT NULL PRIMARY KEY, 
	nombre varchar(32) NOT NULL,
	
	);

	

CREATE TABLE telefonosProveedores (
	idProveedor tinyint NOT NULL,
	telefono FTelefono,

	constraint PK_telefonos_proveedor
		primary key (idProveedor,telefono),

	constraint FK_telefonos_proveedor_id
		foreign key (idProveedor) references proveedores,

	
	);

CREATE TABLE correosProveedores (
	idProveedor tinyint NOT NULL,
	correo FCorreo,

	constraint PK_correos_proveedor
		primary key (idProveedor,correo),

	constraint FK_correo_proveedor_id
		foreign key (idProveedor) references proveedores,
);


CREATE TABLE mercaderia (
	 idMercaderia FidMercaderia PRIMARY KEY,
	 idProveedor tinyint NOT NULL,
	 codigoAdministrador FcodigoAdmin,
	 fechaIngreso date NOT NULL,
	 cantidadProductos int NOT NULL

	 constraint FK_mercaderia_proveedor
		foreign key (idProveedor) references proveedores,
	 constraint FK_mercaderia_Admin
		foreign Key (codigoAdministrador) references administrador,
);

CREATE TABLE productos (
	codigoProducto char(12) NOT NULL PRIMARY KEY,
	idCategoria smallint NOT NULL,
	nombre varchar(32) NOT NULL,
	precioVenta smallmoney NOT NULL,
	precioCompra smallmoney  NOT NULL,
	estado tinyint NOT NULL,
	cantidad int NOT NULL

	constraint FK_productos_categoria
		foreign key (idCategoria) references categoria,
);

-------Un producto puede venir de varias mercaderias, es decir, la semana pasada trajeron caja
---esta semana volvieron a traer (son diversas mercaderias)

CREATE TABLE mercaderiaProductos (
	idMercaderia FidMercaderia,
	codigoProducto char(12),
	cantidadProducts smallint,



	constraint PK_productos_mercaderia 
		primary key (idMercaderia,codigoProducto),

	constraint FK_productos_mercaderia
		foreign key (idMercaderia) references mercaderia,
	constraint FK_mercaderia_productos
		foreign key (codigoProducto) references productos,
	
);




------------------------------------------Control de Activos-----------------------------
CREATE TABLE controlActivos(
	idControl int NOT NULL PRIMARY KEY,
	codigoEmpleado FcodigoEmpleado,
	codigoProducto char(12) NOT NULL,
	fecha date NOT NULL,
	cantidadEnStock int NOT NULL,
	cantidadEnSistema int NOT NULL

	constraint controlActivos_empleado
		foreign key (codigoEmpleado) references empleado,
	constraint controlActivos_producto
		foreign key (codigoProducto) references productos,
);






----------------------------------------Union Supermercado Proveedores --------------------
CREATE TABLE supercadoProveedores ( 

	idSupermercado tinyint NOT NULL ,
	idProveedor tinyint NOT NULL  

	constraint supermercado_proveedores 
		primary key (idSupermercado,idProveedor),
	constraint supercadoProveedores_supermercado
		foreign key(idSupermercado) references supermercado,
	constraint supercadoProveedores_proveedores
		foreign key (idProveedor) references proveedores,
  );



