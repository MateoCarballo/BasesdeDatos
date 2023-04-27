#*******************************************************************************************
#	CREACIÓN Y USO DE LA BASE DE DATOS 'BancoTeis'
#*******************************************************************************************
DROP DATABASE IF EXISTS BancoTeis;
CREATE DATABASE BancoTeis;
USE BancoTeis;

#*******************************************************************************************
#	CREACIÓN DE LAS TABLAS DE LA BASE DE DATOS
#-------------------------------------------------------------------------------------------
#	idCliente	entero, clave primaria, autoincremental
#	propietaria	cadena de 30 caracteres
#	balance		entero
#*******************************************************************************************
CREATE TABLE cuentas(
idCliente	INT AUTO_INCREMENT PRIMARY KEY,
propietaria	VARCHAR (30),
balance		INT);
#*******************************************************************************************
#	INICIAMOS LAS CUENTAS CON 1000 €
#-------------------------------------------------------------------------------------------
#	Fulgencia, Pancracia y Guillermina con un balance inicial de 1000€
#*******************************************************************************************
-- Solo quiero introducir los datos una vez por eso esta comentado pero esta es la estructura usada para añadir tablas

START transaction;

lOCK TABLE cuentas write;
commit;
Delete from cuentas where propietaria="Fulgencia" or propietaria = "Pancracia" or propietaria="Guillermina";

INSERT INTO cuentas (propietaria,balance) values ("Fulgencia",1000),("Pancracia",1000),("Guillermina",1000);

Unlock table;

rollback;
#*******************************************************************************************
#	CREAMOS LAS TRES USUARIAS Y LES DAMOS TODOS LOS PERMISOS EN LA BASE DE DATOS CREADA
#*******************************************************************************************
-- Creamos un rol SuperRol que da todos los permisos
Drop user if exists Fulgencia, Pancracia, Guillermina;
Create user Fulgencia identified by 'abc', Pancracia identified by 'abc', Guillermina identified by 'abc';
Grant all on BancoTeis.* to Fulgencia, Pancracia, Guillermina;




show tables;
select * from cuentas;