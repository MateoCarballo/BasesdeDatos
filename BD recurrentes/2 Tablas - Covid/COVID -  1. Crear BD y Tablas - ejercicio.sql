#-------------------------------------------------------------------------------------
# CREACIÓN DE LA BASE DE DATOS
#-------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------
# CREACIÓN DE LA TABLA "Covid"
#		prov_ISO			cadena de caracteres 2					# CÓDIGO ISO DE LA PROVINCIA
#		fecha				datos de tipo fecha						# FECHA DE LOS DATOS
#		casos				entero									# CASOS NOTIFICADOS CON PRUEBA DIANÓSTICA POSITIVA
#		prob_PCR			entero									# PRUEBA DE LABORATORIO PCR O TÉCNICAS MOLECULARES
#		prob_AnCps			entero									# PRUEBA DE LABORATORIO DE TEST RÁPIDO DE ANTICUERPOS
#		prob_Ant			entero									# PRUEBA DE LABORATORIO DE TEST DE DETECCIÓN DE ANTÍGENO
#		prob_El				entero									# PRUEBA DE LABORATORIO DE SEROLOGÍA DE ALTA RESOLUCIÓN
#		prob_desc			entero									# PRUEBAS DE LABOTARIO SIN CONFIRMAR
#		
#		clave primaria		Prov_ISO, fecha
#-------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------
# CREACIÓN DE LA TABLA "Población"
#		ProvinciaISO		cadena de caracteres  2
#		Nombre				cadena de caracteres 25
#		Sexo				cadena de caracteres 10
#		Periodo				entero
#		Total				cadena de caracteres  9
#
#		clave primaria		Prov_ISO, Sexo, Periodo
#-------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------
#	MODIFICACIÓN DE LA TABLA Covid
#		Nuevo nombre de la tabla	->	DatosCovid
#					prov_ISO		->	provinciaISO
#					prob_PCR		->	pruebaPCR
#					prob_AnCps		->	pruebaAnticuerpos
#					prob_Ant		->	pruebaAntígenos
#					prob_El			->	pruebaElisa
#					prob_desc		->	pruebaDesconocida
#-------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------
#	CREACIÓN DE LA CLAVE FORÁNEA ENTRE LAS TABLAS DatosCovid y Población por el campo común
#-------------------------------------------------------------------------------------
