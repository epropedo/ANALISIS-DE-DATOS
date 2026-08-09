/* DDL - CREACION DE BASE DE DATOS Y PUESTA EN USO */

CREATE DATABASE Ventas_Tech_DB;
USE Ventas_Tech_DB;

/* DDL - ELIMINACION DE TABLAS PREEXISTENTES EN CASO DE EXISTIR */

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

/* DML - CREACION DE TABLAS CON TIPOS DE CARACTERES Y RESTRICCIONES */

CREATE TABLE categorias(
id_categoria INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
nombre_categoria VARCHAR(50) NOT NULL,
descripcion VARCHAR(200),
);

CREATE TABLE clientes(
id_cliente INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
nombre_cliente VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
ciudad VARCHAR(50),
fecha_registro DATE NOT NULL,
);

CREATE TABLE productos(
id_producto INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
nombre_producto VARCHAR(100) NOT NULL,
id_categoria INT FOREIGN KEY REFERENCES categorias(id_categoria),
precio DECIMAL(10,2) NOT NULL,
stock INT DEFAULT 0,
activo BIT DEFAULT 1,
);

CREATE TABLE ventas(
id_venta INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
id_cliente INT FOREIGN KEY REFERENCES clientes(id_cliente),
id_producto INT FOREIGN KEY REFERENCES productos(id_producto),
cantidad INT NOT NULL,
precio_unitario DECIMAL(10,2) NOT NULL,
fecha_venta DATE NOT NULL,
);

/* DML - CARGA DE DATOS EN TABLAS */

--- TABLA CATEGORIAS ---

INSERT INTO categorias VALUES ('Computación', 'Laptops, PCs y monitores');
INSERT INTO categorias VALUES ('Accesorios', 'Periféricos y complementos');
INSERT INTO categorias VALUES ('Audio', 'Auriculares y parlantes');
INSERT INTO categorias VALUES ('Almacenamiento','Discos y memorias');

--- TABLA CLIENTES ---

INSERT INTO clientes VALUES ('María López', 'maria@mail.com','Buenos Aires', '2024-01-05');
INSERT INTO clientes VALUES ('Carlos Ruiz', 'carlos@mail.com', 'Córdoba', '2024-01-10');
INSERT INTO clientes VALUES ('Ana Gómez', 'ana@mail.com', 'Rosario', '2024-02-01');
INSERT INTO clientes VALUES ('Pedro Sanz', 'pedro@mail.com', 'Mendoza', '2024-02-15');
INSERT INTO clientes VALUES ('Laura Torres', 'laura@mail.com', 'Tucumán', '2024-03-01');

--- TABLA PRODUCTOS ---

INSERT INTO productos VALUES ('Laptop Pro 15', 1, 1200.00, 15, 1);
INSERT INTO productos VALUES ('Mouse Inalámbrico', 2,   28.00, 80, 1);
INSERT INTO productos VALUES ('Monitor 4K 27"', 1,  450.00, 12, 1);
INSERT INTO productos VALUES ('Auriculares BT Pro', 3,  120.00, 35, 1);
INSERT INTO productos VALUES ('SSD Externo 1TB', 4, 130.00, 18, 1);
INSERT INTO productos VALUES ('Teclado Mecánico', 2, 95.00, 40, 1);


--- TABLA VENTAS ---

INSERT INTO ventas VALUES (1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO ventas VALUES (2, 2, 5, 28.00, '2024-03-06');
INSERT INTO ventas VALUES (3, 3, 1, 450.00, '2024-03-07');
INSERT INTO ventas VALUES (1, 4, 2, 120.00, '2024-03-08');
INSERT INTO ventas VALUES (4, 5, 3, 130.00, '2024-03-10');
INSERT INTO ventas VALUES (2, 6, 4, 95.00, '2024-03-11');
INSERT INTO ventas VALUES (5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO ventas VALUES (3, 2, 8, 28.00, '2024-03-13');
INSERT INTO ventas VALUES (4, 4, 1, 120.00, '2024-03-14');
INSERT INTO ventas VALUES (5, 3, 2, 450.00, '2024-03-15');


/* DQL - VISUALIZACION DE TABLAS Y DATOS CREADOS */

SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;







