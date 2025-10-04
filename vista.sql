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

CREATE VIEW vista_libros_disponibles AS
SELECT l.libro_id, l.titulo, l.precio, l.stock, a.nombre AS autor, e.nombre AS editorial
FROM
    libros l
    INNER JOIN autores a ON l.autor_id = a.autor_id
    INNER JOIN editoriales e ON l.editorial_id = e.editorial_id
WHERE
    l.stock > 0;

SELECT * FROM vista_libros_disponibles;

--Para borrar la vista extra:
DROP VIEW IF EXISTS vista_libros_disponibles;