#------------------------------------------------------------------------
#	CREAMOS LA BASE DE DATOS 'EJEMPLO'
#------------------------------------------------------------------------
drop database if exists Ejemplo;
create database			Ejemplo;
use						Ejemplo;
#------------------------------------------------------------------------
# 	CREAMOS LA TABLA PERSONA CON UN ÚNICO CAMPO 'Nombre' EN EL QUE VOLCAREMOS DATOS.
#------------------------------------------------------------------------
create table Persona(
	nombre varchar (20)

);

#------------------------------------------------------------------------
# 	AGREGAMOS DATOS A LA TABLA PERSONA
#------------------------------------------------------------------------
	insert into Persona values ('Engracia'),('Jacinta'), ('Jacinto'),('Jaden'),('Jela'),('Geni'),('Cela'),
		('María'),('Mario'),('Narciso'),('Obdulia'),('Serafin'),('Incógnito'),('Onofrio'),('Enetenguen');

#------------------------------------------------------------------------
#   1. Muestra todos los nombres de las personas.
#------------------------------------------------------------------------
select * from Persona;
#------------------------------------------------------------------------
#   2. Muestra todos los nombres que empiecen por la letra 'o'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP '^o';
select * from Persona where nombre like 'o%';
#------------------------------------------------------------------------
#   3. Muestra todos los nombres que contengan la letra 'o'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP 'o';
select * from Persona where nombre like '%o%';
#------------------------------------------------------------------------
#   4. Muestra todos los nombres que acaben por la letra 'o'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP 'a$';
select * from Persona where nombre like '%o';
#------------------------------------------------------------------------
#   5. Muestra todos los nombres que empiecen por la letra 'n' o por la 'o'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP '^(n|o)';
select * from Persona where nombre like 'o%' or nombre like 'n%)';
#------------------------------------------------------------------------
#   6. Muestra todos los nombres que contengan la letra 'n' o la letra 'o'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP 'o|n';
select * from Persona where nombre like '%o%' or nombre like '%n%)';
#------------------------------------------------------------------------
#   7. Muestra todos los nombres que NO contengan las letra 'n' NI la 'o'.
#------------------------------------------------------------------------
select * from Persona where nombre NOT REGEXP 'o|n';
select * from Persona where nombre not like '%o%' and nombre not like '%n%';
#------------------------------------------------------------------------
#   8. Muestra todos los nombres que acaben por la letra 'n' o por la 'o'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP '(n|o)$';
select * from Persona where nombre like '%n' or nombre like '%o';
#------------------------------------------------------------------------
#   9. Muestra todos los nombres que NO empiecen por la letra 'n' NI por la 'o'.
#------------------------------------------------------------------------
select * from Persona where nombre not REGEXP '^(n|o)';
select * from Persona where nombre not like 'n%' and nombre not like 'o%';
#------------------------------------------------------------------------
#  10. Muestra todos los nombres que NO acaben por la letra 'n' NI por la 'o'.
#------------------------------------------------------------------------
select * from Persona where nombre not REGEXP '(n|o)$';
select * from Persona where nombre not like '%n' and nombre not like '%o';
#------------------------------------------------------------------------
#  11. Muestra todos los nombres que empiecen por 'en'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP '^en';
select * from Persona where nombre like 'en%';
#------------------------------------------------------------------------
#  12. Muestra todos los nombres que NO empiecen por 'en'.
#------------------------------------------------------------------------
select * from Persona where nombre not REGEXP '^en';
select * from Persona where nombre not like 'en%';
#------------------------------------------------------------------------
#  13. Muestra todos los nombres que contengan 'en'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP 'en';
select * from Persona where nombre like '%en%';
#------------------------------------------------------------------------
#  14. Muestra todos los nombres que no contengan 'en'.
#------------------------------------------------------------------------
select * from Persona where nombre not REGEXP 'en';
select * from Persona where nombre not like '%en%';
#------------------------------------------------------------------------
#  15. Muestra todos los nombres que acaben por 'en'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP 'en$';
select * from Persona where nombre like '%en';
#------------------------------------------------------------------------
#  16. Muestra todos los nombres que NO acaben por 'en'.
#------------------------------------------------------------------------
select * from Persona where nombre not REGEXP 'en$';
select * from Persona where nombre not like '%en';
#------------------------------------------------------------------------
#  17. Muestra todos los nombres que empiecen, contengan o acaben por 'en'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP '^en|en|en$';
select * from Persona where nombre like 'en%' or nombre like '%en%' or nombre like '%en';
#------------------------------------------------------------------------
#  18. Muestra los nombres que 'Jela' y 'Geni'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP 'Jela|Geni';
select * from Persona where nombre like '%Jela%' and nombre like '%Geni%';#NO SE POIRQUE NO FUNCIONA
#------------------------------------------------------------------------
#  19. Muestra todos los nombres que empiecen por 'ja' o por 'ge'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP '^(ja|ge)';
select * from Persona where nombre like 'ja%' or nombre like 'ge%';
#------------------------------------------------------------------------
#  20. Muestra todos los nombres que contengan 'el' o 'el'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP 'el|en';
select * from Persona where nombre like '%el%' or nombre like '%en%';
#------------------------------------------------------------------------
#  21. Muestra todos los nombres que acaben por 'ia' o por 'in'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP '(ía|ia|in)$';
select * from Persona where nombre like '%ia' or nombre like '%in';
#------------------------------------------------------------------------
#  22. Muestra todos los nombres cuya segunda letra sea 'a' o 'e' y finalicen por 'a' u 'o'.
#------------------------------------------------------------------------
select * from Persona where nombre REGEXP '^[a-zA-Z][ae][a-zA-Z]*(a|o)$';
select * from Persona where nombre like '_a%' OR nombre LIKE '_e%' and (nombre like '%a' or nombre like '%o');

#Esta consulta seleccionará todos los nombres de la tabla "nombres" que cumplan con ambas condiciones.
# La expresión REGEXP '^[a-zA-Z][ae][a-zA-Z]*(a|o)$' indica que los nombres deben:
#Comenzar con una letra (mayúscula o minúscula).
#Tener una segunda letra igual a "a" o "e".
#Terminar con "a" o "o".
#Los caracteres [a-zA-Z] indican que la primera y última letra puede ser cualquier 
#letra mayúscula o minúscula. Los caracteres [ae] indican que la segunda letra solo puede ser "a" o "e".
#La expresión [a-zA-Z]* permite que los nombres contengan cualquier cantidad de letras (mayúsculas o minúsculas)
#entre la segunda y la última letra.




