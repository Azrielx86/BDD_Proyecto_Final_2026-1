--@Autor: López Cantarell Diego Emir

create or replace view laptop as
select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
tipo_monitor_id,laptop_reemplazo_id, get_remote_foto_f5_by_id(laptop_id) foto
from (
select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
tipo_monitor_id,laptop_reemplazo_id
from laptop_f2
union all
select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
tipo_monitor_id,laptop_reemplazo_id
from laptop_f3
union all
select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
tipo_monitor_id,laptop_reemplazo_id
from laptop_f4
union all
select laptop_id,num_serie,cantidad_ram,caracteristicas_extras,
tipo_tarjeta_video_id,tipo_procesador_id,tipo_almacenamiento_id,
tipo_monitor_id,laptop_reemplazo_id
from laptop_f1
) q1;


create or replace view servicio_laptop as
select num_servicio,laptop_id,importe,diagnostico,factura,sucursal_id
from servicio_laptop_f1
union all
select num_servicio,laptop_id,importe,diagnostico,
get_remote_serv_lap_f2_by_id(num_servicio,laptop_id),
sucursal_id
from servicio_laptop_f2
union all
select num_servicio,laptop_id,importe,diagnostico,
get_remote_serv_lap_f3_by_id(num_servicio,laptop_id),
sucursal_id
from servicio_laptop_f3
union all
select num_servicio,laptop_id,importe,diagnostico,
get_remote_serv_lap_f4_by_id(num_servicio,laptop_id),
sucursal_id
from servicio_laptop_f4;