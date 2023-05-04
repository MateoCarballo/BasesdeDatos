#*******************************************************************************************
#	CREACIÓN DE LA BASE DE DATOS ConcellosGalicia_Identificador
#*******************************************************************************************

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

#*******************************************************************************************
#	CREACIÓN DE LA TABLA ComarcasGalicia
#		Comarca		entero		
#		nombre			cadena de caracteres 30
#		Provincia	entero
#
#		Clave primaria		Provincia, Comarca
#		Clave foránea		Provincia	->	ProvinciasGalicia( Provincia )
#
#		Comprobación de valor NULO y vacío de los campos nombre
#		Comprobación de valor NULO del campo Provincia
#*******************************************************************************************

#*******************************************************************************************
#	CREACIÓN DE LA TABLA ConcellosGalicia
#		Concello		entero		
#		nombre			cadena de caracteres 30
#		superficie		número decimal
#		comarca			entero
#		Provincia		entero
#
#		Clave primaria		Provincia, Comarca, Concello
#		Clave foránea		Provincia, Comarca	->	ComarcasGalicia( Provincia, Comarca )
#
#		Comprobación de valor NULO y vacío de los campos nombre
#		Comprobación de valor NULO del campo superficie, Comarca
#*******************************************************************************************

#*******************************************************************************************
#	CREACIÓN DE LA TABLA PoblacionGalicia
#		Poblacion		entero		autoincrementable
#		Año			entero
#		Concello		entero
#		mujeres			entero
#		hombres			entero
#		Provincia		entero
#		Comarca			entero		
#
#		Clave primaria		Poblacion
#		Clave foránea		Provincia, Comarca, Concello	->	ConcellosGalicia( Provicia, Comarca, Concello )
#
#		Comprobación de valor NULO y vacío de los campos mujeres, hombres
#		Comprobación de valor NULO del campo Concello
#*******************************************************************************************

#*******************************************************************************************
#	DICCIONARIO DE DATOS
#*******************************************************************************************
