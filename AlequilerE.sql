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

CREATE TABLE IF NOT EXISTS ESTADO_VIVIENDA(
    CODESTVIV INT,
    DESCESTVIV VARCHAR(50),
    CONSTRAINT CODESTVIV_PK PRIMARY KEY (CODESTVIV)
);

CREATE TABLE IF NOT EXISTS TIPO_VIVIENDA(
    CODTIPVIV INT,
    DESCTIPVIV VARCHAR(50),
    CONSTRAINT CODTIPVIV_PK PRIMARY KEY (CODTIPVIV)
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

CREATE TABLE IF NOT EXISTS ALQUILER(
    CODALQ INT,
    FECINCALQ DATE,
    PERSONA_PROP INT,
    PERSONA_INQ INT,
    CONSTRAINT CODALQ_PK PRIMARY KEY (CODALQ)
);

CREATE TABLE IF NOT EXISTS DETALLE_ALQUILER(
    CODDETALQ INT,
    VIVIENDA_CODVIV INT,
    FECINICDETALQ DATE,
    COSTDETALQ DECIMAL (8,2),
    ALQUILER_CODALQ INT,
    CONSTRAINT CODDETALQ_PK PRIMARY KEY (CODDETALQ)
);

/*Relacion / la tabla persona - ubigeo*/
ALTER TABLE PERSONA
    ADD CONSTRAINT UBIGEO_FK FOREIGN KEY (UBIGEO_CODUBI)
    REFERENCES UBIGEO(CODUBI);

/* Relacionar / la tabla Vivienda - ubogeo */
alter table VIVIENDA
    add constraint UBIGEO_viv_fk FOREIGN key (ubigeo_codubi)
    REFERENCES ubigeo(CODUBI);