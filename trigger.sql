CREATE TABLE IF NOT EXISTS auditoria_stock (
    auditoria_id INT AUTO_INCREMENT PRIMARY KEY,
    libro_id INT NOT NULL,
    titulo VARCHAR(150),
    stock_anterior INT,
    stock_nuevo INT,
    fecha_cambio DATETIME,
    usuario VARCHAR(100)
);

DELIMITER $$

CREATE TRIGGER tr_auditar_stock
AFTER UPDATE ON libros
FOR EACH ROW
BEGIN
    IF OLD.stock != NEW.stock THEN
        INSERT INTO auditoria_stock (
            libro_id,
            titulo,
            stock_anterior,
            stock_nuevo,
            fecha_cambio,
            usuario
        )
        VALUES (
            NEW.libro_id,
            NEW.titulo,
            OLD.stock,
            NEW.stock,
            NOW(),
            USER()
        );
    END IF;
END$$

DELIMITER;