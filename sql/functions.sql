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
