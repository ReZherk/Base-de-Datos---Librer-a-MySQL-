-- Procedimiento 1: Registrar una nueva venta
DELIMITER $$

CREATE PROCEDURE sp_registrar_venta(
    IN p_cliente_id INT,
    IN p_libro_id INT,
    IN p_cantidad INT,
    OUT p_venta_id INT,
    OUT p_mensaje VARCHAR(200)
)
BEGIN
    DECLARE v_stock_actual INT;
    DECLARE v_error VARCHAR(200);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_mensaje = 'Error al registrar la venta';
        SET p_venta_id = 0;
    END;
    
    START TRANSACTION;
    
    -- Verificar stock disponible
    SELECT stock INTO v_stock_actual
    FROM libros
    WHERE libro_id = p_libro_id;
    
    IF v_stock_actual >= p_cantidad THEN
        -- Crear la venta
        INSERT INTO ventas (fecha, cliente_id)
        VALUES (CURDATE(), p_cliente_id);
        
        SET p_venta_id = LAST_INSERT_ID();
        
        -- Registrar detalle de venta
        INSERT INTO detalle_venta (venta_id, libro_id, cantidad)
        VALUES (p_venta_id, p_libro_id, p_cantidad);
        
        -- Actualizar stock
        UPDATE libros
        SET stock = stock - p_cantidad
        WHERE libro_id = p_libro_id;
        
        SET p_mensaje = 'Venta registrada exitosamente';
        COMMIT;
    ELSE
        SET p_mensaje = CONCAT('Stock insuficiente. Disponible: ', v_stock_actual);
        SET p_venta_id = 0;
        ROLLBACK;
    END IF;
END$$

DELIMITER;

-- Procedimiento 2: Listar libros con bajo stock
DELIMITER $$

CREATE PROCEDURE sp_libros_bajo_stock(IN p_limite INT)
BEGIN
    SELECT 
        l.libro_id,
        l.titulo,
        l.stock,
        l.precio,
        a.nombre AS autor,
        e.nombre AS editorial
    FROM libros l
    INNER JOIN autores a ON l.autor_id = a.autor_id
    INNER JOIN editoriales e ON l.editorial_id = e.editorial_id
    WHERE l.stock <= p_limite
    ORDER BY l.stock ASC;
END$$

DELIMITER;