#--------------------------------------------------------------------------------------------
#	UTILIZACIÓN DE LA Base de Datos 'NBA'
#--------------------------------------------------------------------------------------------
use nba;
#--------------------------------------------------------------------------------------------
#	1. Creamos los usuarios Usuario1, Usuario2, Usuario3 y Usuario4.
#--------------------------------------------------------------------------------------------
DROP user if exists usuario1,usuario2,usuario3,usuario4 ;
 Create user	usuario1 identified by 'abc',
				usuario2 identified by 'abc',
				usuario3 identified by 'abc',
				usuario4 identified by 'abc';
#--------------------------------------------------------------------------------------------
#	2. Creamos los roles Rol1, Rol2 y Rol3.
#--------------------------------------------------------------------------------------------
Drop role if exists Rol1,Rol2,Rol3,Rol4;
Create role if not exists Rol1;
Create role if not exists Rol2; 
Create role if not exists Rol3; 
Create role if not exists Rol4;
#--------------------------------------------------------------------------------------------
#	3. Asignamos Privilegios a los Roles ( R1 - seleccionar, R2 - agregar, R3 - borrar ).
#--------------------------------------------------------------------------------------------
Grant select on * to Rol1;
Grant insert on * to Rol2;
Grant delete on * to Rol3;
#--------------------------------------------------------------------------------------------
#	4. Asignamos Roles a Usuarios.
#		Usuario1 -> Rol1 y Rol2
#		Usuario2 -> Rol1 y Rol3
#		Usuario3 -> Rol2 y Rol3
#		Usuario4 -> Rol1, Rol2 y Rol3
#--------------------------------------------------------------------------------------------
Grant Rol1,Rol2 		on nba to usuario1;
Grant Rol1,Rol3 		on nba to usuario2;
Grant Rol2,Rol3 		on nba to usuario3;
Grant Rol1,Rol2,Rol3 	on nba to usuario4;
#--------------------------------------------------------------------------------------------
#	5. Activamos los Roles de los Usuarios (si crees necesario).
#--------------------------------------------------------------------------------------------

