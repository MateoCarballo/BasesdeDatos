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
         (select * from talladoideal)
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

select * from tallado2

   
#------------------------------------------------------
#	2. Clasificamos los diamantes por tipo de COLOR
#------------------------------------------------------

#------------------------------------------------------
#	3. Clasificamos los diamantes por QUILATES
#------------------------------------------------------

#------------------------------------------------------
#	4. Clasificamos los diamantes por DINERO
#------------------------------------------------------