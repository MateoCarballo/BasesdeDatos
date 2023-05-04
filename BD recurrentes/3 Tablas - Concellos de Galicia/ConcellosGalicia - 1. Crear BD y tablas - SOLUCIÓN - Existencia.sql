#*******************************************************************************************
#	CREACIÓN DE LA BASE DE DATOS ConcellosGalicia_Existencia
#*******************************************************************************************
	drop database if exists ConcellosGalicia_DebilidadxExistencia;
    show collation;
	create database 		ConcellosGalicia_DebilidadxExistencia
							collate	ucs2_spanish2_ci;
	use 					ConcellosGalicia_DebilidadxExistencia;

#*******************************************************************************************
#	CREACIÓN DE LAS TABLAS DE LA BASE DE DATOS
#*******************************************************************************************
#	CREACIÓN DE LA TABLA ProvinciasGalicia
#		Provincia		entero		autoincrementable
#		nombre			cadena de caracteres 20
#
#		Clave primaria		Provincia
#
#		Comprobación de valor NULO y vacío del campo nombre
#*******************************************************************************************
  create table ProvinciasGalicia (
	Provincia		int							AUTO_INCREMENT,
    nombre 			varchar(20),
    Constraint		PK_Provincia				Primary Key( Provincia ),
    Constraint		Nombre_Provincia_NO_NULO		check( nombre IS NOT NULL ),
    Constraint		Nombre_Provincia_NO_VACÍO		check( nombre != '' ),
    Constraint		Nombre_Provincia_ERRÓNEO		check( nombre IN ("A Coruña", "Lugo", "Ourense", "Pontevedra") )
);

#*******************************************************************************************
#	CREACIÓN DE LA TABLA ComarcasGalicia
#		Comarca		entero		autoincrementable
#		nombre			cadena de caracteres 30
#		Provincia	entero
#
#		Clave primaria		Comarca
#		Clave foránea		Provincia	->	ProvinciasGalicia( Provincia )
#
#		Comprobación de valor NULO y vacío de los campos nombre
#		Comprobación de valor NULO del campo Provincia
#*******************************************************************************************
  create table ComarcasGalicia (
	Comarca		int							AUTO_INCREMENT,
    nombre			varchar( 30 ),
    Provincia		int,
    Constraint		PK_Comarca					Primary Key( Comarca ),
    Constraint		FK_Comarca_Provincia		Foreign Key( Provincia )	REFERENCES	ProvinciasGalicia( Provincia )
					#ON DELETE CASCADE
                    ON UPDATE CASCADE,
    Constraint		Nombre_Comarca_NO_NULO			check( nombre 		IS NOT NULL ),
    #Constraint		Provincia_Comarca_NO_NULO		check( Provincia	IS NOT NULL ),
    Constraint		Nombre_Comarca_NO_VACÍO			check( nombre 		!= '' )
    #Constraint		Provincia_Comarca_NO_VACÍO		check( Provincia  	!= '' )
);

#*******************************************************************************************
#	CREACIÓN DE LA TABLA ConcellosGalicia
#		Concello		entero		autoincrementable
#		nombre			cadena de caracteres 30
#		superficie		número decimal
#		comarca			entero
#
#		Clave primaria		Concello
#		Clave foránea		Comarca	->	ComarcasGalicia( Comarca )
#
#		Comprobación de valor NULO y vacío de los campos nombre
#		Comprobación de valor NULO del campo superficie, Comarca
#*******************************************************************************************
  create table ConcellosGalicia (
	Concello		int							AUTO_INCREMENT,
    nombre			varchar( 30 ),
    superficie		float,
    Comarca		int,
    Constraint		PK_Concello					Primary Key( Concello ),
    Constraint		FK_Concello_Comarca			Foreign Key( Comarca )	REFERENCES	ComarcasGalicia( Comarca )
					#ON DELETE CASCADE
                    ON UPDATE CASCADE,
    Constraint		Nombre_Concello_NO_NULO			check( nombre 		IS NOT NULL ),
    Constraint		Superficie_Concello_NO_NULO		check( superficie 	IS NOT NULL ),
   # Constraint		Comarca_Concello_NO_NULO		check( Comarca 	IS NOT NULL ),
    Constraint		Nombre_Concello_NO_VACÍO		check( nombre 		!= '' ),
    Constraint		Superficie_Concello_NO_VACÍO	check( superficie 	!= '' )
    #Constraint		Comarca_Concello_NO_VACÍO		check( Comarca 		!= '' )
);

#*******************************************************************************************
#	CREACIÓN DE LA TABLA PoblacionGalicia
#		Poblacion		entero		autoincrementable
#		Año			entero
#		Concello		entero
#		mujeres			entero
#		hombres			entero
#
#		Clave primaria		Poblacion
#		Clave foránea		Concello	->	ConcellosGalicia( Concello )
#
#		Comprobación de valor NULO y vacío de los campos mujeres, hombres
#		Comprobación de valor NULO del campo Concello
#*******************************************************************************************
  create table PoblacionGalicia (
	Poblacion		int							AUTO_INCREMENT,
    año				int,
    Concello		int,
    mujeres			int,
    hombres			int,
    Constraint		PK_Poblacion				Primary Key( Poblacion ),
    Constraint		FK_Poblacion_Concello		Foreign Key( Concello )	REFERENCES	ConcellosGalicia( Concello ),
    Constraint		Concello_NO_NULO				check( Concello	IS NOT NULL ),
    Constraint		mujeres_NO_NULO					check( mujeres		IS NOT NULL ),
    Constraint		hombres_NO_NULO					check( hombres		IS NOT NULL ),
    Constraint		Concello_NO_VACÍO				check( Concello		!= '' ),
    Constraint		mujeres_NO_VACÍO				check( mujeres		!= '' ),
    Constraint		hombres_NO_VACÍO				check( hombres		!= '' ),
    Constraint		mujeres_NÚMERO_ERRÓNEO			check( mujeres		> 0 ),
    Constraint		hombres_NÚMERO_ERRÓNEO			check( hombres		> 0 )
);

#*******************************************************************************************
#	DICCIONARIO DE DATOS
#*******************************************************************************************
# dígito 			  = [ 0 | 1 | 2 | 3 | 4 | 5 | 6  | 7 | 8 |9 ]													*dígitos del sistema numérico*
# vocalMinúscula 	  = [ a | á | e | é | i | í | o | ó | u | ú | ü ]												*vocales minúsculas, sin y con tilde, y con diéresis*
# vocalMayúscula	  = [ A | Á | E | É | I | Í | O | Ó | U | Ú | Ü ]												*vocales mayúsculas, sin y con tilde, y con diéresis*
# consonanteMinúscula = [ b | c | d | f | g | h | j | k | l | m | n | ñ | p | q | r | s | t | v | w | x | y | z ]	*consonantes minúsculas*
# consonanteMinúscula = [ B | C | D | F | G | H | J | K | L | M | N | Ñ | P | Q | R | S | T | V | W | X | Y | Z ]	*consonantes mayúsculas*
# espacio			  = ' '																							*separación entre palabras*
# letraMinúscula = [ vocalMinúscula | consonanteMinúscula ]															*letras minúsculas como unión entre vocales y consonantes en minúscula*
# letraMayúscula = [ vocalMayúscula | consonanteMayúscula ]															*letras mayúsculas como unión entre vocales y consonantes en mayúscula*
# letra 	 = [ letraMinúscula | letraMayúscula | espacio ]																*alfabeto completo en minúscula y en mayúsculas, y con espacio de separación*
# alfanumérico 	 = [ letra | dígito ]																					*unión entre el total de letras más espacio y dígitos*
#------------------------------------------------------------------------------------------------------
#			TABLA 'ProvinciasGalicia'
#------------------------------------------------------------------------------------------------------
#	PROVINCIAGALICIA = {ProvinciaGalicia}	* Información de las provincias de Galicia				*
#	ProvinciaGalicia = @Provincia + Nombre	* Información sobre cada provincia de Galicia				*
#	Provincia   = 1{ dígito }1		* Identificador de cada provincia de Galicia, empieza por 10		*
#	Nombre 	    = 1{  letra }20		* Nombre de una provincia de Galicia					*
#------------------------------------------------------------------------------------------------------
#			TABLA 'ComarcasGalicia'
#------------------------------------------------------------------------------------------------------
#	COMARCAGALICIA 	= {ComarcaGalicia}	* Información de las comarcas de Galicia				*
#	ComarcaGalicia	= @Comarca + Nombre + Provincia *Información de cada comarca de Galicia				*
#	Comarca		= 1{ dígito }3		* Identificador de cada comarca, empieza por 100			*
#	Nombre		= 1{  letra }30		* Nombre de la Comarca							*
#	Provincia	= 1{ dígito }1		* Identificador de la provincia a la que pertenece la Comarca 		*
#------------------------------------------------------------------------------------------------------
#			TABLA 'ConcellosGalicia'
#------------------------------------------------------------------------------------------------------
#	CONCELLOGALICIA = {ConcelloGalicia}	* Información de los concellos de Galicia				*
#	ConcelloGalicia = @Concello + Nombre + Superficie + @Comarca  * Información de cada concello de Galicia		*
#	Concello 	= 1{ dígito }3		* Identificador de cada concello, empieza por 1000			*
#	Nombre		= 1{  letra }30		* Nombre de la Concello							*
#	superficie	= 1{ dígito }5.0{ dígito }2  *km2 del concello							*
#	Comarca		= 1{ dígito }3		* Identificador de la comarca a la que pertenece el concello 		*
#------------------------------------------------------------------------------------------------------
#			TABLA 'PoblaciónGalicia'
#------------------------------------------------------------------------------------------------------
#	POBLACIÓNGALICIA = {PoblaciónGalicia}	* Información de los habitantes de cada concello de Galicia		*
#	PoblaciónGalicia = @Poblacion + Año + Concello + Mujeres + Hombres 	* Habitantes cada concello de Galicia	*
#	Poblacion 	= 1{ dígito }3		* Identificador de cada concello, empieza por 1000			*
#	Año		= 4{ digito }4		* Año del que se guardan los datos
#	Concello 	= 1{ dígito }3		* Identificador del concello del que se guardan los datos		*
#	Mujeres		= 1{ digito }7		* Número de mujeres empadronadas en el concello				*
#	Hombres		= 1{ digito }7		* Número de hombres empadronados en el concello				*
#*******************************************************************************************