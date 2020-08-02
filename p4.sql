SELECT Customer_id,COUNT(Customer_id)
FROM Ordered_by
WHERE Order_id IN(
SELECT Order_id FROM ORDERS
WHERE Dish_id IN(
SELECT Dish_id from dish
WHERE Name='Noodles'))
GROUP BY Customer_id;
