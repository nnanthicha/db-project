# function matchArea
# DROP FUNCTION IF EXISTS matchArea;
DELIMITER $$
CREATE FUNCTION matchArea (c_area BIGINT,d_area BIGINT, r_area BIGINT)
    RETURNS varchar(20)
    DETERMINISTIC
BEGIN
    DECLARE match_area varchar(20);
    set match_area = 'same area';
    IF c_area != d_area THEN
        SET match_area = 'not same area';
    ELSEIF c_area != r_area THEN
        SET match_area = 'not same area';
    ELSEIF d_area != r_area THEN
        SET match_area = 'not same area';
    END IF;
    RETURN (match_area);
 END $$
DELIMITER ;
# ---------------------------------------------------------------------------------
# test function match area
select matchArea(2,2,3);
select matchArea(2,2,2);

# -------------------------------------------------------------------------------------------
# DROP FUNCTION IF EXISTS pending_status;
# function pending_status
DELIMITER $$
CREATE FUNCTION pending_status(start_time TIMESTAMP, stat varchar(50))
    RETURNS varchar(50)
    DETERMINISTIC
BEGIN
    DECLARE match_status varchar(50);
    set match_status = 'pending';
    IF stat  = 'pending' THEN
        IF TIMESTAMPDIFF(MINUTE,start_time,now()) > 15 THEN
            set match_status = 'TIME OUT, No rider accept, order will be cancel';
        ELSEIF TIMESTAMPDIFF(MINUTE,start_time,now()) > 5 THEN
            SET match_status = 'Long wait, start find plan B restaurants';
        end if;
    END IF;
    RETURN (match_status);
 END $$
DELIMITER ;
select DATE_SUB( NOW(), INTERVAL 15 MINUTE );

# -----------------------------------------------------------------------------------------------------
# test call function pending_status 1 (the result should be "Long wait, start find plan B restaurants")
# update data for query
update place_order set place_order.timestamp = (DATE_SUB( NOW(), INTERVAL 6 MINUTE ))
where place_order.order_id = 1;

#  query for calling test for pending_status
SET @v1 := (select timestamp from place_order
join `order` on place_order.order_id
where place_order.order_id = 1
limit 1);



SET @v2 := (select status from `order`
where order_id = 1
limit 1);

select pending_status(@v1,@v2);
# -----------------------------------------------------------------------------------
# test call function pending_status 2 (the result should be "TIME OUT, No rider accept, order will be cancel")
# update data for query
update place_order set place_order.timestamp = (DATE_SUB( NOW(), INTERVAL 16 MINUTE ))
where place_order.order_id = 2;
#  query for calling test for pending_status
SET @v1 := (select timestamp from place_order
join `order` on place_order.order_id
where place_order.order_id = 2
limit 1);



SET @v2 := (select status from `order`
where order_id = 2
limit 1);

# test pending_status 2
select pending_status(@v1,@v2);