Bash
# =========================================================================
# BLOQUE I: CONFIGURACIÓN Y ARRANQUE DEL SERVIDOR BACKEND (NestJS + Postgres)
# =========================================================================

# 1. Navegar al directorio raíz del servidor API
cd server

# 2. Instalar el inventario de dependencias y paquetes de Node.js
npm install

# 3. Ejecutar los scripts físicos de migración para inicializar las tablas
npm run db:migrate

# 4. Iniciar el servidor en entorno de desarrollo
npm run start:dev

# =========================================================================
# BLOQUE II: CONFIGURACIÓN Y COMPILACIÓN DEL CLIENTE LIGERO (Flutter Mobile)
# =========================================================================

# 1. Navegar al directorio del cliente multiplataforma
cd client

# 2. Descargar los paquetes de arquitectura y dependencias de pubspec
flutter pub get

# 3. Ejecutar la limpieza de cachés y compilación interna de componentes
flutter clean
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Desplegar la aplicación en modo de depuración en un emulador activo
flutter run



