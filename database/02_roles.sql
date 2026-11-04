-- ==========================================
-- CREACIÓN DE ROLES Y PERMISOS (RBAC)
-- ==========================================

-- Crear roles de base de datos
CREATE ROLE rol_admin;
CREATE ROLE rol_gerente;
CREATE ROLE rol_vendedor;
CREATE ROLE rol_tecnico;
CREATE ROLE rol_almacen;

-- Dar permisos de conexión a todos
GRANT CONNECT ON DATABASE sismatec_db TO rol_admin, rol_gerente, rol_vendedor, rol_tecnico, rol_almacen;
GRANT USAGE ON SCHEMA public TO rol_admin, rol_gerente, rol_vendedor, rol_tecnico, rol_almacen;

-- Permisos específicos (Ejemplo para Vendedor)
GRANT SELECT, INSERT ON VENTA, DETALLE_VENTA TO rol_vendedor;
GRANT SELECT ON PRODUCTO, CLIENTE TO rol_vendedor;

-- (Puedes agregar aquí los permisos para los demás roles)