# These code for only report and presentation slide.
# If you want to test the trigger, please execute the trigger_dump.sql
# then use the command in trigger_test.sql for testing.

# Trigger 1 : Delete account log
create table del_account_log(
    email varchar(100) not null,
    timestamp timestamp not null
);
CREATE TRIGGER deleteAccountLog
    after delete
    on user_account
    for each row
begin
    insert into del_account_log values (old.email, now());
end;

# Trigger 2 :
create trigger changeDriverStatus
    after update on `order` for each row
    begin
        if new.order_id = old.order_id then
            begin
                declare driver_id bigint;
                select delivery_person_id into driver_id from delivery_order join `order` on `order`.order_id = delivery_order.order_id where `order`.order_id = new.order_id;
                if(new.status = 'completed') then
                    update delivery_person set delivery_person.status = 'not accepting' where delivery_person.uid = driver_id;
                elseif (new.status = 'preparing') then
                    update delivery_person set delivery_person.status = 'waiting for restaurant' where delivery_person.uid = driver_id;
                elseif (new.status = 'delivery') then
                    update delivery_person set delivery_person.status = 'delivery' where delivery_person.uid = driver_id;
                end if;
            end;
        end if;
    end;