#--------------------------------------------------------------------------------------------
#	CREACIÓN Y USO DE LA BASE DE DATOS 'Titanic'
#--------------------------------------------------------------------------------------------
	DROP DATABASE IF EXISTS Titanic;
	CREATE DATABASE 		Titanic;
	USE 					Titanic;
#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'Passengers'
#--------------------------------------------------------------------------------------------
#		PassengerID			entero, no nulo
#		Survived			entero, no nulo
#		Pclass				entero, no nula
#		Name				cadena de texto, no nula
#		Sex					cadena de texto 10, no nula
#		Age					cadena de texto 4, no nula
#		SibSp				entero, no nulo					Sibilings / spouses (hermanos o cónyuges)
#		Parch				entero, no nulo
#		Ticket				cadena de texto, no nula
#		Fare				número decimal, no nulo
#		Cabin				cadena de texto 20, no nula
#		Embarked			cadena de texto 1, no nula
#
#		Clave primaria		PassengerID
#--------------------------------------------------------------------------------------------
	CREATE TABLE Passengers (
		PassengerId 	int 			NOT NULL	PRIMARY KEY,
		Survived		int 			NOT NULL,
		Pclass			int 			NOT NULL,
		Name			text 			NOT NULL,
		Sex				varchar( 10 )	NOT NULL,
		Age				varchar( 4 ) 	NOT NULL,
		SibSp			int 			NOT NULL,			# Siblings / spouses (hermanos o cónyuges)
		Parch			int 			NOT NULL,			# Parents / children (padres o hijos)
		Ticket			text			NOT NULL,
		Fare			double 			NOT NULL,		# tarifa
		Cabin			varchar( 20 )	NOT NULL,
		Embarked		char			NOT NULL
	);

#--------------------------------------------------------------------------------------------
#	CONVERSIÓN DE LA TABLA Passengers al formato de la tabla pasajerosTitanic
#	recuerda cambiar también el tipo de los caracteres a Español.
#--------------------------------------------------------------------------------------------

#	Cambiamos los caracteres de la base de datos Titanic al Español
	show collation where charset = "utf32"; 
    ALTER DATABASE	Titanic			CHARACTER SET 	utf32
									COLLATE			utf32_spanish2_ci;

#	Cambiamos de nombre la tabla Passengers a PasajerosTitanic    
    #RENAME TABLE Passengers	TO	pasajerosTitanic;
     ALTER TABLE Passengers	RENAME pasajerosTitanic;
    
#	Cambiamos el nombre de los campos al Español
    ALTER TABLE PasajerosTitanic	RENAME COLUMN	PassengerID	TO	idPasajero,
									RENAME COLUMN	Survived	TO	Sobrevivió,
                                    RENAME COLUMN	Pclass		TO	Clase,
                                    RENAME COLUMN	Name		TO	Nombre,
                                    RENAME COLUMN	Sex			TO	Sexo,
                                    RENAME COLUMN	Age			TO	Edad,
                                    RENAME COLUMN	SibSp		TO	Familiares,
                                    RENAME COLUMN	Parch		TO	PadresHijos,
                                    #RENAME COLUMN	Ticket		TO	Ticket,				# NO necesario
                                    RENAME COLUMN 	Fare		TO	Tarifa,
                                    RENAME COLUMN 	Cabin		TO	Cabina,
                                    RENAME COLUMN	Embarked	TO	Embarque;
    
#	Cambiamos el tipo de los campos donde sea necesario
    ALTER TABLE PasajerosTitanic	#MODIFY idPasajero	int 			NOT NULL,		# NO necesario
									#MODIFY Sobrevivió	int 			NOT NULL,		# NO necesario
                                    MODIFY Clase		char 			NOT NULL,
                                    MODIFY Nombre		varchar( 100 ) 	NOT NULL,
                                    #MODIFY Sexo			varchar( 10 )  	NOT NULL,		# NO necesario
                                    MODIFY Edad			int 	NOT NULL,		# NO necesario  		---- AÑADIDO POSTERIORMENTE
                                    #MODIFY Familiares	int 			NOT NULL,		# NO necesario
                                    #MODIFY PadresHijos	int 			NOT NULL,		# NO necesario
                                    MODIFY Ticket		varchar( 50 ) 	NOT NULL,
                                    #MODIFY Tarifa		double 			NOT NULL,		# NO necesario
                                    #MODIFY Cabina		varchar( 20 ) 	NOT NULL,		# NO necesario
                                    MODIFY Embarque		varchar( 20 ) 	NOT NULL;
	
#--------------------------------------------------------------------------------------------
# Muestra cómo ha quedado la configuración de la Base de Datos Titanic, finalmente
# ¿Has modificado la configuración de la base de datos a los caracteres españoles?
#--------------------------------------------------------------------------------------------
    SHOW CREATE DATABASE Titanic;
#--------------------------------------------------------------------------------------------
# Muestra cómo ha quedado la configuración de la tabla PasajerosTitanic, finalmente
#--------------------------------------------------------------------------------------------
    SHOW CREATE TABLE PasajerosTitanic;
#--------------------------------------------------------------------------------------------
# ¿Cómo harías para comprobar la configuración final de los campos de la tabla PasajerosTitanic?
#--------------------------------------------------------------------------------------------
    DESCRIBE PasajerosTitanic;
#--------------------------------------------------------------------------------------------
#	ASEGURA LOS SIGUIENTES VALORES EN LOS SIGUIENTES CAMPOS:
#		Sobrevivió					sólo pueda ser 		0, 1
#		Clase						sólo pueda ser		1, 2, 3
#		Sexo						sólo pueda ser		fame, female
#		Familiares y PadresHijos	NO puedan ser negativos
#		Embarque 					sólo pueda ser S, C, Q
#
#	PUEDES TAMBIÉN AÑADIR LA COMPROBACIÓN DE QUE NINGUNO DE LOS ATRIBUTOS ANTERIORES SEA NULO ('NULL')
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