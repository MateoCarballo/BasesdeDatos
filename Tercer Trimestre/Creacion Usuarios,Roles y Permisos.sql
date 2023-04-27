#--------------------------------------------------------------------------------------------
#	UTILIZACIÓN DE LA Base de Datos 'NBA'
#--------------------------------------------------------------------------------------------
use nba;
#--------------------------------------------------------------------------------------------
#	1. Creamos los usuarios Usuario1, Usuario2, Usuario3 y Usuario4.
#--------------------------------------------------------------------------------------------

DROP user if exists Usuario1,Usuario2,Usuario3,Usuario4,Usuario0 ;
 Create user	Usuario0 identified by 'abc',
				Usuario1 identified by 'abc',
				Usuario2 identified by 'abc',
				Usuario3 identified by 'abc',
				Usuario4 identified by 'abc';
#--------------------------------------------------------------------------------------------
#	2. Creamos los roles Rol1, Rol2 y Rol3.
#--------------------------------------------------------------------------------------------
Drop role if exists Rol1,Rol2,Rol3,Rol4,Rol0;
Create role if not exists Rol1;
Create role if not exists Rol2; 
Create role if not exists Rol3; 
Create role if not exists Rol4;
Create role if not exists Rol0;
#--------------------------------------------------------------------------------------------
#	3. Asignamos Privilegios a los Roles ( R1 - seleccionar(Permite consultar las tablas), 
# 											R2 - agregar(Permite insertar datos en las tablas), 
#											R3 - borrar ).
#--------------------------------------------------------------------------------------------
Grant select on NBA.* to Rol1;
Grant insert on NBA.* to Rol2;
Grant delete on NBA.* to Rol3;
Grant update on NBA.* to Rol4;
Grant all on 	NBA.* to Rol0;
#--------------------------------------------------------------------------------------------
#	4. Asignamos Roles a Usuarios.
#		Usuario1 -> Rol1 y Rol2
#		Usuario2 -> Rol1 y Rol3
#		Usuario3 -> Rol2 y Rol3
#		Usuario4 -> Rol1, Rol2 y Rol3
#--------------------------------------------------------------------------------------------
Grant Rol0					to Usuario0;
Grant Rol1,Rol2,Rol4		to Usuario1;
Grant Rol1,Rol3 		 	to Usuario2;
Grant Rol2,Rol3 		 	to Usuario3;
Grant Rol1,Rol2,Rol3,Rol4 	to Usuario4;
#--------------------------------------------------------------------------------------------
#	5. Activamos los Roles de los Usuarios (si crees necesario).
#--------------------------------------------------------------------------------------------
set default role all to Usuario0,Usuario1,Usuario2,Usuario3,Usuario4;


