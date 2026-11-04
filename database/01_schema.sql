-- ==========================================
-- SCRIPT DE CREACIÓN DE TABLAS (SISMATEC)
-- ==========================================

-- 1. Tabla ROL
CREATE TABLE ROL (
    id_rol SERIAL PRIMARY KEY,
    nombre VARCHAR(30) UNIQUE NOT NULL,
    descripcion VARCHAR(100)
);

-- 2. Tabla EMPLEADO
CREATE TABLE EMPLEADO (
    id_empleado SERIAL PRIMARY KEY,
    ci VARCHAR(15) UNIQUE NOT NULL,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(60) NOT NULL,
    cargo VARCHAR(40) NOT NULL,
    telefono VARCHAR(15),
    fecha_ingreso DATE NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE
);

-- 3. Tabla USUARIO
CREATE TABLE USUARIO (
    id_usuario SERIAL PRIMARY KEY,
    nombre_usuario VARCHAR(30) UNIQUE NOT NULL,
    contrasena_hash VARCHAR(255) NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    id_rol INT NOT NULL,
    id_empleado INT UNIQUE NOT NULL,
    CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES ROL(id_rol),
    CONSTRAINT fk_usuario_empleado FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado)
);

-- 4. Tabla CLIENTE
CREATE TABLE CLIENTE (
    id_cliente SERIAL PRIMARY KEY,
    ci_nit VARCHAR(15) UNIQUE NOT NULL,
    nombre_razon_social VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(80),
    direccion VARCHAR(120)
);

-- 5. Tabla PROVEEDOR
CREATE TABLE PROVEEDOR (
    id_proveedor SERIAL PRIMARY KEY,
    nit VARCHAR(15) UNIQUE NOT NULL,
    razon_social VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(80),
    direccion VARCHAR(120)
);

-- 6. Tabla CATEGORIA
CREATE TABLE CATEGORIA (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(40) UNIQUE NOT NULL
);

-- 7. Tabla MARCA
CREATE TABLE MARCA (
    id_marca SERIAL PRIMARY KEY,
    nombre VARCHAR(40) UNIQUE NOT NULL
);

-- 8. Tabla PRODUCTO
CREATE TABLE PRODUCTO (
    id_producto SERIAL PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200),
    precio_compra NUMERIC(10,2) NOT NULL CHECK (precio_compra >= 0),
    precio_venta NUMERIC(10,2) NOT NULL CHECK (precio_venta >= 0),
    stock_actual INT NOT NULL DEFAULT 0 CHECK (stock_actual >= 0),
    stock_minimo INT NOT NULL DEFAULT 0 CHECK (stock_minimo >= 0),
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    id_marca INT NOT NULL,
    CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria),
    CONSTRAINT fk_producto_marca FOREIGN KEY (id_marca) REFERENCES MARCA(id_marca)
);

-- 9. Tabla FORMA_PAGO
CREATE TABLE FORMA_PAGO (
    id_forma_pago SERIAL PRIMARY KEY,
    nombre VARCHAR(30) UNIQUE NOT NULL
);

-- 10. Tabla COMPRA
CREATE TABLE COMPRA (
    id_compra SERIAL PRIMARY KEY,
    fecha TIMESTAMP NOT NULL DEFAULT now(),
    total NUMERIC(12,2) NOT NULL CHECK (total >= 0),
    id_proveedor INT NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT fk_compra_proveedor FOREIGN KEY (id_proveedor) REFERENCES PROVEEDOR(id_proveedor),
    CONSTRAINT fk_compra_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

-- 11. Tabla DETALLE_COMPRA (Tabla asociativa N:M)
CREATE TABLE DETALLE_COMPRA (
    id_compra INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(10,2) NOT NULL CHECK (precio_unitario >= 0),
    PRIMARY KEY (id_compra, id_producto),
    CONSTRAINT fk_detcompra_compra FOREIGN KEY (id_compra) REFERENCES COMPRA(id_compra),
    CONSTRAINT fk_detcompra_producto FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);

-- 12. Tabla VENTA
CREATE TABLE VENTA (
    id_venta SERIAL PRIMARY KEY,
    fecha TIMESTAMP NOT NULL DEFAULT now(),
    total NUMERIC(12,2) NOT NULL CHECK (total >= 0),
    estado VARCHAR(15) NOT NULL CHECK (estado IN ('Completada', 'Anulada')) DEFAULT 'Completada',
    id_cliente INT NOT NULL,
    id_usuario INT NOT NULL,
    id_forma_pago INT NOT NULL,
    CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    CONSTRAINT fk_venta_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    CONSTRAINT fk_venta_formapago FOREIGN KEY (id_forma_pago) REFERENCES FORMA_PAGO(id_forma_pago)
);

-- 13. Tabla DETALLE_VENTA (Tabla asociativa N:M)
CREATE TABLE DETALLE_VENTA (
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(10,2) NOT NULL CHECK (precio_unitario >= 0),
    PRIMARY KEY (id_venta, id_producto),
    CONSTRAINT fk_detventa_venta FOREIGN KEY (id_venta) REFERENCES VENTA(id_venta),
    CONSTRAINT fk_detventa_producto FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);

-- 14. Tabla EQUIPO_CLIENTE
CREATE TABLE EQUIPO_CLIENTE (
    id_equipo SERIAL PRIMARY KEY,
    tipo VARCHAR(30) NOT NULL,
    marca VARCHAR(40),
    modelo VARCHAR(50),
    nro_serie VARCHAR(50),
    id_cliente INT NOT NULL,
    CONSTRAINT fk_equipo_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

-- 15. Tabla SERVICIO
CREATE TABLE SERVICIO (
    id_servicio SERIAL PRIMARY KEY,
    nombre VARCHAR(80) UNIQUE NOT NULL,
    descripcion VARCHAR(200),
    precio_base NUMERIC(10,2) CHECK (precio_base >= 0)
);

-- 16. Tabla ORDEN_SERVICIO
CREATE TABLE ORDEN_SERVICIO (
    id_orden SERIAL PRIMARY KEY,
    fecha_ingreso TIMESTAMP NOT NULL DEFAULT now(),
    falla_reportada VARCHAR(300) NOT NULL,
    diagnostico VARCHAR(300),
    estado VARCHAR(20) NOT NULL DEFAULT 'Recibido' CHECK (estado IN ('Recibido', 'En diagnóstico', 'En reparación', 'Listo', 'Entregado', 'Cancelado')),
    adelanto NUMERIC(10,2) DEFAULT 0 CHECK (adelanto >= 0),
    total NUMERIC(10,2) DEFAULT 0 CHECK (total >= 0),
    garantia_dias INT DEFAULT 0 CHECK (garantia_dias >= 0),
    fecha_entrega TIMESTAMP,
    id_equipo INT NOT NULL,
    id_tecnico INT NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT fk_orden_equipo FOREIGN KEY (id_equipo) REFERENCES EQUIPO_CLIENTE(id_equipo),
    CONSTRAINT fk_orden_tecnico FOREIGN KEY (id_tecnico) REFERENCES EMPLEADO(id_empleado),
    CONSTRAINT fk_orden_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

-- 17. Tabla DETALLE_SERVICIO (Tabla asociativa N:M)
CREATE TABLE DETALLE_SERVICIO (
    id_orden INT NOT NULL,
    id_servicio INT NOT NULL,
    precio NUMERIC(10,2) NOT NULL CHECK (precio >= 0),
    PRIMARY KEY (id_orden, id_servicio),
    CONSTRAINT fk_detservicio_orden FOREIGN KEY (id_orden) REFERENCES ORDEN_SERVICIO(id_orden),
    CONSTRAINT fk_detservicio_servicio FOREIGN KEY (id_servicio) REFERENCES SERVICIO(id_servicio)
);

-- 18. Tabla REPUESTO_USADO (Tabla asociativa N:M)
CREATE TABLE REPUESTO_USADO (
    id_orden INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(10,2) NOT NULL CHECK (precio_unitario >= 0),
    PRIMARY KEY (id_orden, id_producto),
    CONSTRAINT fk_repuesto_orden FOREIGN KEY (id_orden) REFERENCES ORDEN_SERVICIO(id_orden),
    CONSTRAINT fk_repuesto_producto FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);

-- 19. Tabla BITACORA
CREATE TABLE BITACORA (
    id_bitacora BIGSERIAL PRIMARY KEY,
    fecha_hora TIMESTAMP NOT NULL DEFAULT now(),
    accion VARCHAR(30) NOT NULL,
    tabla_afectada VARCHAR(40) NOT NULL,
    detalle VARCHAR(300),
    id_usuario INT,
    CONSTRAINT fk_bitacora_usuario FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);