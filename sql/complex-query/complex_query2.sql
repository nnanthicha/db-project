SELECT restaurant_id, name restaurant_name, sum(total_price)
FROM (SELECT restaurant_order.order_id, restaurant_id, total_price
	FROM restaurant_order
	JOIN (SELECT transaction.order_id, transaction.status
		FROM transaction
		JOIN payment_record
		ON transaction.transaction_id = payment_record.transaction_id
		WHERE timestamp BETWEEN DATE("2022-11-01") 
        AND DATE("2022-11-30")
        ) payment
	ON restaurant_order.order_id = payment.order_id
	WHERE payment.status = True) T
JOIN user
ON T.restaurant_id = user.uid
GROUP BY restaurant_id
ORDER BY sum(total_price) DESC
LIMIT 5;