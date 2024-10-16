-- Crear base de datos
CREATE DATABASE panaderia;

-- Usar la base de datos
USE panaderia;

-- Tabla tipo
CREATE TABLE tipo (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio INT NOT NULL,
    cantidad INT NOT NULL,
    id_tipo INT,
    FOREIGN KEY (id_tipo) REFERENCES tipo(id_tipo)
);

-- Tabla ingredientes
CREATE TABLE ingredientes (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL
);

-- Tabla ingredientes_productos (relación muchos a muchos entre productos e ingredientes)
CREATE TABLE ingredientes_productos (
    id_producto INT,
    id_ingrediente INT,
    PRIMARY KEY (id_producto, id_ingrediente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id_ingrediente)
);

-- Tabla clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla empleados
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla ventas
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_empleado INT,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

ALTER TABLE `panaderia`.`ventas` 
ADD COLUMN `total` INT NOT NULL AFTER `fecha`;

-- Tabla ventas_productos (relación muchos a muchos entre ventas y productos)
CREATE TABLE ventas_productos (
    id_venta INT,
    id_producto INT,
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Tabla proveedores
CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla orden_compra_ingrediente_a_proveedor
CREATE TABLE orden_compra_ingrediente_a_proveedor (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL
);

-- Tabla ingredientes_orden (relación muchos a muchos entre ingredientes y órdenes de compra)
CREATE TABLE ingredientes_orden (
    id_ingrediente INT,
    id_orden INT,
    PRIMARY KEY (id_ingrediente, id_orden),
    FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id_ingrediente),
    FOREIGN KEY (id_orden) REFERENCES orden_compra_ingrediente_a_proveedor(id_orden)
);

-- Tabla orden_proveedor (relación muchos a muchos entre órdenes de compra y proveedores)
CREATE TABLE orden_proveedor (
    id_orden INT,
    id_proveedor INT,
    PRIMARY KEY (id_orden, id_proveedor),
    FOREIGN KEY (id_orden) REFERENCES orden_compra_ingrediente_a_proveedor(id_orden),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);
