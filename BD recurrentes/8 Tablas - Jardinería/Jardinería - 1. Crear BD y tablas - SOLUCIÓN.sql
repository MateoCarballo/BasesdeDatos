#--------------------------------------------------------------------------------------------
#	CREACIÓN Y USO DE LA BASE DE DATOS 'Jardineria'
#--------------------------------------------------------------------------------------------
	DROP DATABASE IF EXISTS Jardineria;
	CREATE DATABASE 		Jardineria
								character set	utf32
								collate			utf32_spanish2_ci;
	USE 					Jardineria;

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'oficina'
#--------------------------------------------------------------------------------------------
#		oficinaID			cadena de texto 10, no nulo
#		ciudad				cadena de texto 30, no nulo
#		pais				cadena de texto 50, no nula
#		region				cadena de texto 50, no nula
#		CP					cadena de texto 10, no nula
#		telefono			cadena de texto 20, no nula
#		linea_direccion1	cadena de texto 50, no nulo
#		linea_direccion2	cadena de texto 50, por defecto nulo
#
#		Clave primaria		oficinaID
#--------------------------------------------------------------------------------------------
	CREATE TABLE oficina (
		oficinaID 			VARCHAR( 10 ) NOT NULL,
		ciudad 				VARCHAR( 30 ) NOT NULL,
		pais 				VARCHAR( 50 ) NOT NULL,
		region 				VARCHAR( 50 ) NOT NULL,
		CP		 			VARCHAR( 10 ) NOT NULL,
		telefono 			VARCHAR( 20 ) NOT NULL,
		linea_direccion1 	VARCHAR( 50 ) NOT NULL,
		linea_direccion2 	VARCHAR( 50 ) DEFAULT NULL,
		PRIMARY KEY ( oficinaID )
);

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'empleado'
#--------------------------------------------------------------------------------------------
#		empleadoID		entero
#		nombre			cadena de caracteres 50
#		apellido1		cadena de caracteres 50
#		apellido2		cadena de caracteres 50, puede no existir para algún empleado
#		extension		cadena de caracteres 10
#		email			cadena de caracteres 100
#		oficina			cadena de caracteres 10
#		jefe			entero, nulo por defecto
#		puesto			cadena de caracteres 50
#
#		Clave primaria		empleadoID
#		clave foránea		oficina		enlace con la tabla oficina
#		clave foránea		jefe		enlace con la tabla empleado		
#--------------------------------------------------------------------------------------------
	CREATE TABLE empleado (
		empleadoID 			INTEGER NOT NULL,
		nombre 				VARCHAR(  50 ) NOT NULL,
		apellido1 			VARCHAR(  50 ) NOT NULL,
		apellido2 			VARCHAR(  50 ) DEFAULT NULL,
		extension 			VARCHAR(  10 ) NOT NULL,
		email 				VARCHAR( 100 ) NOT NULL,
		oficina 			VARCHAR(  10 ) NOT NULL,
		jefe 				INTEGER DEFAULT NULL,
		puesto 				VARCHAR(  50 ) DEFAULT NULL,
		PRIMARY KEY ( empleadoID ),
		FOREIGN KEY ( oficina ) 	REFERENCES oficina 	(  oficinaID ),
		FOREIGN KEY ( jefe ) 		REFERENCES empleado ( empleadoID )
	);

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'gama_producto'
#--------------------------------------------------------------------------------------------
#		gama				cadena de caracteres 50
#		descripcion_texto	cadena de caracteres
#		descripcion_html	cadena de caracteres
#		imagen				cadena de caracteres 256
#
#		Clave primaria		gama
#--------------------------------------------------------------------------------------------
	CREATE TABLE gama_producto (
		gama 				VARCHAR(  50 ) NOT NULL,
		descripcion_texto 	TEXT,
		descripcion_html 	TEXT,
		imagen 				VARCHAR( 256 ),
		PRIMARY KEY ( gama )
	);

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'cliente'
#--------------------------------------------------------------------------------------------
#		clienteID				entero
#		nombre_cliente			cadena de caracteres 50
#		nombre_contacto			cadena de caracteres 30 -> puede no haber
#		apellido_contacto		cadena de caracteres 50 -> puede no haber
#		telefono				cadena de caracteres 15
#		fax						cadena de caracteres 15
#		linea_direccion1		cadena de caracteres 50
#		linea_direccion2		cadena de caracteres 50 -> puede no haber
#		ciudad					cadena de caracteres 50
#		region					cadena de caracteres 50
#		pais					cadena de caracteres 50
#		CP						cadena de caracteres 10
#		representante_ventas	entero -> puede no haber
#		limite_credito			valor decimal (15,2) -> puede no haber
#
#		Clave primaria		clienteID
#		clave foránea		representante_ventas	enlace con la tabla empleado		
#--------------------------------------------------------------------------------------------
	CREATE TABLE cliente (
		clienteID 				INTEGER 			NOT NULL,
		nombre_cliente 			VARCHAR( 50 ) 		NOT NULL,
		nombre_contacto 		VARCHAR( 30 )		DEFAULT NULL,
		apellido_contacto 		VARCHAR( 30 )		DEFAULT NULL,
		telefono 				VARCHAR( 15 )		NOT NULL,
		fax 					VARCHAR( 15 )		NOT NULL,
		linea_direccion1 		VARCHAR( 50 )		NOT NULL,
		linea_direccion2 		VARCHAR( 50 )		DEFAULT NULL,
		ciudad 					VARCHAR( 50 )		NOT NULL,
		region 					VARCHAR( 50 )		DEFAULT NULL,
		pais 					VARCHAR( 50 )		DEFAULT NULL,
		CP 						VARCHAR( 10 )		DEFAULT NULL,
		representante_ventas	INTEGER 			DEFAULT NULL,
		limite_credito 			NUMERIC( 15, 2 )	DEFAULT NULL,
		PRIMARY KEY ( clienteID ),
		FOREIGN KEY ( representante_ventas ) REFERENCES empleado ( empleadoID )
);

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'pedido'
#--------------------------------------------------------------------------------------------
#		pedidoID				entero
#		fecha_pedido			fecha
#		fecha_esperada			fecha
#		fecha_entrega			fecha -> puede ser nulo
#		estado					cadena de caracteres 15
#		comentarioa				cadena de caracteres
#		cliente					entero, no nulo
#
#		Clave primaria		pedidoID
#		clave foránea		cliente		enlace con la tabla cliente
#--------------------------------------------------------------------------------------------
	CREATE TABLE pedido (
		pedidoID 			INTEGER			NOT NULL,
		fecha_pedido 		DATE 			NOT NULL,
		fecha_esperada 		DATE 			NOT NULL,
		fecha_entrega 		DATE 			DEFAULT NULL,
		estado 				VARCHAR( 15 )	NOT NULL,
		comentarios 		TEXT,
		cliente 			INTEGER 		NOT NULL,
		PRIMARY KEY ( pedidoID ),
		FOREIGN KEY ( cliente ) REFERENCES cliente ( clienteID )
	);

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'PRODUCTO'
#--------------------------------------------------------------------------------------------
#		productoID				cadena de caracteres 15
#		nombre					cadena de caracteres 70
#		gama					cadena de caracteres 50
#		dimensiones				cadena de caracteres 25 -> puede ser nulo
#		proveedor				cadena de caracteres 50 -> puede ser nulo
#		descripcion				cadena de caracteres	-> puede ser nulo
#		cantidad_en_stock		entero pequeño, no nulo
#		precio_venta			numérico 15 y 2 decimales
#		precio_proveedor		numérico 15 y 2 decimales
#
#		Clave primaria		productoID
#		clave foránea		gama		enlace con la tabla gama_producto
#--------------------------------------------------------------------------------------------
	CREATE TABLE producto (
		productoID 			VARCHAR( 15 )	NOT NULL,
		nombre 				VARCHAR( 70 )	NOT NULL,
		gama 				VARCHAR( 50 )	NOT NULL,
		dimensiones 		VARCHAR( 25 )	NULL,
		proveedor 			VARCHAR( 50 )	DEFAULT NULL,
		descripcion 		TEXT			NULL,
		cantidad_en_stock 	SMALLINT 		NOT NULL,
		precio_venta 		NUMERIC( 15, 2 )	NOT NULL,
		precio_proveedor 	NUMERIC( 15, 2 )	DEFAULT NULL,
		PRIMARY KEY ( productoID ),
		FOREIGN KEY ( gama ) REFERENCES gama_producto ( gama )
	);

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'detalle_pedido'
#--------------------------------------------------------------------------------------------
#		pedidoID				entero
#		productoID				cadena de caracteres 15
#		cantidad				entero
#		precio_unidad			numérico 15 y 2 decimales
#		linea					entero pequeño, no nulo
#
#		Clave primaria		pedidoID, productoID
#		clave foránea		cliente		enlace con la tabla cliente
#--------------------------------------------------------------------------------------------
	CREATE TABLE detalle_pedido (
		pedidoID 			INTEGER 			NOT NULL,
		productoID 			VARCHAR( 15 ) 		NOT NULL,
		cantidad 			INTEGER 			NOT NULL,
		precio_unidad 		NUMERIC( 15, 2 )	NOT NULL,
		numero_linea 		SMALLINT 			NOT NULL,
		PRIMARY KEY ( pedidoID, productoID ),
		FOREIGN KEY ( pedidoID )		REFERENCES pedido(     pedidoID ),
		FOREIGN KEY ( productoID ) 	REFERENCES producto( productoID )
);

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'pago'
#--------------------------------------------------------------------------------------------
#		clienteID				entero
#		forma_pago				cadena de caracteres 40
#		transaccion				cadena de caracteres 50
#		fecha_pago				fecha -> puede ser nulo
#		total					numérico 15 y 2 decimales
#
#		Clave primaria		pedidoID
#		clave foránea		clienteID		enlace con la tabla cliente
#--------------------------------------------------------------------------------------------
	CREATE TABLE pago (
		clienteID 			INTEGER 			NOT NULL,
		forma_pago 			VARCHAR( 40 )		NOT NULL,
		transaccionID		VARCHAR( 50 )		NOT NULL,
		fecha_pago 			DATE 				NOT NULL,
		total 				NUMERIC( 15, 2 )	NOT NULL,
		PRIMARY KEY ( clienteID, transaccionID ),
		FOREIGN KEY ( clienteID ) REFERENCES cliente ( clienteID )
);

#--------------------------------------------------------------------------------------------
#	DICCIONARIO DE DATOS
#--------------------------------------------------------------------------------------------
