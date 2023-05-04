#*******************************************************************************************
#	CREACIÓN DE LA BASE DE DATOS ConcellosGalicia_Identificador
#*******************************************************************************************
	drop database if exists	ConcellosGalicia_DebilidadXIdentificador;
	create database 		ConcellosGalicia_DebilidadXIdentificador
								character set	utf32
								collate			utf32_spanish2_ci;
	use 					ConcellosGalicia_DebilidadXIdentificador;

#*******************************************************************************************
#	CREACIÓN DE LAS TABLAS DE LA BASE DE DATOS
#*******************************************************************************************
#	CREACIÓN DE LA TABLA ProvinciasGalicia
#		Provincia		entero		
#		nombre			cadena de caracteres 20
#
#		Clave primaria		Provincia
#
#		Comprobación de valor NULO y vacío del campo nombre
#*******************************************************************************************
	create table ProvinciasGalicia(
		Provincia			int,
		Nombre				varchar( 20 ),
		PRIMARY KEY( Provincia )
);

#*******************************************************************************************
#	CREACIÓN DE LA TABLA ComarcasGalicia
#		Comarca		entero		
#		nombre		cadena de caracteres 30
#		Provincia	entero
#
#		Clave primaria		Comarca
#		Clave foránea		Provincia	->	ProvinciasGalicia( Provincia )
#
#		Comprobación de valor NULO y vacío de los campos nombre
#		Comprobación de valor NULO del campo Provincia
#*******************************************************************************************
create table ComarcasGalicia(
	Comarca				int,
    Nombre				varchar( 30 ),
    Provincia			int,
    PRIMARY KEY( Provincia, Comarca    ),
    FOREIGN KEY( Provincia ) REFERENCES ProvinciasGalicia( Provincia )
			#ON DELETE	CASCADE
            #ON UPDATE	CASCADE
);

#*******************************************************************************************
#	CREACIÓN DE LA TABLA ConcellosGalicia
#		Concello		entero		
#		nombre			cadena de caracteres 30
#		superficie		número decimal
#		comarca			entero
#
#		Clave primaria		Provincia, Comarca, Concello
#		Clave foránea		Provincia, Comarca	->	ComarcasGalicia( Provincia, Comarca )
#
#		Comprobación de valor NULO y vacío de los campos nombre
#		Comprobación de valor NULO del campo superficie, Comarca
#*******************************************************************************************
create table ConcellosGalicia(
	Concello			int,
    Nombre				varchar( 30 ),
    Superficie			double,		# decimal( 8, 2 ),
    Provincia			int,
    Comarca				int,
    PRIMARY KEY( Provincia, Comarca, Concello ),
    FOREIGN KEY( Provincia, Comarca  ) REFERENCES ComarcasGalicia( Provincia, Comarca )
			#ON DELETE	CASCADE
            #ON UPDATE	CASCADE
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
	create table PoblacionGalicia(
		Población			int					AUTO_INCREMENT,
		Año					int,
		Mujeres				int8,
		Hombres				int8,
		Provincia			int,
		Comarca				int,
		Concello			int,
		PRIMARY KEY( Población ),
		FOREIGN KEY( Provincia, Comarca, Concello  ) REFERENCES ConcellosGalicia( Provincia, Comarca, Concello )
			#ON DELETE	CASCADE
            #ON UPDATE	CASCADE
);

#--------------------------------------------------------------------------------------------
#	DICCIONARIO DE DATOS
#--------------------------------------------------------------------------------------------
