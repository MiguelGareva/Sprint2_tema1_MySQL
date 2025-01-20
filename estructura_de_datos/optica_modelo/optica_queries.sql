SELECT COUNT(*) FROM venta WHERE id_cliente = 1;
SELECT * FROM gafas JOIN ventas ON gafas.id_gafas = ventas.id_gafas WHERE ventas.id_empleado = 2 AND ventas.fecha LIKE '%2024%';
SELECT DISTINCT proveedor.nombre FROM ventas JOIN gafas ON ventas.id_gafas = gafas.id_gafas JOIN proveedor ON gafas.id_proveedor = proveedor.id_proveedor;