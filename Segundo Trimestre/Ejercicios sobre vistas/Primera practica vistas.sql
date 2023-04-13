#------------------------------------------------------
#	BASE DE DATOS DIAMANTES
#------------------------------------------------------
use diamantes;

#------------------------------------------------------
#	MOSTRAMOS TODAS LAS TABLAS
#------------------------------------------------------
describe diamante;
#------------------------------------------------------
#	MOSTRAMOS TODOS LOS DATOS ALMADENADOS
#------------------------------------------------------
select * from diamante;
#------------------------------------------------------
#	1. Clasificamos los diamantes por tipo de TALLADO
#------------------------------------------------------
select * from diamante;

select tallado as 'Tipo',count(*) as 'Cantidad'
from diamante
group by tallado
order by tallado;
        
Create view TalladoFair as 
select diamanteID, quilates, color, claridad, profundidad, tabla, precio, x, y, z
	from diamante	
		where tallado = 'Fair' ;  
        
Create view TalladoGood as 
select diamanteID, quilates, color, claridad, profundidad, tabla, precio, x, y, z
	from diamante	
		where tallado = 'Good' ; 
        
Create view TalladoIdeal as 
select diamanteID, quilates, color, claridad, profundidad, tabla, precio, x, y, z
	from diamante	
		where tallado = 'Ideal' ; 
        
Create view TalladoPremium as 
select diamanteID, quilates, color, claridad, profundidad, tabla, precio, x, y, z
	from diamante	
		where tallado = 'Premium' ; 
        

create view TalladoVeryGood as          
select diamanteID, quilates, color, claridad, profundidad, tabla, precio, x, y, z
	from diamante	
		where tallado = 'VeryGood' ;
    -- el natural join no muestra nada porque se llaman igual las columnas 
    
 select * from talladoGood as g inner join talladopremium as p where g.precio=p.precio ;
 
select * from talladoGood as g left outer join talladopremium as p on g.precio=p.precio ;

select * from talladoGood as g right outer join talladopremium as p on g.precio=p.precio;

select  (select  * from talladofair), 
		 (select * from talladogood),
         (select * from talladoideal),
         (select * from talladopremium),
         (select * from talladoverygood);
         
select * from talladofair;
select * from talladogood;
select * from talladoideal;
select * from talladopremium;
select * from talladoverygood;  

select * from talladofair
union
select * from talladogood
union
select * from talladoideal
union
select * from talladopremium
union
select * from talladoverygood order by diamanteID; 

create table tallado2 	select *,'Fair' as Tallado from talladofair 		union
						select *,'Good' as Tallado from talladogood 		union
						select *,'Ideal' as Tallado from talladoideal 		union
						select *,'Premium' as Tallado from talladopremium 	union
						select *,'VeryGood' as Tallado from talladoverygood; 

use diamantes;

-- COMO MOSTRAR LA INFORMACION AGRUPADA POR QUILATES Y EN COLUMNAS
-- CREAMOS UNA VISTA Y REALIZAMOS UNA CONSULTA SOBRE LA VISTA
-- Ver ejercicio 8 examen segunda evaluacion año pasado


CREATE VIEW QUILATES0 AS SELECT DiamanteID,quilates,tallado,color,claridad,profundidad,tabla,precio,x,y,z
from diamante
where quilates>=0 and quilates <=1;

CREATE VIEW QUILATES1 AS SELECT DiamanteID,quilates,tallado,color,claridad,profundidad,tabla,precio,x,y,z
from diamante
where quilates>=1 and quilates <=2;

CREATE VIEW QUILATES2 AS SELECT DiamanteID,quilates,tallado,color,claridad,profundidad,tabla,precio,x,y,z
from diamante
where quilates>=2 and quilates <=3;

CREATE VIEW QUILATES3 AS SELECT DiamanteID,quilates,tallado,color,claridad,profundidad,tabla,precio,x,y,z
from diamante
where quilates>=3 and quilates <=4;

CREATE VIEW QUILATES4 AS SELECT DiamanteID,quilates,tallado,color,claridad,profundidad,tabla,precio,x,y,z
from diamante
where quilates>=4 and quilates <=5;

CREATE VIEW QUILATES5 AS SELECT DiamanteID,quilates,tallado,color,claridad,profundidad,tabla,precio,x,y,z
from diamante
where quilates>=5 and quilates <=6;

-- OPCION 1
create view NúmeroDiamantesQuilates0 as (select count(*) from quilates0);
create view NúmeroDiamantesQuilates1 as (select count(*) from quilates1);
create view NúmeroDiamantesQuilates2 as (select count(*) from quilates2);
create view NúmeroDiamantesQuilates3 as (select count(*) from quilates3);
create view NúmeroDiamantesQuilates4 as (select count(*) from quilates4);
create view NúmeroDiamantesQuilates5 as (select count(*) from quilates5);


select  (SELECT * FROM NúmeroDiamantesQuilates0) as "0 Quilates",
		(SELECT * FROM NúmeroDiamantesQuilates1) as "1 Quilates",
		(SELECT * FROM NúmeroDiamantesQuilates2) as "2 Quilates",
		(SELECT * FROM NúmeroDiamantesQuilates3) as "3 Quilates",
		(SELECT * FROM NúmeroDiamantesQuilates4) as "4 Quilates",
		(SELECT * FROM NúmeroDiamantesQuilates5) as "5 Quilates";
        
 -- Pruebas a mayores
         
 
-- OPCION 2

select  (select count(*) from quilates0) as "0 Quilates",
		(select count(*) from quilates1) as "1 Quilates",
		(select count(*) from quilates2) as "2 Quilates",
		(select count(*) from quilates3) as "3 Quilates",
		(select count(*) from quilates4) as "4 Quilates",
        (select count(*) from quilates5) as "5 Quilates";
        
        
        
#------------------------------------------------------
#	2. Clasificamos los diamantes por tipo de COLOR
#------------------------------------------------------

#------------------------------------------------------
#	3. Clasificamos los diamantes por QUILATES
#------------------------------------------------------
-- truncate es necesario para esto

#------------------------------------------------------
#	4. Clasificamos los diamantes por DINERO
#------------------------------------------------------
--  anular "ONLY_FULL_GROUP_BY"

SET SQL_MODE = "STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION";

select precio as 'Unidades de precio', count(*) AS 'Cantidad'
		from diamante
			GROUP BY length(precio); -- NUMERO DE DIGITOS
            
SELECT precio AS 'Unidades de precio', count(*) as 'Cantidad'
				FROM Diamante 
                GROUP BY length(convert(precio,CHAR)); -- Numero de digitos
                
                            
SELECT length(convert(precio,CHAR)) AS 'Unidades de precio', count(*) as 'Cantidad'
				FROM Diamante 
                GROUP BY length(convert(precio,CHAR)); -- Numero de digitos
                
SELECT pow(10,(length(convert(precio,CHAR)))) AS 'Unidades de precio', count(*) as 'Cantidad'
				FROM Diamante 
                GROUP BY length(convert(precio,CHAR)); -- Numero de digitos      
                
SELECT pow(10,(length(convert(precio,CHAR)))-1) AS 'Unidades de precio', count(*) as 'Cantidad'
				FROM Diamante 
                GROUP BY length(convert(precio,CHAR)); -- Numero de digitos   

SELECT pow(10,(length(convert(precio,CHAR))))-1 AS 'Unidades de precio', count(*) as 'Cantidad'
				FROM Diamante 
                GROUP BY length(convert(precio,CHAR)); -- Numero de digitos               

-- Saca el numero de elementos que hay entre el rango de la derecha
-- Todo lo de arriba son las partes para conseguir este resultado

SELECT concat(pow(10,(length(convert(precio,CHAR)))-1),'-',pow(10,(length(convert(precio,CHAR))))-1,' $') AS 'Precio', count(*) as 'Cantidad'
				FROM Diamante 
                GROUP BY length(convert(precio,CHAR)); -- Numero de digitos      
                
                
                
-- Creamos lo anterior en una vista

create view DiamantesPorPrecio as SELECT concat(pow(10,(length(convert(precio,CHAR)))-1),'-',pow(10,(length(convert(precio,CHAR))))-1,' $') AS 'Precio', count(*) as 'Cantidad'
				FROM Diamante 
                GROUP BY length(convert(precio,CHAR));     
                
Select * from DiamantesPorPrecio;                