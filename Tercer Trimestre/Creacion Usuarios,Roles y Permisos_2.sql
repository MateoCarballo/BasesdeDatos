#--------------------------------------------------------------------------------------------
#	UTILIZACIÓN DE LA Base de Datos 'NBA'
#--------------------------------------------------------------------------------------------
use nba;
#--------------------------------------------------------------------------------------------
#	1. Creamos los roles Agregar, Borrar, Modificar, Listar, Todo.
#--------------------------------------------------------------------------------------------
Drop role if exists Rol1,Rol2,Rol3,Rol4;
Create role if not exists Rol1;
Create role if not exists Rol2; 
Create role if not exists Rol3; 
Create role if not exists Rol4;
#--------------------------------------------------------------------------------------------
#	2.	Asignamos los permisos necesarios para cada Rol.
#--------------------------------------------------------------------------------------------
Grant select on NBA.* to Rol1;
Grant insert on NBA.* to Rol2;
Grant delete on NBA.* to Rol3;
Grant update on NBA.* to Rol4;

#--------------------------------------------------------------------------------------------
#	3. Creamos los usuarios Usuario1, Usuario2, Usuario3 y Usuario4 y les asignamos los permisos.
#--------------------------------------------------------------------------------------------
DROP user if exists usuario1,usuario2,usuario3,usuario4 ;
DROP user if exists Usuario1,Usuario2,Usuario3,Usuario4 ;
 Create user	Usuario1 identified by 'abc' default role Rol1,Rol2,Rol3;
 Create user	Usuario2 identified by 'abc' default role Rol1,Rol3;
 Create user	Usuario3 identified by 'abc' default role Rol2,Rol3;
 Create user	Usuario4 identified by 'abc' default role Rol1,Rol2,Rol3,Rol4;
#--------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------