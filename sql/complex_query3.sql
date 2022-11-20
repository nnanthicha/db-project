SELECT restaurant_id, name restaurant_name, count_order
FROM (SELECT customer_id, restaurant_order.restaurant_id, count(restaurant_order.restaurant_id) count_order
    FROM place_order
    LEFT JOIN `order`
    ON place_order.order_id = `order`.order_id
    JOIN restaurant_order
    ON place_order.order_id = restaurant_order.order_id
WHERE status='completed' AND customer_id = 1
    GROUP BY restaurant_order.restaurant_id
    ORDER BY count_order DESC) res
JOIN user
ON user.uid = restaurant_id;