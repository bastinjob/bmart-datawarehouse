FROM postgres:latest

# Copy the initialization SQL script to the docker-entrypoint-initdb.d directory
COPY db/init.sql /docker-entrypoint-initdb.d/
