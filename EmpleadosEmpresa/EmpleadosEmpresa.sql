#------------------------------------------------------------------------------------------------------
#  1. Creación de la Base de Datos llamada EmpleadosEmpresa
#------------------------------------------------------------------------------------------------------
drop database if exists EmpleadosEmpresa;
create database EmpleadosEmpresa;


#------------------------------------------------------------------------------------------------------
#  2. Selecciona la base de datos recién creada para ser utilizada.
#------------------------------------------------------------------------------------------------------
use EmpleadosEmpresa;
#------------------------------------------------------------------------------------------------------
#  3. Crea un tabla llamada Empleados con los siguientes campos:
#		ID como un entero de 11 dígitos, autoincremental y llave primaria
#		Nombre como cadena de 30 caracteres
#		Apellidos como cadena de3 50 caracteres
#------------------------------------------------------------------------------------------------------

create table empleados(
ID					int,
Nombre				varchar(30),
Apellidos			varchar(50)
);

alter table empleados
modify ID int unique not null auto_increment primary key;
        
select * from empleados;
