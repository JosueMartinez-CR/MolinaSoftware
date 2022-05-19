CREATE DATABASE MOLINASOFTWARE

-------------------------------------Supermercado -----------------------------------------
CREATE TABLE supermercado (
	idSupermercado smallint NOT NULL PRIMARY KEY 
	);

CREATE TABLE telefonosSupermecado (
	idSupermercado smallint NOT NULL,
	telefono char(9), 

	constraint PK_telefonos_supermercado
		primary key (idSupermercado,telefono),

	constraint FK_telefonos_supermercado_id
		foreign key (idSupermercado) references supermercado,

	constraint CHK_telefonos_personas_telefono
		check (telefono like ('[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))
	);


CREATE TABLE correosSupermercado (
	idSupermercado smallint NOT NULL,
	correo varchar(64) NOT NULL

	constraint PK_correos_supermercado
		primary key (idSupermercado,correo),

	constraint FK_correo_supermercado_id
		foreign key (idSupermercado) references supermercado,

	constraint CHK_correo_s
		check (correo like '%_@__%.__%')
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
	idSupermercado smallint NOT NULL,
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
	idSupermercado smallint NOT NULL,
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
	idSupermercado smallint NOT NULL,
	nombre varchar(64) NOT NULL,
	apellido1 varchar (32) NOT NULL,
	apellido2 varchar (32) NOT NULL,

	constraint FK_trabajador_supermercado
		foreign key (idSupermercado) references supermercado,
);


CREATE TABLE empleado(
	codigoEmpleado char(6) NOT NULL PRIMARY KEY,
	idTrabajador int NOT NULL, 

	constraint FK_empleado_trabajador
		foreign key (idTrabajador) references trabajador,

);

CREATE TABLE administrador(
	codigoAdministrador char(6) NOT NULL PRIMARY KEY,
	idTrabajador int NOT NULL,

	constraint FK_admin_trabajador
		foreign key (idTrabajador) references trabajador,
);


-------------------------------------------Proveedores------------------------------------
CREATE TABLE proveedores (
	idProveedor int NOT NULL PRIMARY KEY, 
	nombre varchar(32) NOT NULL,
	
	);

CREATE TABLE telefonosProveedores (
	idProveedor int NOT NULL,
	telefono char(9) NOT NULL,

	constraint PK_telefonos_proveedor
		primary key (idProveedor,telefono),

	constraint FK_telefonos_proveedor_id
		foreign key (idProveedor) references proveedores,

	constraint CHK_telefonos_proveedores_telefono
		check (telefono like ('[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))
	);

CREATE TABLE correosProveedores (
	idProveedor int NOT NULL,
	correo varchar(32) NOT NULL

	constraint PK_correos_proveedor
		primary key (idProveedor,correo),

	constraint FK_correo_proveedor_id
		foreign key (idProveedor) references proveedores,

	constraint CHK_correo
		check (correo like '%_@__%.__%')
);

CREATE TABLE mercaderia (
	 idMercaderia int NOT NULL PRIMARY KEY,
	 idProveedor int NOT NULL,
	 codigoAdministrador char(6) NOT NULL,
	 fechaIngreso date NOT NULL,
	 cantidadProductos int NOT NULL

	 constraint FK_mercaderia_proveedor
		foreign key (idProveedor) references proveedores,
	 constraint FK_mercaderia_Admin
		foreign Key (codigoAdministrador) references administrador,
);

CREATE TABLE productos (
	codigoProducto char(12) NOT NULL PRIMARY KEY,
	idMercaderia int NOT NULL,
	idCategoria smallint NOT NULL,
	nombre varchar(32) NOT NULL,
	precioVenta smallmoney NOT NULL,
	precioCompra smallmoney  NOT NULL,
	estado tinyint NOT NULL,
	cantidad int NOT NULL

	constraint FK_productos_mercaderia
		foreign key (idMercaderia) references mercaderia,

	constraint FK_productos_categoria
		foreign key (idCategoria) references categoria,
);





------------------------------------------Control de Activos-----------------------------
CREATE TABLE controlActivos(
	idControl int NOT NULL PRIMARY KEY,
	codigoEmpleado char(6) NOT NULL,
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

	idSupermercado smallint NOT NULL ,
	idProveedor int NOT NULL  

	constraint supermercado_proveedores 
		primary key (idSupermercado,idProveedor),
	constraint supercadoProveedores_supermercado
		foreign key(idSupermercado) references supermercado,
	constraint supercadoProveedores_proveedores
		foreign key (idProveedor) references proveedores
  );



