# Usa la imagen oficial de PostgreSQL
FROM postgres:16

# Establece las variables de entorno
ENV POSTGRES_USER=miusuario
ENV POSTGRES_PASSWORD=2304
ENV POSTGRES_DB=auth_db

# Copia el script de inicialización a la carpeta que PostgreSQL usará al inicio
COPY init.sql /docker-entrypoint-initdb.d/

# Expone el puerto 5432
EXPOSE 5432


