delimiter $$
create procedure query_delivery_person_by_area (IN q_area_id BIGINT)
begin
    select * from delivery_person where area_id = q_area_id;
end$$
delimiter;

call query_delivery_person_by_area(1);


delimiter $$
create procedure update_delivery_person_area(d_uid BIGINT, new_area_id BIGINT)
begin
    start transaction;
    update delivery_person
    set  area_id = new_area_id
    where uid = d_uid;
    commit;
end$$

call update_delivery_person_area(3,2);

