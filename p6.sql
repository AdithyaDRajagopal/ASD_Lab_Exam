SELECT D.Dish_id,SUM(D.Cost) AS Revenue
FROM Orders O,Dish D
where O.order_id IN(
SELECT Order_id FROM Ordered_by
WHERE Customer_id IN(
SELECT Customer_id FROM Customer))
AND O.Dish_id=D.Dish_id
GROUP BY D.Dish_id;
