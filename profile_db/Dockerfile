
FROM postgres:16

ENV POSTGRES_USER=miusuario
ENV POSTGRES_PASSWORD=2304
ENV POSTGRES_DB=profile_db


COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432