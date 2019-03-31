CREATE OR REPLACE FUNCTION comercial.dades_treballador (nomtreb VARCHAR)
  RETURNS setof VARCHAR AS
$BODY$
DECLARE
  cognoms comercial.treballadors.cognoms%TYPE;
  curs1 CURSOR FOR SELECT treballadors.cognoms FROM comercial.treballadors
                   WHERE treballadors.nom = nomtreb;

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
