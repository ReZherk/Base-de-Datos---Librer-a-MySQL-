CREATE VIEW vista_resumen_ventas AS
SELECT v.venta_id, v.fecha, c.nombre AS cliente, SUM(d.cantidad * l.precio) AS total_venta
FROM
    ventas v
    JOIN clientes c ON v.cliente_id = c.cliente_id
    JOIN detalle_venta d ON v.venta_id = d.venta_id
    JOIN libros l ON d.libro_id = l.libro_id
GROUP BY
    v.venta_id,
    v.fecha,
    c.nombre;

SELECT * FROM vista_resumen_ventas;