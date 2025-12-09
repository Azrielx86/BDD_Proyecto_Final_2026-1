--@Autor: López Cantarell Diego Emir

Prompt creando función para extraer dato Blob de laptop_f5

create or replace function get_remote_foto_f5_by_id(p_laptop_id in number)
    return blob is
    pragma autonomous_transaction;
    v_temp_pdf blob;
begin
    delete from ts_laptop_f5;
    insert into ts_laptop_f5;
        select laptop_id,foto
        from laptop_f5
        where laptop_id = p_laptop_id;
    select foto into v_temp_pdf
    from ts_laptop_f5
    where laptop_id = p_laptop_id;
    delete from ts_laptop_f5;
    commit;
    return v_temp_pdf;
exception
    when others then
    rollback;
    raise;
end;
/
show errors;


Prompt creando función para extraer dato Blob de servicio_laptop_f1
create or replace function get_remote_serv_lap_f1_by_id(
    p_num_servicio in numbre, p_laptop_id in number) return blob is
pragma autonomous_transaction;
v_temp_pdf blob;
begin
    delete from ts_servicio_laptop_f1;
    insert into ts_servicio_laptop_f1(num_servicio, laptop_id,factura)
        select num_servicio,laptop_id,factura
        from servicio_laptop_f1
        where num_servicio = p_num_servicio
        and laptop_id = p_laptop_id;
    select factura into v_temp_pdf
    from ts_servicio_laptop_f1
    where num_servicio = p_num_servicio
    and laptop_id = p_laptop_id;
    delete from ts_servicio_laptop_f1;
exception
    when others then
    rollback;
    raise;
end;
/
show errors


Prompt creando función para extraer dato Blob de servicio_laptop_f2
create or replace function get_remote_serv_lap_f2_by_id(
    p_num_servicio in numbre, p_laptop_id in number) return blob is
pragma autonomous_transaction;
v_temp_pdf blob;
begin
    delete from ts_servicio_laptop_f2;
    insert into ts_servicio_laptop_f2(num_servicio, laptop_id,factura)
        select num_servicio,laptop_id,factura
        from servicio_laptop_f2
        where num_servicio = p_num_servicio
        and laptop_id = p_laptop_id;
    select factura into v_temp_pdf
    from ts_servicio_laptop_f2
    where num_servicio = p_num_servicio
    and laptop_id = p_laptop_id;
    delete from ts_servicio_laptop_f2;
exception
    when others then
    rollback;
    raise;
end;
/
show errors;


Prompt creando función para extraer dato Blob de servicio_laptop_f3
create or replace function get_remote_serv_lap_f3_by_id(
    p_num_servicio in numbre, p_laptop_id in number) return blob is
pragma autonomous_transaction;
v_temp_pdf blob;
begin
    delete from ts_servicio_laptop_f3;
    insert into ts_servicio_laptop_f3(num_servicio, laptop_id,factura)
        select num_servicio,laptop_id,factura
        from servicio_laptop_f3
        where num_servicio = p_num_servicio
        and laptop_id = p_laptop_id;
    select factura into v_temp_pdf
    from ts_servicio_laptop_f3
    where num_servicio = p_num_servicio
    and laptop_id = p_laptop_id;
    delete from ts_servicio_laptop_f3;
exception
    when others then
    rollback;
    raise;
end;
/
show errors;


Prompt creando función para extraer dato Blob de servicio_laptop_f4
create or replace function get_remote_serv_lap_f4_by_id(
    p_num_servicio in numbre, p_laptop_id in number) return blob is
pragma autonomous_transaction;
v_temp_pdf blob;
begin
    delete from ts_servicio_laptop_f4;
    insert into ts_servicio_laptop_f4(num_servicio, laptop_id,factura)
        select num_servicio,laptop_id,factura
        from servicio_laptop_f4
        where num_servicio = p_num_servicio
        and laptop_id = p_laptop_id;
    select factura into v_temp_pdf
    from ts_servicio_laptop_f4
    where num_servicio = p_num_servicio
    and laptop_id = p_laptop_id;
    delete from ts_servicio_laptop_f4;
exception
    when others then
    rollback;
    raise;
end;
/

show errors;
