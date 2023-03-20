#--------------------------------------------------------------------------------------------
#	CREACIÓN Y USO DE LA BASE DE DATOS 'NBA'
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'Equipos'
#--------------------------------------------------------------------------------------------
#		Nombre				cadena de texto	20, no nula
#		Ciudad				cadena de texto 20, por defecto nula
#		Conferencia			cadena de texto 4, por defecto nula
#		Division			cadena de texto 9, por defecto nula
#
#		Clave primaria		Nombre
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'Jugadores'
#--------------------------------------------------------------------------------------------
#		Codigo				entero, no nulo
#		Nombre				cadena de texto	30, por defecto nula
#		Procedencia			cadena de texto 20, por defecto nula
#		Altura				cadena de texto 4, por defecto nula
#		Peso				entero, por defecto nulo
#		Posicion			cadena de texto 5, por defecto nula
#		Equipo				cadena de texto 20, por defecto nula
#
#		Clave primaria		Codigo
#		Clave foránea		Equipo				a la tabla 'Equipos'
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'Estadísticas'
#--------------------------------------------------------------------------------------------
#		temporada			cadena de texto	5, no nula
#		jugador				entero, por defecto no nulo
#		PuntosXPartido		número float, por defecto nulo
#		AsistenciaXPartido	número float, por defecto nulo
#		TaponesXPartido		número float, por defecto nulo
#		ReboterXPartido		número float, por defecto nulo
#
#		Clave primaria		temporada, jugador
#		Clave foránea		jugador				a la tabla 'Jugadores'
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'Partidos'
#--------------------------------------------------------------------------------------------
#		Codigo				entero, no nulo
#		equipoLocal			cadena de texto	20, por defecto nula
#		equipoVisitante		cadena de texto 20, por defecto nula
#		puntosLocal			entero, por defecto nulo
#		puntosVisitante		entero, por defecto nulo
#		temporada			cadena de texto 5, por defecto nula
#
#		Clave primaria		Codigo
#		Clave foranea		equipoLocal			a la tabla 'Equipos'
#							equipoVisitante		a la tabla 'Equipos'
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
#	DICCIONARIO DE DATOS
#--------------------------------------------------------------------------------------------
