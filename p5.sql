SELECT SUM(D.Cost) AS Revenue_DEC
FROM Orders O,Dish D
WHERE O.Order_id IN(
SELECT Order_id FROM Ordered_by
WHERE Date_Of_Order BETWEEN '2018-12-01' AND '2018-12-31')
AND O.Dish_id=D.Dish_id;

