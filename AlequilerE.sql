create database dbAlquiler CHAR set utf8;
use dbAlquiler;
describe ubigeo;
select * from ubigeo;
insert into ubigeo (codubi, distubi, provubi, dptoiubi)
	values ('140307','San Vicente de Cañete','Cañete','Lima'),
    ('140402','Calango','Cañete','Lima'),
    ('140403','Cerro Azul','Cañete','Lima'),
    ('140404','Coayllo','Cañete','Lima'),
    ('140405','Chilca','Cañete','Lima'),
    ('140406','Imperial','Cañete','Lima'),
    ('140407','Lunahuaná','Cañete','Lima'),
    ('140408','Mala','Cañete','Lima'),
    ('140409','Nuevo Imperial','Cañete','Lima'),
    ('140410','Pacarán','Cañete','Lima');
 
 describe estado_vivienda;
 select * from estado_vivienda;
insert into estado_vivienda (codestviv, descestviv) values (1,'Muy bueno'), (2,'Excelente'), (3,'Bueno'), (4,'Remodelado'), (5,'A Remodelar');

describe tipo_vivienda;
select * from tipo_vivienda;
insert into tipo_vivienda (codtipviv, desctipviv) values 
	(1,'Casa'),
    (2,'Casa de Playa'),
    (3,'Condominio'),
    (4,'Casa de Campo'),
    (5,'Casa de Playa en Condominio');
    
describe persona;

insert into persona (codper,nomper,apepatper,apematper,dniper,dirper,ubigeo_codubi,telef1per,telef2per,sexoper,tipoper,usuper,passper)
	values (1,'Martín Alexis','Samán','Arata','72720455','Urb. Valle Hermoso Mz. D Lt 21', '140406','974091056','-','M','P','admin','admin'),
    (2,'Alberto','Campos','Barrios','89456123','Av. Los Manzanales 123', '140405','987654321','123456789','M','P','admin','admin');