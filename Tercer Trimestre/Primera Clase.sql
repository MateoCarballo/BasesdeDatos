# Primera Clase tercer trimestre

###INSERT###

## A la hora de insertar valores en una tabla podemos ponerlos en el orden que queramos si especificamos el orden de las columnas.
## INSERT INTO NombreTabla (nombreColumna1,nombreColumna3,nombreColumna1) VALUE (valorColumna1,valorColumna3,valorColumna1);

## Si usamos el comando insert into Provincias_Copia SELECT * FROM Provincias; 
-- En este ejemplo la tabla 'Provincias_Copia' está creada. 


### DELETE ###
## Ojo con el DELETE porque sin asterisco interpreta que tiene que borrar todo.
-- Podemos usar las mismas clausulas que con el select, podemos:
-- Ordenar, limitar a un numero los borrados.
-- Borrar las uniones.alter

### UPDATE ###
-- Podemos usarlo para cambiar todos los campos de la tabla o condicionarlo con una clausula where 
-- UPDATE provinciasGalicia set nobre='A Coruña'; (Cambia todos los nombres por A Coruña)
-- UPDATE provinciasGalicia set nobre='A Coruña' where nombre ='Lugo';

