CREATE OR REPLACE FUNCTION CPF(p INT,q INT)
RETURNS INT AS
$$
DECLARE
	n INT;
	i INT;
	m INT;
	j INT;
	flag INT;
BEGIN
	n:=0;
	IF(p<q) THEN
		m:=p;
	ELSE
		m:=q;
	END IF;
	FOR i IN 2..m LOOP
		flag:=0;
		FOR j IN 2..(i/2) LOOP
			IF(i%j=0) THEN
				flag:=1;
			END IF;
		END LOOP;
		IF(flag=0) THEN
			IF(p%i=0) THEN
				IF(q%i=0) THEN
					n:=n+1;
				END IF;
			END IF;
		END IF;
	END LOOP;
	RETURN n;
END;
$$
LANGUAGE PLPGSQL;
