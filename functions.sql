-- Función 1: Calcular el total de una venta
DELIMITER $$

CREATE FUNCTION calcular_total_venta(p_venta_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10,2);
    
    SELECT SUM(dv.cantidad * l.precio)
    INTO v_total
    FROM detalle_venta dv
    INNER JOIN libros l ON dv.libro_id = l.libro_id
    WHERE dv.venta_id = p_venta_id;
    
    RETURN IFNULL(v_total, 0.00);
END$$

DELIMITER;

--Prueba la funcion
SELECT calcular_total_venta (1) AS total_venta_1;

-- Función 2: Obtener el stock total por autor
DELIMITER $$

CREATE FUNCTION stock_total_autor(p_autor_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_stock_total INT;
    
    SELECT SUM(stock)
    INTO v_stock_total
    FROM libros
    WHERE autor_id = p_autor_id;
    
    RETURN IFNULL(v_stock_total, 0);
END$$

DELIMITER;

--Prueba la funcion

SELECT
    autor_id,
    nombre,
    stock_total_autor (autor_id) AS stock_total
FROM autores;