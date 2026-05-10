# Usamos la imagen oficial de MariaDB para estabilidad profesional
FROM mariadb:10.5

# Variables de entorno para crear la base de datos automáticamente
ENV MYSQL_DATABASE=innovatech_db
ENV MYSQL_ROOT_PASSWORD=password123

# --- PUNTO CLAVE: Inicialización de Datos ---
# Copiamos tus scripts .sql a la carpeta especial de Docker.
# Todo lo que esté aquí se ejecutará automáticamente al iniciar el contenedor.
COPY *.sql /docker-entrypoint-initdb.d/

# Puerto estándar de comunicación para bases de datos SQL
EXPOSE 3306