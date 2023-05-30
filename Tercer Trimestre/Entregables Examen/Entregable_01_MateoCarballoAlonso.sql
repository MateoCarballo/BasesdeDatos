#*******************************************************************************************
#	CREACIÓN Y USO DE LA BASE DE DATOS 'CiclosInformatica'
#*******************************************************************************************
DROP DATABASE IF EXISTS CiclosInformatica;
CREATE DATABASE CiclosInformatica;
USE CiclosInformatica;
#*******************************************************************************************
#	CREACIÓN DE LAS TABLAS DE LA BASE DE DATOS
#*******************************************************************************************
#		TABLA Modulo
#*******************************************************************************************
#		idModulo		int				auto_increment desde 50
#		sigla			varchar(5)
#		codigo			varchar(6)
#		nombre			text
#		horas			int
#		curso			int
#		ciclo			text
#	 
#		Llave primaria 			->	idModulo
#		Valor único    			->	codigo
#		Comprobación de Valor no nulo	->	sigla, codigo, nombre, horas
#		Comprobación de Valor no vacío	->	sigla, codigo, nombre
#		Comprobación de Valor positivo	->	horas
#		Índice				->	codigo
#*******************************************************************************************

-- CREACION DE LA TABLA
DROP TABLE IF EXISTS  Modulo;
CREATE TABLE Modulo (
    idModulo INT AUTO_INCREMENT PRIMARY KEY,
    sigla VARCHAR(5) UNIQUE,
    codigo VARCHAR(6) UNIQUE,
    nombre TEXT,
    horas INT,
    curso INT,
    ciclo TEXT
) AUTO_INCREMENT=50;

-- CREAMOS LAS COMPROBACIONS ASEGURANDONOS DE QUE NO EXISTAN ANTES DE CREARLAS
ALTER TABLE Modulo
			-- RESTRICCION DE NO SE NULO
			ADD CONSTRAINT Check_Sigla_Not_Null 	CHECK(sigla  IS NOT NULL),
            ADD CONSTRAINT Check_Codigo_Not_Null 	CHECK(codigo IS NOT NULL),
            ADD CONSTRAINT Check_Nombre_Not_Null 	CHECK(nombre IS NOT NULL),
			ADD CONSTRAINT Check_Horas_Not_Null 	CHECK(horas  IS NOT NULL),
            -- RESTRICCION DE CAMPO NO VACIO
			ADD CONSTRAINT Check_Sigla_Not_Empty 	CHECK(sigla  <> ''),
            ADD CONSTRAINT Check_Codigo_Not_Empty 	CHECK(codigo <> ''),
            ADD CONSTRAINT Check_Nombre_Not_Empty 	CHECK(nombre <> ''),
			ADD CONSTRAINT Check_Horas_Not_Empty 	CHECK(horas  <> ''),
            -- RESTRICCION DE NUMERO MAYOR QUE CERO
            ADD CONSTRAINT Check_Horas_Greater_0 	CHECK(horas  > 0);
#*******************************************************************************************
#	AÑADIMOS LOS DATOS
#*******************************************************************************************
							# MATERIAS DAW
INSERT INTO Modulo 	VALUES 	(DEFAULT,'BD','MP0484','Bases de datos',187,1,'DAW,DAM'),
							(DEFAULT,'CD','MP0487','Contornos de desenvolvemento',107,1,'DAW,DAM'),
                            (DEFAULT,'FOE','MP0617','Formacion e orientacion laboral',107,1,'DAW,DAM'),
                            (DEFAULT,'LM','MP0373','Linguaxe de marcas',133,1,'DAW,DAM'),
                            (DEFAULT,'PR','MP0485','Programacion',240,1,'DAW,DAM'),
                            (DEFAULT,'SSII','MP0483','Sistemas informaticos',186,1,'DAW,DAM'),
                            (DEFAULT,'DIW','MP0615','Disenho de interfaces web',157,2,'DAW'),
                            (DEFAULT,'DWCC','MP0612','Desenvolvemento web en contorno cliente',157,2,'DAW'),
                            (DEFAULT,'DWCS','MP0613','Desenvolvemento web en contorno servidor',175,2,'DAW'),
                            (DEFAULT,'DAW','MP0614','Despregamento de aplicacións web',88,2,'DAW'),
                            (DEFAULT,'EIE','MP0618','Empresa e iniciativa emprendedora',53,2,'DAW'),
                            (DEFAULT,'FCT','MP0619','Formación en centros de traballo',384,2,'DAW');
                            
                            /*
                            PENDIENTE INTRODUCIR DATOS
                            # MATERIAS DA
                            (DEFAULT,'AD','MP0486','Acceso a datos',157,2,'DAM'),
                            (DEFAULT,'DI','MP0488','Desenvolvemento de interfaces',140,2,'DAM'),
                            (DEFAULT,'PSP','MP0490','Programacion de servizos e procesos',70,2,'DAM'),
                            (DEFAULT,'DAW','MP0489','Programacion multimedia e dispositivos mobiles',88,2,'DAM'),
                            (DEFAULT,'EIE','MP0618','Empresa e iniciativa emprendedora',53,2,'DAM'),
                            (DEFAULT,'FCT','MP0619','Formación en centros de traballo',384,2,'DAM'),
                            # MATERIAS INFORMATICA E COMUNICACIONS
                            (DEFAULT,'CA','AM3009','Ciencias aplicadas I ',175,1,'IC'),
							(DEFAULT,'CD','MP0487','Contornos de desenvolvemento',107,1,'IC'),
                            (DEFAULT,'FOE','MP0617','Formacion e orientacion laboral',107,1,'IC'),
                            (DEFAULT,'LM','MP0373','Linguaxe de marcas',133,1,'IC'),
                            (DEFAULT,'PR','MP0485','Programacion',240,1,'IC'),
                            (DEFAULT,'SSII','MP0483','Sistemas informaticos',186,1,'IC'),
                            (DEFAULT,'AD','MP0486','Acceso a datos',157,2,'IC'),
                            (DEFAULT,'DI','MP0488','Desenvolvemento de interfaces',140,2,'IC'),
                            (DEFAULT,'PSP','MP0490','Programacion de servizos e procesos',70,2,'IC');
                            
                            */
                            
                           
#*******************************************************************************************
#	CREAMOS LOS GRUPOS DE USUARIOS:	Direccion, Alumnado, Profesorado
#		En Alumnado -> AlumnadoDAM, AlumnadoDAW, AlumnadoASIR, AlumnadoSMR, AlumnadoIO, AlumnadoIC
#		En Profesorado -> ProfesoradoDAM, ProfesoradoDAW, ProfesoradoASIR, ProfesoradoSMR, ProfesoradoIO, ProfesoradoIC
#-------------------------------------------------------------------------------------------
#	DROP ROLE IF EXISTS <Rol1>, <Rol2>, ..., <RolN>;
#	CREATE ROLE 	    <Rol1>, <Rol2>, ..., <RolN>;
#*******************************************************************************************
/*## CREACION DE TODOS LOS USUARIOS QUE NOS PIDE EL ENUNCIADO DENTRO DEL BLOQUE DE COMENTARIO ##*
CREATE USER Director 											IDENTIFIED BY 'dir';
CREATE USER Vicedirector										IDENTIFIED BY 'vic';
CREATE USER Secretario 											IDENTIFIED BY 'sec';
CREATE USER Al_01DAM,Al_02DAM,Al_03DAM,Al_04DAM,Al_05DAM		IDENTIFIED BY 'abc';
CREATE USER Al_01DAW,Al_02DAW,Al_03DAW,Al_04DAW,Al_05DAW		IDENTIFIED BY 'abc';
CREATE USER Al_01ASIR,Al_02ASIR,Al_03ASIR,Al_04ASIR,Al_05ASIR	IDENTIFIED BY 'abc';
CREATE USER Al_01SMR,Al_02SMR,Al_03SMR,Al_04SMR,Al_05SMR		IDENTIFIED BY 'abc';
CREATE USER Al_01IO,Al_02IO,Al_03IO,Al_04IO,Al_05IO				IDENTIFIED BY 'abc';
CREATE USER Al_01IC,Al_02IC,Al_03IC,Al_04IC,Al_05IC				IDENTIFIED BY 'abc';

CREATE USER Prof_01DAM,Prof_02DAM,Prof_03DAM,Prof_04DAM,Prof_05DAM			IDENTIFIED BY 'pro';
CREATE USER Prof_01DAW,Prof_02DAW,Prof_03DAW,Prof_04DAW,Prof_05DAW			IDENTIFIED BY 'pro';
CREATE USER Prof_01ASIR,Prof_02ASIR,Prof_03ASIR,Prof_04ASIR,Prof_05ASIR		IDENTIFIED BY 'pro';
CREATE USER Prof_01SMR,Prof_02SMR,Prof_03SMR,Prof_04SMR,Prof_05SMR			IDENTIFIED BY 'pro';
CREATE USER Prof_01IO,Prof_02IO,Prof_03IO,Prof_04IO,Prof_05IO				IDENTIFIED BY 'pro';
CREATE USER Prof_01IC,Prof_02IC,Prof_03IC,Prof_04IC,Prof_05IC				IDENTIFIED BY 'pro';
*/
DROP ROLE IF EXISTS Direccion, Alumnado, Profesorado, 
AlumnadoDAM, AlumnadoDAW, AlumnadoASIR, AlumnadoSMR, AlumnadoIO, AlumnadoIC, 
ProfesoradoDAM, ProfesoradoDAW, ProfesoradoASIR, ProfesoradoSMR, ProfesoradoIO, ProfesoradoIC;

CREATE ROLE IF NOT EXISTS  Direccion, Alumnado, Profesorado,
AlumnadoDAM, AlumnadoDAW, AlumnadoASIR, AlumnadoSMR, AlumnadoIO, AlumnadoIC, 
ProfesoradoDAM, ProfesoradoDAW, ProfesoradoASIR, ProfesoradoSMR, ProfesoradoIO, ProfesoradoIC;

#*******************************************************************************************
#	ASIGNAMOS LOS MISMOS PRIVILEGIOS A LOS COMPONENTES DE LOS GRUPOS ALUMNADO Y PROFESORADO
#-------------------------------------------------------------------------------------------
#	GRANT <RolGrupo> TO <RolComponente1>, <RolComponente2>, ..., <RolComponenteN>;
#*******************************************************************************************

GRANT Alumnado 		TO AlumnadoDAM, AlumnadoDAW, AlumnadoASIR, AlumnadoSMR, AlumnadoIO, AlumnadoIC;
GRANT Profesorado	TO ProfesoradoDAM, ProfesoradoDAW, ProfesoradoASIR, ProfesoradoSMR, ProfesoradoIO, ProfesoradoIC;

#*******************************************************************************************
#	CREAMOS LAS VISTAS ASOCIADAS A CADA CICLO FORMATIVO
#-------------------------------------------------------------------------------------------
#	DROP VIEW IF EXISTS ..., ..., ...;
#	CREATE VIEW ... AS SELECT ...;
#*******************************************************************************************
DROP VIEW IF EXISTS VistaDAM, VistaDAW, VistaASIR, VistaSMR, VistaIO, VistaIC;
CREATE VIEW VistaDAM AS SELECT * FROM Modulo WHERE ciclo LIKE  '%DAM%';
CREATE VIEW VistaDAW AS SELECT * FROM Modulo WHERE ciclo LIKE  '%DAW%';
CREATE VIEW VistaASIR AS SELECT * FROM Modulo WHERE ciclo = 'ASIR';
CREATE VIEW VistaSMR AS SELECT * FROM Modulo WHERE ciclo = 'SMR';
CREATE VIEW VistaIO AS SELECT * FROM Modulo WHERE ciclo = 'IO';
CREATE VIEW VistaIC AS SELECT * FROM Modulo WHERE ciclo = 'IC';

#*******************************************************************************************
#	ASIGNAMOS LOS PERMISOS A DIRECCIÓN Y A LOS GRUPOS DEL PROFESORADO
#-------------------------------------------------------------------------------------------
#	GRANT <permiso> ON <tabla> TO <Rol1>, <Rol2>, ..., <Rol3>;
#*******************************************************************************************
## DAMOS LOS PERMISOS A DIRECCION SOBRE LA TABLA, TIENE TODOS ##
GRANT ALL PRIVILEGES 	ON CiclosInformatica.Modulo TO Direccion;
## DAMOS PERMISOS A LOS ROLES PARA LOS PROFESORES DE CADA UNO DE LOS CICLOS, SOBRE LAS VISTAS ## 
GRANT ALL PRIVILEGES 	ON VistaDAM 	TO ProfesoradoDAM;
GRANT ALL PRIVILEGES 	ON VistaDAW 	TO ProfesoradoDAW;
GRANT ALL PRIVILEGES 	ON VistaASIR 	TO ProfesoradoASIR;
GRANT ALL PRIVILEGES 	ON VistaSMR 	TO ProfesoradoSMR;
GRANT ALL PRIVILEGES 	ON VistaIO 		TO ProfesoradoIO;
## DAMOS LOS PERMISOS A LOS ROLES PARA CADA UNO DE LOS ALUMNOS DE CADA UNO DE LOS CICLOS,SOBRE LAS MISMAS VISTAS QUE LOS PROFESORES ##
GRANT SELECT 			ON VistaDAM 	TO AlumnadoDAM;
GRANT SELECT 			ON VistaDAW 	TO AlumnadoDAW;
GRANT SELECT 			ON VistaASIR	TO AlumnadoASIR;
GRANT SELECT 			ON VistaSMR		TO AlumnadoSMR;
GRANT SELECT 			ON VistaIO 		TO AlumnadoIO;
GRANT SELECT 			ON VistaIC 		TO AlumnadoIC;

#*******************************************************************************************
#	CREAMOS LOS USUARIOS DE DIRECCIÓN CON DEFAULT ROLE
#-------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <direccion1>, <direccion2>, ..., <direccionN>;
#	CREATE USER <direccion1> IDENTIFIED BY 'dir' DEFAULT ROLE 'Rol1';
#	...........................
#	CREATE USER <direccionN> IDENTIFIED BY 'dir' DEFAULT ROLE 'Rol1';
#*******************************************************************************************
DROP USER IF EXISTS Director,Vicedirector,Secretario,JefeEstudiosDiurno,JefeEstudiosNocturno;
CREATE USER Director 					IDENTIFIED BY 'Dir' DEFAULT ROLE Direccion;
CREATE USER Vicedirector				IDENTIFIED BY 'Vic' DEFAULT ROLE Direccion;
CREATE USER Secretario					IDENTIFIED BY 'Sec'	DEFAULT ROLE Direccion;
CREATE USER JefeEstudiosDiurno			IDENTIFIED BY 'JED'	DEFAULT ROLE Direccion;
CREATE USER JefeEstudiosNocturno		IDENTIFIED BY 'JEN'	DEFAULT ROLE Direccion;

#*******************************************************************************************
#	CREAMOS LOS USUARIOS DEL PROFESORADO CON DEFAULT ROLE
#-------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <profesor1>, <profesor2>, ..., <profesorN>;
#	CREATE USER <profesor1> IDENTIFIED BY 'pro' DEFAULT ROLE 'Rol2';
#	...........................
#	CREATE USER <profesorN> IDENTIFIED BY 'pro' DEFAULT ROLE 'Rol2';
#*******************************************************************************************
-- Quiza deberiamos crear un usurio particular para cada profesor. Pero en este caso para simplificar
-- suponemos que solo hay un profesor por ciclo y deberiamos hacerlo por materia. Discutible.
DROP USER IF EXISTS Prof_01DAM,Prof_02DAM,Prof_03DAM,Prof_04DAM,Prof_05DAM,
					Prof_01DAW,Prof_02DAW,Prof_03DAW,Prof_04DAW,Prof_05DAW,
                    Prof_01ASIR,Prof_02ASIR,Prof_03ASIR,Prof_04ASIR,Prof_05ASIR,
                    Prof_01SMR,Prof_02SMR,Prof_03SMR,Prof_04SMR,Prof_05SMR,
                    Prof_01IO,Prof_02IO,Prof_03IO,Prof_04IO,Prof_05IO,
                    Prof_01IC,Prof_02IC,Prof_03IC,Prof_04IC,Prof_05IC;
### CREACION DE LOS USUARIOS PARA EL PROFESORADO DAM ###                    
CREATE USER Prof_01DAM IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAM;
CREATE USER Prof_02DAM IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAM;
CREATE USER Prof_03DAM IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAM;
CREATE USER Prof_04DAM IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAM;
CREATE USER Prof_05DAM IDENTIFIED BY 'pro' 	DEFAULT ROLE ProfesoradoDAM;
### CREACION DE LOS USUARIOS PARA EL PROFESORADO DAW ###                    
CREATE USER Prof_01DAW IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAW;
CREATE USER Prof_02DAW IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAW;
CREATE USER Prof_03DAW IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAW;
CREATE USER Prof_04DAW IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoDAW;
CREATE USER Prof_05DAW IDENTIFIED BY 'pro' 	DEFAULT ROLE ProfesoradoDAW;
### CREACION DE LOS USUARIOS PARA EL PROFESORADO ASIR ###                    
CREATE USER Prof_01ASIR IDENTIFIED BY 'pro' DEFAULT ROLE ProfesoradoASIR;
CREATE USER Prof_02ASIR IDENTIFIED BY 'pro' DEFAULT ROLE ProfesoradoASIR;
CREATE USER Prof_03ASIR IDENTIFIED BY 'pro' DEFAULT ROLE ProfesoradoASIR;
CREATE USER Prof_04ASIR IDENTIFIED BY 'pro' DEFAULT ROLE ProfesoradoASIR;
CREATE USER Prof_05ASIR IDENTIFIED BY 'pro' DEFAULT ROLE ProfesoradoASIR;
### CREACION DE LOS USUARIOS PARA EL PROFESORADO SMR ###                    
CREATE USER Prof_01SMR IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoSMR;
CREATE USER Prof_02SMR IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoSMR;
CREATE USER Prof_03SMR IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoSMR;
CREATE USER Prof_04SMR IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoSMR;
CREATE USER Prof_05SMR IDENTIFIED BY 'pro' 	DEFAULT ROLE ProfesoradoSMR;
### CREACION DE LOS USUARIOS PARA EL PROFESORADO IO ###                    
CREATE USER Prof_01IO IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoIO;
CREATE USER Prof_02IO IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoIO;
CREATE USER Prof_03IO IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoIO;
CREATE USER Prof_04IO IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoIO;
CREATE USER Prof_05IO IDENTIFIED BY 'pro'  	DEFAULT ROLE ProfesoradoIO;
### CREACION DE LOS USUARIOS PARA EL PROFESORADO IC ###                    
CREATE USER Prof_01IC IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoIC;
CREATE USER Prof_02IC IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoIC;
CREATE USER Prof_03IC IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoIC;
CREATE USER Prof_04IC IDENTIFIED BY 'pro'	DEFAULT ROLE ProfesoradoIC;
CREATE USER Prof_05IC IDENTIFIED BY 'pro'  	DEFAULT ROLE ProfesoradoIC;


#*******************************************************************************************
#	DAMOS LOS RESPECTIVOS PRIVILEGIOS A LOS GRUPOS DEL ALUMNADO
#-------------------------------------------------------------------------------------------
#	GRANT <permiso> ON <tabla> TO <Rol1>;
#	---------------------
#	GRANT <permiso> ON <tabla> TO <RolN>;
#*******************************************************************************************
DROP VIEW IF EXISTS AlumnadoDAW,AlumnadoDAM,AlumnadoASIR,AlumnadoSMR,AlumnadoIO,AlumnadoIC;

CREATE VIEW VistaAlumnadoDAW AS SELECT * FROM Modulo WHERE ciclo = 'DAW';
GRANT SELECT ON VistaAlumnadoDAW TO AlumnadoDAW;
CREATE VIEW VistaAlumnadoDAM AS SELECT * FROM Modulo WHERE ciclo = 'DAW';
GRANT SELECT ON VistaAlumnadoDAM TO AlumnadoDAM;
CREATE VIEW VistaAlumnadoASIR AS SELECT * FROM Modulo WHERE ciclo = 'ASIR';
GRANT SELECT ON VistaAlumnadoASIR TO AlumnadoASIR;
CREATE VIEW VistaAlumnadoSMR AS SELECT * FROM Modulo WHERE ciclo = 'SMR';
GRANT SELECT ON VistaAlumnadoSMR TO AlumnadoSMR;
CREATE VIEW VistaAlumnadoIO AS SELECT * FROM Modulo WHERE ciclo = 'IO';
GRANT SELECT ON VistaAlumnadoIO TO AlumnadoIO;
CREATE VIEW VistaAlumnadoIC AS SELECT * FROM Modulo WHERE ciclo = 'IC';
GRANT SELECT ON VistaAlumnadoIC TO AlumnadoIC;

#*******************************************************************************************
#	CREAMOS LOS USUARIOS, ASIGNÁNDOLES LOS ROLES CORRESPONDIENTES
#-------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <usuario1>, <usuario2>, ..., <usuarioN>;
#	CREATE USER <usuario1> IDENTIFIED BY 'use' DEFAULT ROLE 'Rol3';
#	...........................
#	CREATE USER <usuarioN> IDENTIFIED BY 'use' DEFAULT ROLE 'Rol3';
#*******************************************************************************************
DROP USER IF EXISTS Al_01DAM,Al_02DAM,Al_03DAM,Al_04DAM,Al_05DAM,
					Al_01DAW,Al_02DAW,Al_03DAW,Al_04DAW,Al_05DAW,
                    Al_01ASIR,Al_02ASIR,Al_03ASIR,Al_04ASIR,Al_05ASIR,
                    Al_01SMR,Al_02SMR,Al_03SMR,Al_04SMR,Al_05SMR,
                    Al_01IO,Al_02IO,Al_03IO,Al_04IO,Al_05IO,
                    Al_01IC,Al_02IC,Al_03IC,Al_04IC,Al_05IC;
                    
CREATE USER Al_01DAM		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoDAM;
CREATE USER Al_02DAM		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoDAM;
CREATE USER Al_03DAM		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoDAM;
CREATE USER Al_04DAM		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoDAM;
CREATE USER Al_05DAM		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoDAM;

CREATE USER Al_01DAW		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoDAW;
CREATE USER Al_02DAW		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoDAW;
CREATE USER Al_03DAW		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoDAW;
CREATE USER Al_04DAW		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoDAW;
CREATE USER Al_05DAW		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoDAW;

CREATE USER Al_01ASIR		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoASIR;
CREATE USER Al_02ASIR		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoASIR;
CREATE USER Al_03ASIR		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoASIR;
CREATE USER Al_04ASIR		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoASIR;
CREATE USER Al_05ASIR		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoASIR;

CREATE USER Al_01SMR		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoSMR;
CREATE USER Al_02SMR		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoSMR;
CREATE USER Al_03SMR		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoSMR;
CREATE USER Al_04SMR		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoSMR;
CREATE USER Al_05SMR		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoSMR;

CREATE USER Al_01IO		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoIO;
CREATE USER Al_02IO		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoIO;
CREATE USER Al_03IO		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoIO;
CREATE USER Al_04IO		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoIO;
CREATE USER Al_05IO		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoIO;

CREATE USER Al_01IC		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoIC;
CREATE USER Al_02IC		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoIC;
CREATE USER Al_03IC		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoIC;
CREATE USER Al_04IC		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoIC;
CREATE USER Al_05IC		IDENTIFIED BY 'abc' DEFAULT ROLE AlumnadoIC;

#*******************************************************************************************
#*******************************************************************************************