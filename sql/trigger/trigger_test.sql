# Trigger 1 test:
DELETE FROM user_account WHERE email="test@test.com";
select * from user_account;
select * from del_account_log;

# Trigger 2 test:
select * from `order`;
select * from delivery_person;

update `order` set `order`.status = 'preparing' where order_id = 1;
select * from `order`;
select * from delivery_person;

update `order` set `order`.status = 'delivery' where order_id = 1;
select * from `order`;
select * from delivery_person;

update `order` set `order`.status = 'completed' where order_id = 1;
select * from `order`;
select * from delivery_person;

update `order` set `order`.status = 'completed' where order_id = 2;
select * from `order`;
select * from delivery_person;
