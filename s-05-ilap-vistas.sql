--@Author: López Cantarell Diego Emir

--Historico status laptop
create or replace view historico_status_laptop as
    select historico_status_laptop_id, fecha_status, status_laptop_id, laptop_id
    from (
    select historico_status_laptop_id, fecha_status, status_laptop_id, laptop_id
    from historico_status_laptop_f1
    union all
    select historico_status_laptop_id, fecha_status, status_laptop_id, laptop_id
    from historico_status_laptop_f2
    ) q1;

--Laptop (f5 tiene blob)

--Inventario_laptop (tienen diferentes datos ¿?)
create or replace view laptop_inventario as
select 
    f1.laptop_id,
    f2.fecha_status,
    f2.sucursal_id,
    f2.status_laptop_id,
    f1.rfc_cliente,
    f1.num_tarjeta
from laptop_inventario_f1 f1
inner join laptop_inventario_f2 f2
    on f1.laptop_id = f2.laptop_id;



--Servicio Laptop (los 4 fragmentos tienen blob)


--Sucursal
create or replace view sucursal as
    select sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url
    from (
    select sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url
    from sucursal_f1
    union all
    select sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url
    from sucursal_f2
    union all
    select sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url
    from sucursal_f3
    union all
    select sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url
    from sucursal_f4
    ) q1;

--Sucursal_taller
create or replace view sucursal_taller as
    select sucursal_id, dia_descanso, telefono_atencion
    from (
    select sucursal_id, dia_descanso, telefono_atencion
    from sucursal_taller_f1
    union all
    select sucursal_id, dia_descanso, telefono_atencion
    from sucursal_taller_f2
    union all
    select sucursal_id, dia_descanso, telefono_atencion
    from sucursal_taller_f3
    union all
    select sucursal_id, dia_descanso, telefono_atencion
    from sucursal_taller_f4
    ) q1;


--Sucursal_venta
create or replace view sucursal_venta as
    select sucursal_id, hora_apertura, hora_cierre
    from (
    select sucursal_id, hora_apertura, hora_cierre
    from sucursal_venta_f1
    union all
    select sucursal_id, hora_apertura, hora_cierre
    from sucursal_venta_f2
    union all
    select sucursal_id, hora_apertura, hora_cierre
    from sucursal_venta_f3
    union all
    select sucursal_id, hora_apertura, hora_cierre
    from sucursal_venta_f4
    ) q1;

--Tipo_almacenamiento
create or replace view tipo_almacenamiento as
    select tipo_almacenamiento_id, clave, descripcion
    from (
    select tipo_almacenamiento_id, clave, descripcion
    from tipo_almacenamiento_r
    ) q1;

--Tipo_monitor
create or replace view tipo_monitor as
    select tipo_monitor_id, clave, descripcion
    from (
    select tipo_monitor_id, clave, descripcion
    from tipo_monitor_r
    ) q1;

--Tipo_procesador
create or replace view tipo_procesador as
    select tipo_procesador_id, clave, descripcion
    from (
    select tipo_procesador_id, clave, descripcion
    from tipo_procesador_r
    ) q1;

--Tipo_tarjeta_video
create or replace view tipo_tarjeta_video as
    select tipo_tarjeta_video_id, clave, descripcion
    from (
    select tipo_tarjeta_video_id, clave, descripcion
    from tipo_tarjeta_video_r
    ) q1;