# Usamos MariaDB 10.5 (ligera y compatible con el estándar del profe)
FROM mariadb:10.5

# Variables de entorno iniciales
ENV MYSQL_DATABASE=proyecto_db
ENV MYSQL_ROOT_PASSWORD=password123

# --- PUNTO CLAVE PARA LA NOTA ---
# Copiamos tus scripts .sql a la carpeta de inicialización automática.
# Docker ejecutará el '01_creacion_base_datos.sql' apenas inicie.
COPY *.sql /docker-entrypoint-initdb.d/

# Exponemos el puerto estándar SQL
EXPOSE 3306