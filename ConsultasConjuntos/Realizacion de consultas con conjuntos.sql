
/*
Dentro de la tabla diamante selecciona todas las tuplas que cumplen la condicion de ser Premium o Ideal
Muestra los Diamantes cuyo tallado sea Ideal o Premium.
*/
USE DIAMANTES;
SELECT * from diamante where (tallado="Premium"or tallado="Ideal");

/*
Muestra los diamantes cuyo color sea E, F, o I.
*/
use diamantes;
select* from diamante;
select *from diamante where (color="E" or color="F"or color="I");

/*
Muestra los diamantes cuya claridad sea IF o VS2.
*/
use diamantes;
select* from diamante;
select *from diamante where (claridad="IF" or claridad="VS2");

/*
Muestra los diamantes de las tablas 55, 65, 75, 85, o 95.
*/
use diamantes;
select * from diamante;
select * from diamante where (DiamanteID=55 or DiamanteID=56 or DiamanteID=75 or DiamanteID=85 or DiamanteID=95);
