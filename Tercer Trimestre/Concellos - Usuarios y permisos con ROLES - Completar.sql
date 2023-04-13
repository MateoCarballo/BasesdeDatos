#*******************************************************************************************
#	UTILIZACIÓN DE LA BASE DE DATOS 'ConcellosGalicia'
#*******************************************************************************************

#*******************************************************************************************
#	1. 	BORRAMOS Y CREAMOS LOS ROLES: RolDirector, RolDelegadoCoruna, RolDelegadoLugo, RolDelegadoOurense, RolDelegadoPontevedra
#-------------------------------------------------------------------------------------------
#	CREATE ROLE RoleDirector;
#*******************************************************************************************

#*******************************************************************************************
#	CONFIGURAR LAS VISTAS DE CADA USUARIO -> VistaDirector, VDC, VDL, VLO, VLP
#	En cada vista crear _Comarca, _Concello, _Poblacion
#*******************************************************************************************

#*******************************************************************************************
#	ASIGNAMOS PRIVILEGIOS A LOS ROLES
#		RolDirector 			-> Permiso total en todas las vustas creadas
#		RolDelegadoCoruna		-> Permiso total SÓLO en las vistas de Coruña
#		RolDelegadoLugo			-> Permiso total SÓLO en las vistas de Lugo
#		RolDelegadoOurense		-> Permiso total SÓLO en las vistas de Ourense
#		RolDelegadoPontevedra	-> Permiso total SÓLO en las vistas de Pontevedra
#*******************************************************************************************

#*******************************************************************************************
#	CREAMOS 5 USUARIOS: 	Director, DelegadoCoruña, DelegadoLugo, DelegadoOurense, DelegadoPontevedra
#*******************************************************************************************

#*******************************************************************************************
#	ACTUALIZAMOS LOS PRIVILEGIOS OTORGADOS
#*******************************************************************************************

