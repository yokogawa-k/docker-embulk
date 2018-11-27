CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE ROLE digdag LOGIN PASSWORD 'digdag';
CREATE DATABASE digdagdb;
GRANT all privileges ON DATABASE digdagdb TO digdag;
