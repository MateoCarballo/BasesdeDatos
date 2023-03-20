#--------------------------------------------------------------------------------------------
#	CREACIÓN Y USO DE LA BASE DE DATOS 'Titanic'
#--------------------------------------------------------------------------------------------
	DROP DATABASE IF EXISTS Titanic;
	CREATE DATABASE 		Titanic;
	USE 					Titanic;
#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'pasajerosTitanic'
#--------------------------------------------------------------------------------------------
#		idPasajero			entero, no nulo
#		Sobrevivió			entero, no nulo
#		Clase				entero, no nula
#		Nombre				cadena de texto, no nula
#		Sexo				cadena de texto 10 , no nula
#		Edad				cadena de texto 4, no nula
#		Familiares			entero, no nulo					Siblings / spouses (hermanos o cónyuges)
#		PadresHijos			entero, no nulo					Parents / children (padres o hijo)
#		Ticket				cadena de texto, no nula
#		Tarifa				entero doble, no nulo
#		Cabina				cadena de texto 20, no nula
#		Embarque			cadena de texto 20, no nula
#
#		Clave primaria		Nombre
#--------------------------------------------------------------------------------------------
	CREATE TABLE pasajerosTitanic (
		idPasajero	 	int 			NOT NULL	PRIMARY KEY,
		Sobrevivió		int 			NOT NULL,
		Clase			char 			NOT NULL,
		Nombre			varchar( 100 ) 	NOT NULL,
		Sexo			varchar( 10 )  	NOT NULL,
		#Edad			varchar( 4 ) 	NOT NULL,
		Edad			INT 		NOT NULL,
		Familiares		int 			NOT NULL,			
		PadresHijos		int 			NOT NULL,			
		Ticket			varchar( 50 ) 	NOT NULL,
		Tarifa			varchar( 8 ) 	NOT NULL,
		Cabina			varchar( 20 ) 	NOT NULL,
		Embarque		varchar( 20 ) 	NOT NULL
	);

#--------------------------------------------------------------------------------------------
#	ASEGURA LOS SIGUIENTES VALORES EN LOS SIGUIENTES CAMPOS:
#		Sobrevivió					sólo pueda ser 		0, 1
#		Clase						sólo pueda ser		1, 2, 3
#		Sexo						sólo pueda ser		fame, female
#		Familiares y PadresHijos	NO puedan ser negativos
#		Embarque 					sólo pueda ser S, C, Q
#
#	PUEDES TAMBIÉN AÑADIR LA COMPROBACIÓN DE QUE NINGUNO DE LOS ATRIBUTOS ANTERIORES SEA NULO ('NULL')
#	NO TE OLVIDES DE CAMBIAR LOS CARACTERES DE LA TABLA AL ESPAÑOL
#--------------------------------------------------------------------------------------------
	ALTER TABLE pasajerosTitanic
			ADD	CONSTRAINT	SOBREVIVIÓ_VALOR_NULO			CHECK( Sobrevivió IS NOT NULL ),
            ADD	CONSTRAINT	SOBREVIVIÓ_VALOR_ERRÓNEO		CHECK( Sobrevivió IN ( 0, 1 ) ),
            ADD CONSTRAINT	CLASE_VALOR_NULO				CHECK( Clase IS NOT NULL ),
            ADD CONSTRAINT	CLASE_VALOR_ERRÓNEO				CHECK( Clase IN ( 1, 2, 3 ) ),
            ADD CONSTRAINT	SEXO_VALOR_NULO					CHECK( Sexo	IN ( "male", "female" ) ),
            ADD CONSTRAINT	FAMILIARES_VALOR_NULO			CHECK( Familiares IS NOT NULL ),
            ADD CONSTRAINT	FAMILIARES_VALOR_NEGATIVO		CHECK( Familiares >= 0 ),
            ADD CONSTRAINT	PADRESHIJOS_VALOR_NULO			CHECK( PadresHijos IS NOT NULL ),
            ADD CONSTRAINT	PADREShIJOS_VALOR_NEGATIVO		CHECK( PadresHijos >= 0 ),
            ADD CONSTRAINT	EMBARQUE_VALOR_NULO				CHECK( Embarque IS NOT NULL ),
            ADD CONSTRAINT	EMBARQUE_VALOR_ERRÓNEO			CHECK( Embarque IN ( 'S', 'C', 'Q' ) );
            
#	Cambiamos los caracteres de la base de datos Titanic al Español
	show collation where charset = "utf32"; 
    ALTER DATABASE	Titanic			CHARACTER SET 	utf32
									COLLATE			utf32_spanish2_ci;

