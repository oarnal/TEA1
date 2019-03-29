CREATE OR REPLACE FUNCTION dades_treballador (salari REAL)
  RETURNS setof VARCHAR AS
$BODY$
DECLARE
  cognoms comercial.treballadors.cognom%TYPE;
  curs1 CURSOR FOR SELECT treballadors.cognom FROM comercial.treballadors
                   WHERE treballadors.sou > salari;

BEGIN
  OPEN curs1;
  LOOP
    FETCH curs1 INTO cognoms;
    EXIT WHEN NOT FOUND;
    RETURN NEXT cognoms;
  END LOOP;
  close curs1;
END;
$BODY$
  LANGUAGE plpgsql;

SELECT dades_treballador(NULL);
