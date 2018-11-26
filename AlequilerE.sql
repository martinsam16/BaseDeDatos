/*show databases;*/
/*create database dbAlquiler char set utf-8;*/
use dbAlquiler;
/*Mostrar database en uso*/
select database();
/*Eliminar tabla*/
drop TABLE persona;
/*Mostrar tablas*/
show TABLES;
/*Verificar la estructura de una tabla*/
show columns in UBIGEO;
describe persona;
DESCRIBE VIVIENDA;

create TABLE if not exists UBIGEO(
    CODUBI CHAR(6),
    DISTUBI VARCHAR(100),
    PROVUBI VARCHAR(100),
    DPTOUBI VARCHAR(100),
    CONSTRAINT CODUBI_PK PRIMARY KEY (CODUBI)
);

CREATE TABLE IF NOT EXISTS VIVIENDA(
    CODVIV INT,
    DESCVIV VARCHAR(150),
    DIRVIV VARCHAR(150),
    UBIGEO_CODUBI CHAR (6),
    ESTADOVIVIENDA_CODDESTVIV INT,
    TIPVIV_CODTIPVIV INT,
    CONSTRAINT CODVIV_PK PRIMARY KEY (CODVIV)
);

create table if not exists persona(
    codper int auto_increment,
    nomper VARCHAR(100),
    apeper VARCHAR(100),
    dniper char(8),
    dirper VARCHAR(150),
    telef1per VARCHAR(9),
    telef2per VARCHAR(9),
    genper char(1),
    tipper CHAR(1),
    useper VARCHAR(50),
    passper VARCHAR(50),
    ubigeo_codubi char(6),
    CONSTRAINT codper_pk PRIMARY KEY (codper)
);
