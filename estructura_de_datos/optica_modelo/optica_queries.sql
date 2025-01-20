SELECT COUNT(*) FROM venta WHERE id_cliente = 1;
SELECT * FROM gafas JOIN venta ON gafas.id = venta.id_gafas WHERE venta.id_empleado = 2 AND ventas.fecha LIKE '%2024%';
SELECT DISTINCT proveedor.nombre FROM venta JOIN gafas ON venta.id_gafas = gafas.id JOIN proveedor ON gafas.id_proveedor = proveedor.id;