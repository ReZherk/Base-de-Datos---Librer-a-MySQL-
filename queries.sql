-- Libros por editorial
SELECT l.titulo, e.nombre AS editorial
FROM libros l
    JOIN editoriales e ON l.editorial_id = e.editorial_id
ORDER BY e.nombre, l.titulo;

-- Top 5 libros por stock
SELECT titulo, stock FROM libros ORDER BY stock DESC LIMIT 5;

-- Total vendido por cliente
SELECT c.nombre AS cliente, SUM(d.cantidad * l.precio) AS total_gastado
FROM
    clientes c
    JOIN ventas v ON c.cliente_id = v.cliente_id
    JOIN detalle_venta d ON v.venta_id = d.venta_id
    JOIN libros l ON d.libro_id = l.libro_id
GROUP BY
    c.nombre
ORDER BY total_gastado DESC;

-- Libros sin ventas
SELECT l.titulo
FROM libros l
    LEFT JOIN detalle_venta d ON l.libro_id = d.libro_id
WHERE
    d.libro_id IS NULL;