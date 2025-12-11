--@Autor: López Cantarell Diego Emir

create or replace view laptop as
select q.laptop_id,
       q.num_serie,
       q.cantidad_ram,
       q.caracteristicas_extras,
       q.tipo_tarjeta_video_id,
       q.tipo_procesador_id,
       q.tipo_almacenamiento_id,
       q.tipo_monitor_id,
       q.laptop_reemplazo_id,
       f5.foto
from (select laptop_id,
             num_serie,
             cantidad_ram,
             caracteristicas_extras,
             tipo_tarjeta_video_id,
             tipo_procesador_id,
             tipo_almacenamiento_id,
             tipo_monitor_id,
             laptop_reemplazo_id
      from laptop_f1
      union all
      select laptop_id,
             num_serie,
             cantidad_ram,
             caracteristicas_extras,
             tipo_tarjeta_video_id,
             tipo_procesador_id,
             tipo_almacenamiento_id,
             tipo_monitor_id,
             laptop_reemplazo_id
      from laptop_f2
      union all
      select laptop_id,
             num_serie,
             cantidad_ram,
             caracteristicas_extras,
             tipo_tarjeta_video_id,
             tipo_procesador_id,
             tipo_almacenamiento_id,
             tipo_monitor_id,
             laptop_reemplazo_id
      from laptop_f3
      union all
      select laptop_id,
             num_serie,
             cantidad_ram,
             caracteristicas_extras,
             tipo_tarjeta_video_id,
             tipo_procesador_id,
             tipo_almacenamiento_id,
             tipo_monitor_id,
             laptop_reemplazo_id
      from laptop_f4) q
         join laptop_f5 f5
              on q.laptop_id = f5.laptop_id;

create or replace view servicio_laptop as
select num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id
from servicio_laptop_f2
union all
select num_servicio,
       laptop_id,
       importe,
       diagnostico,
       get_remote_serv_lap_f1_by_id(num_servicio, laptop_id),
       sucursal_id
from servicio_laptop_f1
union all
select num_servicio,
       laptop_id,
       importe,
       diagnostico,
       get_remote_serv_lap_f3_by_id(num_servicio, laptop_id),
       sucursal_id
from servicio_laptop_f3
union all
select num_servicio,
       laptop_id,
       importe,
       diagnostico,
       get_remote_serv_lap_f4_by_id(num_servicio, laptop_id),
       sucursal_id
from servicio_laptop_f4;