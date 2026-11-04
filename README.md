# 🏢 SISMATEC - Sistema de Gestión Integral

Sistema web desarrollado bajo arquitectura de 3 capas para la gestión de ventas, inventario y servicio técnico.

## 👥 Equipo de Desarrollo
*   **Yesenia Escobar** (Bd - Frontend) - Rama: `feature/frontend`
*   **Alan Alarcón** (Backend - Auth y BD) - Rama: `feature/backend-auth`
*   **Mauricio Cuadros** (Backend - Ventas) - Rama: `feature/backend-ventas`
*   **Josué Tarqui** (Backend - Servicios) - Rama: `feature/backend-servicios`

---

## 🚀 Guía de Inicio Rápido para el Equipo

Sigan estos pasos exactos para configurar el proyecto en sus computadoras:

**Paso 1: Clonar el repositorio.** Abran su terminal y peguen esto: `git clone https://github.com/TerezaEscobar/sismatec-sistema.git` y luego `cd sismatec-sistema`.

**Paso 2: Moverse a su rama de trabajo.** Cada uno debe trabajar en su rama. Ejecuten el comando según su nombre: Alan usa `git checkout feature/backend-auth`, Mauricio usa `git checkout feature/backend-ventas`, Josué usa `git checkout feature/backend-servicios`, y Tereza (Líder) usa `git checkout feature/frontend`.

**Paso 3: Configurar el Backend (Node.js).** Entren a la carpeta del backend con `cd backend` e instalen las dependencias con `npm install`. 

⚠️ **IMPORTANTE: Crear el archivo .env.** Dentro de la carpeta `backend`, creen un archivo llamado `.env` (con el punto al inicio) y peguen estas líneas cambiando la contraseña por la de su propio PostgreSQL: `PORT=3000`, `DB_USER=postgres`, `DB_PASSWORD=SU_CONTRASEÑA_AQUI`, `DB_HOST=localhost`, `DB_PORT=5432`, `DB_NAME=sismatec_db`. (Nota: Este archivo NO se sube a GitHub por seguridad, cada uno debe tener el suyo).

**Paso 4: Configurar la Base de Datos (PostgreSQL).** Si no tienen la base de datos creada en su computadora, abran pgAdmin y creen una base de datos llamada `sismatec_db`. Luego abran una Query Tool sobre esa base de datos y copien y ejecuten el contenido de los archivos en orden: `database/01_schema.sql` (Crea las tablas), `database/02_roles.sql` (Crea los roles), `database/03_triggers.sql` (Crea los triggers) y `database/04_datos_prueba.sql` (Inserta los datos de prueba).

**Paso 5: Encender el servidor Backend.** Desde la carpeta `backend`, ejecuten `node index.js`. Si todo está bien, verán el mensaje: ✅ Conectado exitosamente a la base de datos SISMATEC.

**Paso 6: Configurar el Frontend (React) - Próximamente.** (Esta sección la actualizaré cuando empecemos a programar el React).

---

## 📌 Reglas del Equipo
1. **No trabajar en la rama `main`**. Cada uno en su rama asignada.
2. Hacer `git pull` de la rama `main` antes de empezar a programar (para tener los últimos cambios).
3. Hacer `git push` a su propia rama cuando terminen una tarea.
4. No subir la carpeta `node_modules` ni el archivo `.env`.

---
*Desarrollado por el equipo de SISMATEC.*
