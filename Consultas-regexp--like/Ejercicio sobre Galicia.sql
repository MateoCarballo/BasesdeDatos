use concellosgalicia_debilidadxExistencia;

# Con Like si pones el simbolo "%" es que le da igual la posicion que tenga en ese lado si marcamos con "_" especificamos posiciones
# Muestra los datos del número de mujeres que acaben en 0
select * from poblacionGalicia
where mujeres LIKE '%0';

# Muestra los datos del número de hombres cuyo segundo dígito sea un 0.
select * from poblacionGalicia
where hombres LIKE '_0%';

# Muestra los datos en los que el antepenúltimo dígito de las mujeres sea un 3 y el penúltimo de los hombres sea un 8.
select * from poblacionGalicia
where mujeres LIKE '%3__' and hombres LIKE '%8_';

# Muesta los datos en los que tanto el número de mujeres como el de hombres contenga 13.
select * from poblacionGalicia
where mujeres LIKE '%13%' and hombres LIKE '%13%';

# Muestra los datos en los que el número de mujeres contenga un 10 y el de hombres no.
select * from poblacionGalicia
where mujeres LIKE '%10%' and hombres not like '%10%';

########### Comentado para solo ver lo de arriba select * from ConcellosGalicia;

# Muestra los datos de los Concellos que tengan dos vocales seguidas.
# Muestra nombres de concellos que contengan dos valores dentro del rango entre corchetes
select * from concellosgalicia
where nombre regexp '[aeiou]{2,}' ;
# Muestra los datos de los Concellos que empiecen y no acaben por 'a'.
select * from concellosgalicia
where nombre regexp '^a'and nombre not regexp 'a$'; 

# Muestra los datos de los Concellos que contengan 'ra', 'es', 'de', 'me'.
select * from concellosgalicia
where nombre regexp 'ra|es|de|me'  ;

# Muestra los datos de los Concellos que contengan tres aes.


select * from concellosgalicia
where nombre like '%a%a%a%';


# Muestra los datos de los Concellos que contengan dos erres.
select * from concellosgalicia
where nombre like '%r%r%';
# Muestra los datos de los Concellos que contengan dos aes y tres oes.
select * from concellosgalicia
where nombre like '%a%a%' and nombre like '%o%o%o%';
/*

Solucion con regexp

SELECT * FROM concellogalicia
where nombre regexp '(a.*){3}';
*/
