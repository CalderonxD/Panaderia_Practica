--SELECT

--a
select * from productos;

--b
select * from ingredientes;

--c
select * from ventas where ventas.fecha = "2024-10-01";

--d
select * from clientes;

--e
select * from empleados;

--f
select * from orden_proveedor;

--g
select * from ventas where ventas.total > "100";


--h
SELECT * 
FROM productos 
WHERE id_tipo = (SELECT id_tipo FROM tipo WHERE nombre = 'pan');

--i
SELECT * FROM panaderia.proveedores;

--j
select * from orden_compra_ingrediente_a_proveedor where estado = 'pendiente';



--JOIN

--a
select * 
from ventas
inner join ventas_productos on ventas.id_venta = ventas_productos.id_venta
inner join productos on ventas_productos.id_producto = productos.id_producto;

--b
select productos.nombre as nombre_producto, ingredientes.nombre as nombre_ingrediente
from productos
inner join ingredientes_productos on productos.id_producto = ingredientes_productos.id_producto
inner join ingredientes on ingredientes_productos.id_ingrediente = ingredientes.id_ingrediente;

--c
select * 
from empleados
inner join ventas on empleados.id_empleado = ventas.id_empleado;

--d
select ingredientes.nombre as nombre_ingrediente, proveedores.nombre as nombre_proveedor
from ingredientes
inner join ingredientes_orden on ingredientes.id_ingrediente = ingredientes_orden.id_ingrediente
inner join orden_compra_ingrediente_a_proveedor on ingredientes_orden.id_orden = orden_compra_ingrediente_a_proveedor.id_orden
inner join orden_proveedor on orden_compra_ingrediente_a_proveedor.id_orden = orden_proveedor.id_orden
inner join proveedores on orden_proveedor.id_proveedor = proveedores.id_proveedor;

--e
select *
from clientes
inner join ventas on clientes.id_cliente = ventas.id_cliente;


--f
select orden_compra_ingrediente_a_proveedor.*, proveedores.nombre as nombre_proveedor
from orden_compra_ingrediente_a_proveedor
inner join orden_proveedor on orden_compra_ingrediente_a_proveedor.id_orden = orden_proveedor.id_orden
inner join proveedores on orden_proveedor.id_proveedor = proveedores.id_proveedor;