USE iVentas;
/*DROP PROCEDURE ACCION;*/
CREATE PROCEDURE PROLOG(
    IN _DNIPER CHAR(8),
    IN _USRLOG varchar(30),
    IN _PSWLOG varchar(10)
)
BEGIN
    IF EXISTS(SELECT CODLOG FROM LOGIN WHERE CODLOG = DEVCODLOG(_DNIPER)) THEN
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
    IN _DISTRITO VARCHAR(50),
    IN _DIRPER VARCHAR(50),
    IN TIPAC CHAR(2)
)
BEGIN
    CASE TIPAC
        
        WHEN 'RE' THEN
            IF NOT EXISTS(SELECT DNIPER FROM PERSONA WHERE DNIPER = _DNIPER) THEN 

                INSERT INTO PERSONA (NOMPER, APEPER, DNIPER, TLFPER, TIPPER, DISTRITO_CODDIS, DIRPER)
                    VALUES (_NOMPER, _APEPER, _DNIPER, _TLFPER, _TIPPER, DEVCODDIS(_DISTRITO), _DIRPER);

                IF NOT (_TIPPER = 'C') THEN
                    INSERT INTO LOGIN (PERSONA_CODPER, USRLOG, PSWLOG, ESTLOG)
                        VALUES (DEVCODPER(_DNIPER), 
                            _DNIPER, 
                            LOWER(CONCAT('@',_DNIPER)),
                            'A');/*Recordar hacer algoritmo de cifrado y descifrado para la contaseña xd*/
                END IF;
            END IF;

        WHEN 'ED' THEN

            UPDATE PERSONA 
                SET NOMPER = _NOMPER, 
                    APEPER = _APEPER, 
                    TLFPER = _TLFPER, 
                    TIPPER = _TIPPER,
                    DISTRITO_CODDIS = DEVCODDIS(_DISTRITO),
                    DIRPER = _DIRPER
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
                WHERE LOGIN.PERSONA_CODPER = DEVCODLOG(_DNIPER);

            DELETE FROM PERSONA 
                WHERE PERSONA.DNIPER = _DNIPER;

    END CASE;
END;

CREATE PROCEDURE ACCIONMARCA(
    IN _NOMMAR VARCHAR(50),
    IN _NOMMARMOD VARCHAR(50),
    IN TIPAC CHAR(2)
)
BEGIN
    CASE TIPAC
        WHEN 'RE' THEN
            IF NOT EXISTS (SELECT MARCA.NOMMAR FROM MARCA WHERE NOMMAR = _NOMMAR) THEN
                INSERT INTO MARCA 
                    (NOMMAR)
                    VALUES (_NOMMAR);
            END IF;
        
        WHEN 'ED' THEN
            UPDATE MARCA
                SET NOMMAR = _NOMMARMOD
                WHERE NOMMAR = _NOMMAR;
    
    END CASE;
END;

CREATE PROCEDURE ACCIONMODELO(
    IN _NOMMAR VARCHAR(50),
    IN _NOMMOD VARCHAR(100),
    IN _NOMMODNUEVO VARCHAR(100),
    IN TIPAC CHAR(2)
)
BEGIN
    CASE TIPAC
        WHEN 'RE' THEN
            IF NOT EXISTS (SELECT MODELO.NOMMOD FROM MODELO WHERE MODELO.NOMMOD = _NOMMOD) THEN
                IF EXISTS(SELECT MARCA.NOMMAR FROM MARCA WHERE MARCA.NOMMAR = _NOMMAR) THEN
                    INSERT INTO MODELO
                        (NOMMOD, MARCA_CODMAR)
                        VALUES (_NOMMOD,
                            DEVCODMAR(_NOMMAR)
                        );
                END IF;
            END IF;
        WHEN 'ED' THEN
            UPDATE MODELO
                SET NOMMOD = _NOMMODNUEVO
                WHERE NOMMOD = _NOMMOD; 
            
    END CASE;
END;

CREATE PROCEDURE ACCIONPRODUCTO(
    IN _NOMPRO varchar(200),
    IN _NOMMOD VARCHAR(100),
    IN _SERPRO varchar(100) ,
    IN _PREPRO double(8,2),
    IN _URLIMGPRO varchar(300),
    IN TIPAC CHAR(2)
)
BEGIN
    CASE TIPAC

        WHEN 'RE' THEN
            IF NOT EXISTS (SELECT SERPRO FROM PRODUCTO WHERE SERPRO = _SERPRO) THEN
                INSERT INTO PRODUCTO 
                    (NOMPRO, MODELO_CODMOD, SERPRO, PREPRO, URLIMGPRO) 
                    VALUES (_NOMPRO, DEVCODMOD(_NOMMOD), _SERPRO, _PREPRO, _URLIMGPRO);
            END IF;
        
        WHEN 'ED' THEN
            UPDATE PRODUCTO 
                SET NOMPRO = _NOMPRO,
                    MODELO_CODMOD = DEVCODMOD(_NOMMOD),
                    SERPRO = _SERPRO,
                    PREPRO = _PREPRO,
                    URLIMGPRO = _URLIMGPRO
                WHERE PRODUCTO.SERPRO = _SERPRO;
        
        WHEN 'EL' THEN 
            DELETE FROM PRODUCTO
                WHERE PRODUCTO.SERPRO = _SERPRO;
    END CASE;

END;

CREATE PROCEDURE ACCIONEMPRESA(
    IN _RUCEMP CHAR(10),
    IN _TLFEMP CHAR(12),
    IN _EMAILEMP VARCHAR(30),
    IN _DNIPER CHAR(8),
    IN TIPAC CHAR(2)
)
BEGIN
    CASE TIPAC
        WHEN 'RE' THEN
            IF NOT EXISTS (SELECT RUCEMP FROM EMPRESA WHERE RUCEMP = _RUCEMP) THEN
                INSERT INTO EMPRESA /*aumentara*/
                        (RUCEMP, TLFEMP, EMAILEMP, PERSONA_CODPER_REPLEG)
                    VALUES
                        (_RUCEMP, _TLFEMP, _EMAILEMP, DEVCODPER(_DNIPER));
            END IF;

    END CASE;
END;