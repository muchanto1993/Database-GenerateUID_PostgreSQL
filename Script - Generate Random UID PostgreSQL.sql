--1 Create Function gen_random_bytes
CREATE OR REPLACE FUNCTION gen_random_bytes(
	integer)
    RETURNS bytea
    LANGUAGE 'c'

    COST 1
    VOLATILE STRICT PARALLEL SAFE
    
AS '$libdir/pgcrypto', 'pg_random_bytes';

--2 Create Function generate_uid
CREATE OR REPLACE FUNCTION generate_uid(
	size integer)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    
AS $BODY$
DECLARE
  characters TEXT := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  bytes BYTEA := gen_random_bytes(size);
  l INT := length(characters);
  i INT := 0;
  output TEXT := '';
BEGIN
  WHILE i < size LOOP
    output := output || substr(characters, get_byte(bytes, i) % l + 1, 1);
    i := i + 1;
  END LOOP;
  RETURN output;
END;
$BODY$;
