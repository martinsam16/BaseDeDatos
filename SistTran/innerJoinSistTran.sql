show tables;
select * from detalle_transferencia;
SELECT * from transferencia;
select * from persona;
SELECT * from equipo;
select 
    codtran,codper_emitran as codemisor, nomper, apeper, dniper, escper, nomsed as sede, arper as area, fecemitran, hoemitran, codper_rectran as codrec, fecrectran, horectran, esttran, obstran
        from  transferencia 
            INNER join persona on codper_emitran=codper
            INNER join sede on sede_codsed=codsed;


describe transferencia;
describe detalle_transferencia;

show columns in persona;

select detalle_transferencia.coddettran, transferencia.codtran, persona.nomper, persona.apeper, sede.nomsed, persona2.nomper as nomrec, persona2.apeper as aperec, sede2.nomsed as nomsedrec, transferencia.fecrectran, transferencia.horectran, transferencia.esttran, transferencia.obstran, equipo.codeq,tipeq, equipo.codpateq, equipo.marceq, equipo.modeleq, equipo.sereq, equipo.esteq, equipo.obseq
from detalle_transferencia
INNER JOIN transferencia on transferencia_codtran= codtran
INNER join persona on transferencia.codper_emitran = persona.codper
INNER JOIN persona as persona2 on transferencia.codper_rectran = persona2.codper
INNER JOIN equipo on equipo_codeq=  codeq
INNER join sede on persona.sede_codsed=sede.codsed
INNER join sede as sede2 on persona2.sede_codsed=sede2.codsed;