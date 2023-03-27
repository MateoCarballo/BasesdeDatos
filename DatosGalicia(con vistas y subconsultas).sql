#------------------------------------------------------------------------------------------------
#  BASE DE DATOS DE GALICIA POR EXISTENCIA
#------------------------------------------------------------------------------------------------
# 	RESUELVE MEDIANTE CONSULTAS (Y/O SUBCONSULTAS) Y TAMBIÉN MEDIANTE VISTAS
#------------------------------------------------------------------------------------------------



#------------------------------------------------------------------------------------------------
#  1. Une las tablas y las relaciones inexistentes muéstralas mediante valor NULL.
#------------------------------------------------------------------------------------------------

selecT * from provinciasgalicia 	as t1 
left outer join comarcasgalicia 			as t2 on t1.provincia=t2.provincia
left outer join concellosgalicia 			as t3 on t3.comarca=t2.comarca
left outer join poblaciongalicia 			as t4 on t4.concello=t3.concello
 ;
 
 (selecT * from provinciasgalicia left outer join comarcasgalicia on provinciasgalicia.provincia=comarcasgalicia.provincia
left outer join concellosgalicia on concellosgalicia.comarca=comarcasgalicia.comarca
left outer join poblaciongalicia on poblaciongalicia.concello=concellosgalicia.concello);


#------------------------------------------------------------------------------------------------
#  2. Muestra los datos del Concello con mayor superficie.
#------------------------------------------------------------------------------------------------
SELECT * FROM concellosgalicia where  superficie = (select max(superficie) from concellosgalicia);
#------------------------------------------------------------------------------------------------
#  3. Muestra para cada Concello su nombre, la Comarca a la que pertenece y la provincia a la que pertenece.
#------------------------------------------------------------------------------------------------
select distinct t3.nombre as 'Nombre Concello',t2.nombre as 'Nombre comarca',t1.nombre as 'Nombre provincia'
from (provinciasgalicia as t1 left outer join comarcasgalicia as t2 on t1.provincia=t2.provincia
left outer join concellosgalicia as t3 on t3.comarca=t2.comarca
left outer join poblaciongalicia as t4 on t4.concello=t3.concello);

## T1= Provincia   T3=Concello
## T2= Comarca     T4=Poblacion

#------------------------------------------------------------------------------------------------
#  4. Muestra el nombre del Concello (o Concellos) con menor diferencia entre mujeres y hombres.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  5. Muestra las Comarcas que tengan una 'p' o 'q'.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  6. Muestra los Concellos que tengan 'ae', 'ei' o 'mp'.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  7. Muestra la superficie de cada Comarca como suma de sus Concellos.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  8. Muestra la Comarca o Comarcas con menor número de Concellos.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  9. Muestra los Concellos que tengan un número par de mujeres pero no de hombres.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
# 10. Muestra las Comarcas de la provincia de Ourense que empiecen por vocal.
#------------------------------------------------------------------------------------------------




                                       #HEHO CON VISTAS
#------------------------------------------------------------------------------------------------
#  BASE DE DATOS DE GALICIA POR EXISTENCIA
#------------------------------------------------------------------------------------------------
# 	RESUELVE MEDIANTE CONSULTAS (Y/O SUBCONSULTAS) Y TAMBIÉN MEDIANTE VISTAS
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  1. Une las tablas y las relaciones inexistentes muéstralas mediante valor NULL.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  2. Muestra los datos del Concello con mayor superficie.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  3. Muestra para cada Concello su nombre, la Comarca a la que pertenece y la provincia a la que pertenece.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  4. Muestra el nombre del Concello (o Concellos) con menor diferencia entre mujeres y hombres.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  5. Muestra las Comarcas que tengan una 'p' o 'q'.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  6. Muestra los Concellos que tengan 'ae', 'ei' o 'mp'.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  7. Muestra la superficie de cada Comarca como suma de sus Concellos.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  8. Muestra la Comarca o Comarcas con menor número de Concellos.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#  9. Muestra los Concellos que tengan un número par de mujeres pero no de hombres.
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
# 10. Muestra las Comarcas de la provincia de Ourense que empiecen por vocal.
#------------------------------------------------------------------------------------------------




