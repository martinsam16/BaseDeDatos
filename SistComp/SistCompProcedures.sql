USE SISTCOMP;
/*DROP PROCEDURE ACCION;*/
CREATE PROCEDURE PROLOG(
    IN _DNIPER CHAR(8),
    IN _USRLOG varchar(30),
    IN _PSWLOG varchar(10)
)
BEGIN
    IF EXISTS(SELECT * FROM LOGIN WHERE CODLOG = DEVCODLOG(_DNIPER)) THEN
        UPDATE LOGIN 
            SET USRLOG = _USRLOG, 
            PSWLOG = _PSWLOG 
        WHERE CODLOG = DEVCODLOG(_DNIPER);

    ELSE
        INSERT INTO LOGIN (PERSONA_CODPER, USRLOG, PSWLOG, ESTLOG)
            VALUES (DEVCODPER(_DNIPER), _USRLOG, _PSWLOG, 'A');
    END IF;
END;

CREATE PROCEDURE ACCIONPERSONA(
    IN _NOMPER VARCHAR(100),
    IN _APEPER VARCHAR(100),
    IN _DNIPER CHAR(8),
    IN _TLFPER CHAR(12),
    IN _TIPPER CHAR(1),
    IN TIPAC CHAR(2)
)
BEGIN
    CASE TIPAC
    
    WHEN 'RE' THEN
        IF NOT EXISTS(SELECT * FROM PERSONA WHERE DNIPER = _DNIPER) THEN 

            INSERT INTO PERSONA (NOMPER, APEPER, DNIPER, TLFPER, TIPPER)
                VALUES (_NOMPER, _APEPER, _DNIPER, _TLFPER, _TIPPER);

            IF NOT (_TIPPER = 'C') THEN
                INSERT INTO LOGIN (PERSONA_CODPER, USRLOG, PSWLOG, ESTLOG)
                    VALUES (DEVCODPER(_DNIPER), 
                        LOWER(CONCAT( SUBSTRING(_NOMPER,1,2), SUBSTRING(_APEPER,1,2), SUBSTRING(_DNIPER,1,2) )), 
                        LOWER(CONCAT('@',_DNIPER)),
                        'A');/*Recordar hacer algoritmo de cifrado y descifrado para la contaseña xd*/
            END IF;
        END IF;

    WHEN 'ED' THEN

        UPDATE PERSONA 
            SET NOMPER = _NOMPER, 
                APEPER = _APEPER, 
                TLFPER = _TLFPER, 
                TIPPER = _TIPPER
            WHERE DNIPER = _DNIPER;

        IF EXISTS(SELECT * FROM LOGIN WHERE CODLOG = DEVCODLOG(_DNIPER)) THEN
            IF _TIPPER = 'C' THEN
                UPDATE LOGIN 
                    SET ESTLOG ='I' 
                    WHERE CODLOG = DEVCODLOG(_DNIPER);
            ELSE
                UPDATE LOGIN 
                    SET ESTLOG = 'A' 
                    WHERE CODLOG = DEVCODLOG(_DNIPER);
            END IF;
            /*ELSE THEN*/

        END IF;

    WHEN 'EL' THEN
        DELETE FROM LOGIN 
            WHERE PERSONA.PERSONA_CODPER = DEVCODLOG(_DNIPER);

        DELETE FROM PERSONA 
            WHERE PERSONA.DNIPER = _DNIPER;


    END CASE;

END;


CREATE PROCEDURE ACCIONPRODUCTO(
    IN _CODPRO int,
    IN _NOMPRO varchar(200),
    IN _MODELO_CODMOD int,
    IN _SERPRO varchar(100) ,
    IN _PREPRO double(8,2),
    IN _URLIMGPRO varchar(300),
    IN TIPAC CHAR(2)
)
BEGIN
    CASE TIPAC

    WHEN 'RE' THEN
        IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE SERPRO = _SERPRO) THEN
            INSERT INTO PRODUCTO 
                (NOMPRO, MODELO_CODMOD, SERPRO, PREPRO, URLIMGPRO) 
                VALUES (_NOMPRO, _MODELO_CODMOD, _SERPRO, _PREPRO, _URLIMGPRO);
    
    WHEN 'ED' THEN
        UPDATE PRODUCTO 
            SET NOMPRO = _NOMPRO,
                MODELO_CODMOD = _MODELO_CODMOD,
                SERPRO = _SERPRO,
                PREPRO = _PREPRO,
                URLIMGPRO = _URLIMGPRO
            WHERE PRODUCTO.SERPRO = _SERPRO;
    
    WHEN 'EL' THEN
        DELETE FROM PRODUCTO
            WHERE PRODUCTO.CODPRO = _CODPRO;
    

END;