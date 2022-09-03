

--------------------------------datos-----------------------------------


insert into provincia values(1 , 'San José')
insert into provincia values(2, 'Alajuela')
insert into provincia values(3, 'Cartago')
insert into provincia values(4, 'Guanacaste')
insert into provincia values(5, 'Heredia')
insert into provincia values(6, 'Limón')
insert into provincia values(7,'Puntarenas')

insert into canton values (1,2,'Alajuela')
insert into canton values (2,2,'Atenas')
insert into canton values (3,2,'Grecia')
insert into canton values (4,2,'San Carlos')
insert into canton values (5,2,'Rio Cuarto')

insert into distrito values (1,4,'Aguas Zarcas')
insert into distrito values (2,4,'Fortuna')
insert into distrito values (3,4,'Ciudad Quesada')
insert into distrito values (4,4,'Santa Clara')
insert into distrito values (5,4,'Venecia')


execute ins_supermercado 1, '8895-3002','supermolina@gmail.com',4,'400 mts este de la Escuela Rafael Ponce'


execute ins_telefono_supermercado 1,'8895-3003'
execute ins_telefono_supermercado 1,'8895-3303'
execute ins_telefono_supermercado 1,'8895-3403'

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




