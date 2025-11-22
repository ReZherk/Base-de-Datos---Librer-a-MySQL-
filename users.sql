-- Usuario 1: Administrador (permisos completos)
CREATE USER IF NOT EXISTS 'admin_libreria' @'localhost' IDENTIFIED BY 'Admin123!';

GRANT ALL PRIVILEGES ON libreria_db.* TO 'admin_libreria' @'localhost';

-- Usuario 2: Vendedor (permisos limitados)
CREATE USER IF NOT EXISTS 'vendedor_libreria' @'localhost' IDENTIFIED BY 'Vend123!';

GRANT
SELECT,
INSERT
    ON libreria_db.ventas TO 'vendedor_libreria' @'localhost';

GRANT
SELECT,
INSERT
    ON libreria_db.detalle_venta TO 'vendedor_libreria' @'localhost';

GRANT
SELECT ON libreria_db.libros TO 'vendedor_libreria' @'localhost';

GRANT
SELECT ON libreria_db.clientes TO 'vendedor_libreria' @'localhost';

GRANT EXECUTE ON PROCEDURE libreria_db.sp_registrar_venta 
TO 'vendedor_libreria'@'localhost';

GRANT
EXECUTE ON FUNCTION libreria_db.calcular_total_venta TO 'vendedor_libreria' @'localhost';

FLUSH PRIVILEGES;