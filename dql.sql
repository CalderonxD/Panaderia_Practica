--select

--1
select * from productos;

--2
select * from ingredientes;

--3
select * from ventas where ventas.fecha = "2024-10-01";

--4
select * from clientes;

--5
select * from empleados;

--6
select * from orden_proveedor;

--7
select * from ventas where ventas.total > "100";


--8
SELECT * 
FROM productos 
WHERE id_tipo = (SELECT id_tipo FROM tipo WHERE nombre = 'pan');