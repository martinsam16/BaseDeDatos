USE iVentas;
INSERT INTO PERSONA 
    (NOMPER, APEPER, DOCPER, TLFPER, TIPPER, DISTRITO_CODDIS_DISPER, DIRPER, USRLOGPER, PSWLOGPER, ESTLOGPER) 
    VALUES 
    ('MARTIN ALEXIS','SAMAN ARATA','72720455','+51974091056','A',15,'Urb. Valle Hermoso MzD Lt21','admin','admin','A'),
    ('MARIA DEL ROSARIO','DELGADO REVATTA','87654321','+51','V',15,'De Narnia :v','vendedor','vendedor','A'),
    ('KOWALSKI','GUARANA','12345678','+51999999999','I',16,'Muy muy lejano','inventariador','inventariador','A'),
    ('LENOVO LENEVO','LA MANO','88887876','+51999999999','C',14,'Dimelo','','','I'),
    ('EPSON COMPANY','','12345678912','+51123456789','E',12,'NOC','','','I');

SELECT * FROM PERSONA;

INSERT INTO CATEGORIA (NOMCAT)
    VALUES 
    ('CELULAR'),
    ('TELEVISOR'),
    ('REFRIGERADORAS');

INSERT INTO MARCA 
    (NOMMAR) 
    VALUES 
    ('HP'),
    ('TOSHIBA'),
    ('SONY'),
    ('APPLE');

INSERT INTO MODELO 
    (NOMMOD, MARCA_CODMAR_MARMOD) 
        VALUES 
        ('V200',1),
        ('XS2019',4);

INSERT INTO PRODUCTO 
    (NOMPRO, MODELO_CODMOD_MODPRO, SERPRO, PREPRO, URLIMGPRO, ATRIBPRO, ESTPRO, FECGARPRO, PERSONA_CODPER_PROVPRO,CATEGORIA_CODCAT_CATPRO) 
    VALUES 
    ('CELULAR',1,'xxx-xxx-xxx',20.2,'https://media.aws.alkosto.com/media/catalog/product/cache/6/image/660x441/69ace863370f34bdf190e4e164b6e123/f/o/fotos_equipos_j6_frente_1.jpg','JSON','A',"2018-12-12",5,1),
    ('IPHONE XS',2,'yyy-yyy-yyy',2000.99,'https://i.gadgets360cdn.com/products/large/1536782640_635_iphone_xs.jpg','Pantalla: AMOLED','A',"2019-12-12",5,1);





