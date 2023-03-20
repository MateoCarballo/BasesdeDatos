


/*

use diamantes;
show tables;
select * from diamante;

select distinct tabla from diamante
order by tabla desc 
limit 1;

select max(tabla) from diamante;

select distinct tabla from diamante
order by tabla desc 
limit 6;

select tabla from diamantes
	group by tabla
	order by tabla desc
	limit 6;
*/

use nba;
show tables;

select * from jugadores;
select * from equipos;

#Si no hay coincidencias no muestra nada

select * from jugadores natural join equipos;

### las dos siguientes instrucciones hacen lo mismo 

select * from jugadores,equipos
	where jugadores.equipo= equipos.nombre;
    
select * from jugadores inner join equipos
ON jugadores.equipo=equipos.nombre;    
    
    
    
    