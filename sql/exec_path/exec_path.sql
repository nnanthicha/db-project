select *
from area,
     delivery_person
where delivery_person.area_id = area.area_id
  and area.area_id in (1, 2);


(select *
 from area,
      delivery_person
 where delivery_person.area_id = area.area_id
   and area.area_id = 1)
union
(select *
 from area,
      delivery_person
 where delivery_person.area_id = area.area_id
   and area.area_id = 2)
