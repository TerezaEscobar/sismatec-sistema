-- ==========================================
-- DATOS DE PRUEBA (SEEDERS) - SISMATEC
-- ==========================================

-- 1. Roles
INSERT INTO ROL (nombre, descripcion) VALUES
('ADMINISTRADOR', 'Gestiona usuarios y seguridad'),
('GERENTE', 'Supervisa el negocio y reportes'),
('VENDEDOR', 'Atiende mostrador y registra ventas'),
('TECNICO', 'Diagnostica y repara equipos'),
('ALMACEN', 'Controla inventario y compras');

-- 2. Empleados
INSERT INTO EMPLEADO (ci, nombres, apellidos, cargo, telefono, fecha_ingreso) VALUES
('1001', 'Rolando', 'Quispe', 'Gerente General', '70159797', '2020-01-15'),
('1002', 'Ana', 'Gomez', 'Vendedora', '77777777', '2022-05-10'),
('1003', 'Carlos', 'Tecnico', 'Técnico de Soporte', '66666666', '2021-08-20'),
('1004', 'Maria', 'Lopez', 'Encargada de Almacén', '55555555', '2023-02-01'),
('1005', 'Pedro', 'Mamani', 'Vendedor', '71111111', '2023-06-15');

-- 3. Usuarios
INSERT INTO USUARIO (nombre_usuario, contrasena_hash, id_rol, id_empleado) VALUES
('admin', 'hash_falso_123', 1, 1),
('gerente', 'hash_falso_123', 2, 4),
('vendedor1', 'hash_falso_123', 3, 2),
('vendedor2', 'hash_falso_123', 3, 5),
('tecnico1', 'hash_falso_123', 4, 3);

-- 4. Categorías, Marcas y Formas de Pago
INSERT INTO CATEGORIA (nombre) VALUES ('Laptops'), ('Componentes'), ('Impresoras'), ('Periféricos'), ('Accesorios');
INSERT INTO MARCA (nombre) VALUES ('HP'), ('Lenovo'), ('Epson'), ('Dell'), ('Logitech'), ('Kingston');
INSERT INTO FORMA_PAGO (nombre) VALUES ('Efectivo'), ('QR'), ('Transferencia'), ('Tarjeta de Crédito');

-- 5. Productos (35 en total)
INSERT INTO PRODUCTO (codigo, nombre, descripcion, precio_compra, precio_venta, stock_actual, stock_minimo, id_categoria, id_marca) VALUES
('PROD-001', 'Laptop HP Pavilion 15', 'i5, 8GB RAM, 512GB SSD', 2500.00, 3200.00, 8, 2, 1, 1),
('PROD-002', 'Laptop Lenovo ThinkPad', 'i7, 16GB RAM, 1TB SSD', 4000.00, 5200.00, 5, 1, 1, 2),
('PROD-003', 'Memoria RAM Kingston 8GB', 'DDR4 2666MHz', 150.00, 250.00, 40, 10, 2, 6),
('PROD-004', 'Impresora Epson L3250', 'Multifuncional WiFi', 800.00, 1100.00, 3, 1, 3, 3),
('PROD-005', 'Mouse Logitech Inalámbrico', 'Mouse óptico USB', 30.00, 60.00, 100, 20, 4, 5),
('PROD-006', 'Teclado Logitech K120', 'Teclado USB estándar', 40.00, 75.00, 80, 15, 4, 5),
('PROD-007', 'Monitor Dell 24"', 'Full HD, HDMI', 700.00, 950.00, 10, 3, 4, 4),
('PROD-008', 'Disco SSD Kingston 240GB', 'SATA III', 120.00, 200.00, 30, 5, 2, 6),
('PROD-009', 'Laptop HP EliteBook', 'i7, 16GB RAM, 512GB SSD', 3500.00, 4800.00, 2, 1, 1, 1),
('PROD-010', 'Impresora Epson L555', 'Sistema continuo', 900.00, 1300.00, 2, 1, 3, 3),
('PROD-011', 'Audífonos Logitech G332', 'Gaming, con micrófono', 80.00, 150.00, 25, 5, 5, 5),
('PROD-012', 'Memoria RAM Kingston 16GB', 'DDR4 3200MHz', 300.00, 450.00, 15, 5, 2, 6),
('PROD-013', 'Teclado Mecánico Redragon', 'RGB, switches azules', 150.00, 280.00, 12, 3, 4, 5),
('PROD-014', 'Laptop Dell Inspiron', 'i5, 8GB RAM', 2800.00, 3600.00, 6, 2, 1, 4),
('PROD-015', 'Mousepad Gamer', 'Grande, antideslizante', 20.00, 45.00, 50, 10, 5, 5),
('PROD-016', 'Laptop Asus VivoBook', 'Ryzen 5, 8GB RAM', 2200.00, 2900.00, 10, 2, 1, 1),
('PROD-017', 'Laptop Acer Aspire', 'i3, 4GB RAM', 1800.00, 2500.00, 8, 2, 1, 2),
('PROD-018', 'Monitor LG 27"', 'IPS, 75Hz', 850.00, 1200.00, 6, 2, 4, 4),
('PROD-019', 'Teclado Mecánico HyperX', 'Switch Red', 250.00, 400.00, 15, 5, 4, 5),
('PROD-020', 'Mouse Razer DeathAdder', 'Gaming 6400 DPI', 120.00, 200.00, 20, 5, 4, 5),
('PROD-021', 'Impresora Canon G3160', 'Multifuncional', 750.00, 1050.00, 5, 2, 3, 3),
('PROD-022', 'Memoria RAM Corsair 8GB', 'DDR4 3000MHz', 180.00, 280.00, 30, 10, 2, 6),
('PROD-023', 'Disco HDD Seagate 1TB', 'SATA 7200RPM', 200.00, 320.00, 25, 5, 2, 6),
('PROD-024', 'Laptop MSI GF63', 'i7, GTX 1650', 3800.00, 4900.00, 4, 1, 1, 1),
('PROD-025', 'Webcam Logitech C920', 'Full HD', 250.00, 400.00, 12, 3, 4, 5),
('PROD-026', 'Laptop HP ProBook', 'i5, 16GB RAM', 3000.00, 4200.00, 7, 2, 1, 1),
('PROD-027', 'Audífonos Sony WH-CH510', 'Bluetooth', 200.00, 350.00, 18, 5, 5, 5),
('PROD-028', 'Tablet Samsung Galaxy Tab', '64GB', 900.00, 1300.00, 9, 2, 1, 2),
('PROD-029', 'Proyector Epson PowerLite', '3000 Lúmenes', 1500.00, 2200.00, 3, 1, 3, 3),
('PROD-030', 'Router TP-Link Archer', 'Dual Band', 150.00, 250.00, 20, 5, 2, 6),
('PROD-031', 'Disco SSD Samsung 500GB', 'NVMe', 250.00, 400.00, 15, 5, 2, 6),
('PROD-032', 'Laptop Lenovo IdeaPad', 'Ryzen 3, 8GB RAM', 2000.00, 2800.00, 10, 2, 1, 2),
('PROD-033', 'Monitor Samsung 24"', 'Curvo', 600.00, 900.00, 8, 2, 4, 4),
('PROD-034', 'Teclado Apple Magic', 'Inalámbrico', 400.00, 600.00, 5, 1, 4, 5),
('PROD-035', 'Mouse Microsoft Surface', 'Ergonómico', 180.00, 300.00, 12, 3, 4, 5);

-- 6. Servicios
INSERT INTO SERVICIO (nombre, descripcion, precio_base) VALUES
('Formateo', 'Instalación de SO y programas básicos', 50.00),
('Mantenimiento Preventivo', 'Limpieza interna y cambio de pasta térmica', 80.00),
('Cambio de Pantalla', 'Reemplazo de pantalla LCD/LED', 300.00),
('Reparación de Placa', 'Reparación a nivel de componentes', 500.00),
('Instalación de Software', 'Instalación de programas específicos', 40.00);

-- 7. Clientes (25)
INSERT INTO CLIENTE (ci_nit, nombre_razon_social, telefono, correo, direccion) VALUES
('99887766', 'Juan Perez', '71234567', 'juan@gmail.com', 'Av. Arce #123'),
('55443322', 'Empresa XYZ', '33445566', 'contacto@xyz.com', 'Zona Sur, Calacoto'),
('11223344', 'Maria Fernandez', '76543210', 'maria@hotmail.com', 'Sopocachi'),
('66778899', 'Taller Mecánico El Rápido', '22334455', 'taller@rapido.com', 'El Alto'),
('44556677', 'Luis Choque', '70001122', 'luis.choque@gmail.com', 'Miraflores'),
('11111111', 'Pedro Picapiedra', '70000001', 'pedro@mail.com', 'Zona Norte'),
('22222222', 'Pablo Marmol', '70000002', 'pablo@mail.com', 'Zona Sur'),
('33333333', 'Supermercado Dino', '22334400', 'compras@dino.com', 'Av. Busch'),
('44444444', 'Restaurante El Fogón', '22334401', 'admin@fogon.com', 'Sopocachi'),
('55555555', 'Carlos Slim', '70000005', 'carlos@mail.com', 'Miraflores'),
('66666666', 'Bill Gates', '70000006', 'bill@mail.com', 'San Miguel'),
('77777777', 'Steve Jobs', '70000007', 'steve@mail.com', 'Calacoto'),
('88888888', 'Elon Musk', '70000008', 'elon@mail.com', 'Achumani'),
('99999999', 'Mark Zuckerberg', '70000009', 'mark@mail.com', 'Obrajes'),
('10101010', 'Jeff Bezos', '70000010', 'jeff@mail.com', 'Cota Cota'),
('12121212', 'Luis Arce', '70000011', 'luis@mail.com', 'Centro'),
('13131313', 'Evo Morales', '70000012', 'evo@mail.com', 'El Alto'),
('14141414', 'Jeanine Añez', '70000013', 'jeanine@mail.com', 'Zona Sur'),
('15151515', 'Carlos Mesa', '70000014', 'carlos.m@mail.com', 'Sopocachi'),
('16161616', 'Farmacia San Juan', '22334402', 'farmacia@mail.com', 'Miraflores'),
('17171717', 'Tienda Don Pepe', '22334403', 'pepe@mail.com', 'Zona Central'),
('18181818', 'Taller Los Amigos', '22334404', 'amigos@mail.com', 'El Alto'),
('19191919', 'Clinica Dental Sonrisa', '22334405', 'dental@mail.com', 'Calacoto'),
('20202020', 'María Auxiliadora', '70000020', 'maria.a@mail.com', 'Sopocachi'),
('21212121', 'José María', '70000021', 'jose.m@mail.com', 'Miraflores');

-- 8. Ventas (30)
INSERT INTO VENTA (fecha, total, estado, id_cliente, id_usuario, id_forma_pago) VALUES
('2023-11-20 10:00:00', 3200.00, 'Completada', 6, 3, 1),
('2023-11-20 11:30:00', 250.00, 'Completada', 7, 4, 2),
('2023-11-20 14:00:00', 1100.00, 'Completada', 8, 3, 1),
('2023-11-21 09:00:00', 5200.00, 'Completada', 9, 4, 3),
('2023-11-21 10:15:00', 60.00, 'Completada', 10, 3, 1),
('2023-11-21 16:00:00', 950.00, 'Completada', 11, 4, 4),
('2023-11-22 08:30:00', 200.00, 'Completada', 12, 3, 1),
('2023-11-22 12:00:00', 4800.00, 'Completada', 13, 4, 2),
('2023-11-22 15:45:00', 2800.00, 'Completada', 14, 3, 1),
('2023-11-23 09:15:00', 1300.00, 'Completada', 15, 4, 3),
('2023-11-23 11:00:00', 150.00, 'Completada', 16, 3, 1),
('2023-11-23 14:30:00', 300.00, 'Completada', 17, 4, 2),
('2023-11-24 10:00:00', 450.00, 'Completada', 18, 3, 1),
('2023-11-24 16:15:00', 900.00, 'Completada', 19, 4, 4),
('2023-11-25 09:00:00', 2200.00, 'Completada', 20, 3, 3),
('2023-11-25 11:30:00', 320.00, 'Completada', 21, 4, 1),
('2023-11-25 15:00:00', 400.00, 'Completada', 22, 3, 2),
('2023-11-26 10:00:00', 600.00, 'Completada', 23, 4, 4),
('2023-11-26 12:00:00', 1200.00, 'Completada', 24, 3, 1),
('2023-11-26 17:00:00', 4000.00, 'Completada', 1, 4, 3),
('2023-11-27 09:30:00', 250.00, 'Completada', 2, 3, 1),
('2023-11-27 14:00:00', 2800.00, 'Completada', 3, 4, 2),
('2023-11-28 10:00:00', 350.00, 'Completada', 4, 3, 1),
('2023-11-28 16:00:00', 1050.00, 'Completada', 5, 4, 4),
('2023-11-29 09:00:00', 2200.00, 'Completada', 6, 3, 1),
('2023-11-29 11:00:00', 400.00, 'Completada', 7, 4, 2),
('2023-11-29 15:00:00', 1300.00, 'Completada', 8, 3, 3),
('2023-11-30 10:00:00', 600.00, 'Completada', 9, 4, 1),
('2023-11-30 12:00:00', 3200.00, 'Completada', 10, 3, 4),
('2023-11-30 17:00:00', 250.00, 'Completada', 11, 4, 1);

-- 9. Detalles de Venta (30)
INSERT INTO DETALLE_VENTA (id_venta, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 3200.00), (2, 3, 1, 250.00), (3, 4, 1, 1100.00),
(4, 2, 1, 5200.00), (5, 5, 1, 60.00), (6, 7, 1, 950.00),
(7, 8, 1, 200.00), (8, 9, 1, 4800.00), (9, 14, 1, 2800.00),
(10, 10, 1, 1300.00), (11, 11, 1, 150.00), (12, 12, 1, 300.00),
(13, 13, 1, 450.00), (14, 14, 1, 900.00), (15, 15, 1, 2200.00),
(16, 16, 1, 320.00), (17, 17, 1, 400.00), (18, 18, 1, 600.00),
(19, 19, 1, 1200.00), (20, 20, 1, 4000.00), (21, 21, 1, 250.00),
(22, 22, 1, 2800.00), (23, 23, 1, 350.00), (24, 24, 1, 1050.00),
(25, 25, 1, 2200.00), (26, 26, 1, 400.00), (27, 27, 1, 1300.00),
(28, 28, 1, 600.00), (29, 29, 1, 3200.00), (30, 30, 1, 250.00);