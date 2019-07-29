DROP SCHEMA IF EXISTS tp_final;

CREATE SCHEMA IF NOT EXISTS tp_final;
USE tp_final;

CREATE TABLE categoria (
  cod_categoria INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (cod_categoria));

CREATE TABLE vehiculo (
  cod_vehiculo INT NOT NULL,
  descripcion VARCHAR(1000),
  precio DECIMAL(10.2),
  stock INT,
  cod_categoria INT,
  PRIMARY KEY (cod_vehiculo),
  CONSTRAINT fk_vehiculo_categoria1 FOREIGN KEY (cod_categoria) REFERENCES categoria(cod_categoria)
);

CREATE TABLE similar (
  vehiculo_1 INT NOT NULL,
  vehiculo_2 INT NOT NULL,
  PRIMARY KEY (vehiculo_1, vehiculo_2),
  CONSTRAINT fk_vehiculo_has_vehiculo_vehiculo FOREIGN KEY (vehiculo_1) REFERENCES vehiculo(cod_vehiculo),
  CONSTRAINT fk_vehiculo_has_vehiculo_vehiculo1 FOREIGN KEY (vehiculo_2) REFERENCES vehiculo(cod_vehiculo)
);

CREATE TABLE reparacion (
  cod_reparacion INT NOT NULL AUTO_INCREMENT,
  costo DECIMAL(10.2) NULL DEFAULT 0,
  descripcion_problema VARCHAR(1000),
  descripcion_solucion VARCHAR(1000),
  fecha_ingreso DATETIME NOT NULL,
  fecha_devolucion DATETIME NULL,
  cod_vehiculo INT NOT NULL,
  PRIMARY KEY (cod_reparacion),
  CONSTRAINT fk_reparacion_vehiculo1 FOREIGN KEY (cod_vehiculo) REFERENCES vehiculo(cod_vehiculo)
  );

CREATE TABLE provincia (
  cod_provincia TINYINT UNSIGNED NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (cod_provincia));

CREATE TABLE localidad (
  cod_localidad SMALLINT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  cod_provincia TINYINT UNSIGNED NOT NULL,
  
  PRIMARY KEY (cod_localidad),
  CONSTRAINT fk_localidad_provincia1 FOREIGN KEY (cod_provincia) REFERENCES provincia(cod_provincia)
  );

CREATE TABLE cliente (
  cuit INT NOT NULL,
  razon_social VARCHAR(120) NOT NULL,
  domicilio VARCHAR(100) NOT NULL,
  cod_localidad SMALLINT NOT NULL,
  PRIMARY KEY (cuit),
  CONSTRAINT fk_cliente_localidad1 FOREIGN KEY (cod_localidad) REFERENCES localidad(cod_localidad)
);


CREATE TABLE factura (
  cod_factura INT NOT NULL AUTO_INCREMENT,
  fecha DATETIME NOT NULL,
  cliente_cuit INT NOT NULL,
  PRIMARY KEY (cod_factura),
  CONSTRAINT fk_factura_cliente1 FOREIGN KEY (cliente_cuit) REFERENCES cliente(cuit)
);

CREATE TABLE renglon (
  numero INT NOT NULL,
  cod_factura INT NOT NULL,
  precio DECIMAL(10.2) NOT NULL,
  cantidad INT NOT NULL,
  cod_vehiculo INT NOT NULL,
  PRIMARY KEY (numero, cod_factura),
  CONSTRAINT fk_renglon_factura1 FOREIGN KEY (cod_factura) REFERENCES factura(cod_factura),
  CONSTRAINT fk_renglon_vehiculo1 FOREIGN KEY (cod_vehiculo) REFERENCES vehiculo(cod_vehiculo)
);

CREATE TABLE minorista (
  cliente_cuit INT NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  nombre_contacto VARCHAR(45) NOT NULL,
  PRIMARY KEY (cliente_cuit),
  CONSTRAINT fk_minorista_cliente1 FOREIGN KEY (cliente_cuit) REFERENCES cliente(cuit)
);


CREATE TABLE mayorista (
  cliente_cuit INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  PRIMARY KEY (cliente_cuit),
  CONSTRAINT fk_mayorista_cliente1 FOREIGN KEY (cliente_cuit) REFERENCES cliente(cuit)
);

