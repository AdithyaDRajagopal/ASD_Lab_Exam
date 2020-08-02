CREATE OR REPLACE FUNCTION Calc_Rev()
RETURNS VOID AS
$$
DECLARE
	rev INT;
	rec RECORD;
	orev INT;
BEGIN
	FOR rec IN SELECT * FROM Customer LOOP
		rev:=0;
		rev:=(SELECT SUM(D.Cost)
		      FROM Ordered_by O,Dish D
		      WHERE O.Customer_id=rec.Customer_id
		      AND D.Dish_id IN(
		      SELECT Dish_id FROM Orders
		      WHERE Order_id IN(
		      SELECT Order_id FROM Ordered_by
		      WHERE Customer_id=O.customer_id)));
		IF(rev<600) THEN
			UPDATE Customers
			SET Premium=false
			WHERE Customer_id=rec.Customer_id;
		END IF;
	END LOOP;
END;
$$
LANGUAGE PLPGSQL;
