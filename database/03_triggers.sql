-- ==========================================
-- TRIGGERS Y FUNCIONES (PL/pgSQL)
-- ==========================================

-- 1. Función para actualizar el stock al vender o comprar
CREATE OR REPLACE FUNCTION actualizar_stock()
RETURNS TRIGGER AS $$
BEGIN
    -- Si es una VENTA (DETALLE_VENTA), restamos stock
    IF (TG_TABLE_NAME = 'detalle_venta') THEN
        UPDATE PRODUCTO 
        SET stock_actual = stock_actual - NEW.cantidad
        WHERE id_producto = NEW.id_producto;
    
    -- Si es una COMPRA (DETALLE_COMPRA), sumamos stock
    ELSIF (TG_TABLE_NAME = 'detalle_compra') THEN
        UPDATE PRODUCTO 
        SET stock_actual = stock_actual + NEW.cantidad
        WHERE id_producto = NEW.id_producto;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. Crear los triggers que llaman a la función
CREATE TRIGGER trg_actualizar_stock_venta
AFTER INSERT ON DETALLE_VENTA
FOR EACH ROW EXECUTE FUNCTION actualizar_stock();

CREATE TRIGGER trg_actualizar_stock_compra
AFTER INSERT ON DETALLE_COMPRA
FOR EACH ROW EXECUTE FUNCTION actualizar_stock();

-- 3. Función para registrar en la Bitácora cuando se anula una venta
CREATE OR REPLACE FUNCTION registrar_bitacora_anulacion()
RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.estado = 'Anulada' AND OLD.estado != 'Anulada') THEN
        INSERT INTO BITACORA (accion, tabla_afectada, detalle, id_usuario)
        VALUES ('ANULACION', 'VENTA', 'Se anuló la venta #' || NEW.id_venta, NEW.id_usuario);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 4. Trigger que llama a la función de bitácora
CREATE TRIGGER trg_bitacora_venta_anulada
AFTER UPDATE ON VENTA
FOR EACH ROW EXECUTE FUNCTION registrar_bitacora_anulacion();