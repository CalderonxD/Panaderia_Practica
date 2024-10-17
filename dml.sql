INSERT INTO tipo (nombre) VALUES
('Pan'),
('Postre'),
('Bebida');

INSERT INTO productos (nombre, precio, cantidad, id_tipo) VALUES
('Pan de centeno', 50, 100, 1),
('Croissant', 35, 200, 1),
('Pastel de chocolate', 120, 50, 2),
('Café Americano', 25, 300, 3),
('Jugo de naranja', 20, 150, 3);


INSERT INTO ingredientes (nombre, cantidad) VALUES
('Harina', 1000),
('Azúcar', 500),
('Leche', 300),
('Cacao', 200),
('Café', 400),
('Naranja', 600);


INSERT INTO ingredientes_productos (id_producto, id_ingrediente) VALUES
(1, 1),  -- Pan de centeno con harina
(1, 2),  -- Pan de centeno con azúcar
(2, 1),  -- Croissant con harina
(2, 3),  -- Croissant con leche
(3, 2),  -- Pastel de chocolate con azúcar
(3, 4),  -- Pastel de chocolate con cacao
(4, 5),  -- Café Americano con café
(5, 6);  -- Jugo de naranja con naranja


INSERT INTO clientes (nombre) VALUES
('Juan Pérez'),
('María González'),
('Luis Rodríguez'),
('Ana López');


INSERT INTO empleados (nombre) VALUES
('Carlos García'),
('Laura Fernández');

INSERT INTO ventas (id_cliente, id_empleado, fecha, total) VALUES
(1, 1, '2024-10-01',5000),  -- Venta hecha por Juan Pérez con Carlos García
(2, 2, '2024-10-02',2000),  -- Venta hecha por María González con Laura Fernández
(3, 1, '2024-10-03',4000),  -- Venta hecha por Luis Rodríguez con Carlos García
(4, 2, '2024-10-04',3000);  -- Venta hecha por Ana López con Laura Fernández


INSERT INTO ventas_productos (id_venta, id_producto) VALUES
(1, 1),  -- Juan Pérez compra Pan de centeno
(1, 4),  -- Juan Pérez compra Café Americano
(2, 3),  -- María González compra Pastel de chocolate
(3, 2),  -- Luis Rodríguez compra Croissant
(3, 5),  -- Luis Rodríguez compra Jugo de naranja
(4, 1);  -- Ana López compra Pan de centeno


INSERT INTO proveedores (nombre) VALUES
('Proveedor de Harina SA'),
('Café Especial SRL'),
('Frutas del Valle');


INSERT INTO orden_compra_ingrediente_a_proveedor (fecha) VALUES
('2024-09-28'),
('2024-09-30'),
('2024-10-02');

UPDATE `panaderia`.`orden_compra_ingrediente_a_proveedor` SET `estado` = 'entregado' WHERE (`id_orden` = '1');
UPDATE `panaderia`.`orden_compra_ingrediente_a_proveedor` SET `estado` = 'pendiente' WHERE (`id_orden` = '2');
UPDATE `panaderia`.`orden_compra_ingrediente_a_proveedor` SET `estado` = 'entregado' WHERE (`id_orden` = '3');


INSERT INTO ingredientes_orden (id_ingrediente, id_orden) VALUES
(1, 1),  -- Harina ordenada en la primera orden
(2, 1),  -- Azúcar ordenada en la primera orden
(5, 2),  -- Café ordenado en la segunda orden
(6, 3);  -- Naranja ordenada en la tercera orden


INSERT INTO orden_proveedor (id_orden, id_proveedor) VALUES
(1, 1),  -- Primera orden con Proveedor de Harina SA
(2, 2),  -- Segunda orden con Café Especial SRL
(3, 3);  -- Tercera orden con Frutas del Valle
