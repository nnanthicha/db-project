SELECT res_in_area.restaurant_id, name restaurant_name, count(menu_id) count_menu
FROM menu 
JOIN (SELECT area_addr.area_id, restaurant.uid restaurant_id, cus.uid customer_id, restaurant.status
    FROM restaurant
    LEFT JOIN (SELECT area_id, address_id
FROM address
JOIN area
        ON address.province = area.province
AND address.district = area.district
AND address.sub_district = area.sub_district) area_addr
    ON restaurant.address_id = area_addr.address_id
    JOIN (SELECT area_id, uid
        FROM customer
        JOIN (SELECT area_id, address_id
FROM address
JOIN area
            ON address.province = area.province 
AND address.district = area.district 
AND address.sub_district = area.sub_district) area_addr
        ON customer.address_id = area_addr.address_id) cus
    ON area_addr.area_id =cus.area_id
    WHERE cus.uid = 3) res_in_area
ON menu.restaurant_id = res_in_area.restaurant_id
LEFT JOIN user
ON user.uid = res_in_area.restaurant_id
WHERE title LIKE '%chicken%' AND menu.status=1 AND res_in_area.status='Open'
GROUP BY restaurant_id;