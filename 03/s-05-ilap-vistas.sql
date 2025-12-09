--@Author: López Cantarell Diego Emir

--Historico status laptop
create or replace view historico_status_laptop as
select historico_status_laptop_id, fecha_status, status_laptop_id, laptop_id
from (select historico_status_laptop_id, fecha_status, status_laptop_id, laptop_id
      from historico_status_laptop_f1
      union all
      select historico_status_laptop_id, fecha_status, status_laptop_id, laptop_id
      from historico_status_laptop_f2) q1;

--Laptop (f5 tiene blob)
create or replace view laptop as
select laptop_id,
       num_serie,
       cantidad_ram,
       caracteristicas_extras,
       tipo_tarjeta_video_id,
       tipo_procesador_id,
       tipo_almacenamiento_id,
       tipo_monitor_id,
       laptop_reemplazo_id
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
      from laptop_f4) q1;

--Sucursal
create or replace view sucursal as
select sucursal_id,
       clave,
       es_taller,
       es_venta,
       nombre,
       latitud,
       longitud,
       url
from sucursal_f1
union all
select sucursal_id,
       clave,
       es_taller,
       es_venta,
       nombre,
       latitud,
       longitud,
       url
from sucursal_f2
union all
select sucursal_id,
       clave,
       es_taller,
       es_venta,
       nombre,
       latitud,
       longitud,
       url
from sucursal_f3
union all
select sucursal_id,
       clave,
       es_taller,
       es_venta,
       nombre,
       latitud,
       longitud,
       url
from sucursal_f4;

--Sucursal_taller
create or replace view sucursal_taller as
select sucursal_id, dia_descanso, telefono_atencion
from (select sucursal_id, dia_descanso, telefono_atencion
      from sucursal_taller_f1
      union all
      select sucursal_id, dia_descanso, telefono_atencion
      from sucursal_taller_f2
      union all
      select sucursal_id, dia_descanso, telefono_atencion
      from sucursal_taller_f3
      union all
      select sucursal_id, dia_descanso, telefono_atencion
      from sucursal_taller_f4) q1;

--Sucursal_venta
create or replace view sucursal_venta as
select sucursal_id, hora_apertura, hora_cierre
from (select sucursal_id, hora_apertura, hora_cierre
      from sucursal_venta_f1
      union all
      select sucursal_id, hora_apertura, hora_cierre
      from sucursal_venta_f2
      union all
      select sucursal_id, hora_apertura, hora_cierre
      from sucursal_venta_f3
      union all
      select sucursal_id, hora_apertura, hora_cierre
      from sucursal_venta_f4) q1;
