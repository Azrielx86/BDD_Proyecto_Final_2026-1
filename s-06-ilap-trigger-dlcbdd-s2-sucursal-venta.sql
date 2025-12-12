create or replace trigger t_dml_sucursal_venta
    instead of insert or update or delete
    on sucursal_venta
declare
    v_frag_location number default -1;
    v_local_count   number default 0;
begin
    case
        when inserting then
            select count(*)
            into v_local_count
            from sucursal_f2
            where sucursal_id = :new.sucursal_id;

            if v_local_count > 0 then
                insert into sucursal_venta_f2(sucursal_id, hora_apertura, hora_cierre)
                values (:new.sucursal_id, :new.hora_apertura, :new.hora_cierre);
            else
                select nvl(max(f), 0)
                into v_frag_location
                from (select 1 f
                      from sucursal_f1
                      where sucursal_id = :new.sucursal_id
                      union all
                      select 3
                      from sucursal_f3
                      where sucursal_id = :new.sucursal_id
                      union all
                      select 4
                      from sucursal_f4
                      where sucursal_id = :new.sucursal_id);

                if v_frag_location = 1 then
                    insert into sucursal_venta_f1(sucursal_id, hora_apertura, hora_cierre)
                    values (:new.sucursal_id, :new.hora_apertura, :new.hora_cierre);
                elsif v_frag_location = 3 then
                    insert into sucursal_venta_f3(sucursal_id, hora_apertura, hora_cierre)
                    values (:new.sucursal_id, :new.hora_apertura, :new.hora_cierre);
                elsif v_frag_location = 4 then
                    insert into sucursal_venta_f4(sucursal_id, hora_apertura, hora_cierre)
                    values (:new.sucursal_id, :new.hora_apertura, :new.hora_cierre);
                else
                    raise_application_error(-20020, 'La sucursal '
                        || :new.sucursal_id
                        || ' no está existe en los fragmentos padre.');
                end if;
            end if;
        when updating then
            raise_application_error(-20030, 'Operación UPDATE no soportada.');
        when deleting then
            select count(*)
            into v_local_count
            from sucursal_f2
            where sucursal_id = :old.sucursal_id;

            if v_local_count > 0 then
                delete from sucursal_venta_f2 where sucursal_id = :old.sucursal_id;
            else
                select nvl(max(f), 0)
                into v_frag_location
                from (select 1 f
                      from sucursal_f1
                      where sucursal_id = :old.sucursal_id
                      union all
                      select 3
                      from sucursal_f3
                      where sucursal_id = :old.sucursal_id
                      union all
                      select 4
                      from sucursal_f4
                      where sucursal_id = :old.sucursal_id);

                if v_frag_location = 1 then
                    delete from sucursal_venta_f1 where sucursal_id = :old.sucursal_id;
                elsif v_frag_location = 3 then
                    delete from sucursal_venta_f3 where sucursal_id = :old.sucursal_id;
                elsif v_frag_location = 4 then
                    delete from sucursal_venta_f4 where sucursal_id = :old.sucursal_id;
                else
                    raise_application_error(-20020, 'La sucursal '
                        || :new.sucursal_id
                        || ' no está existe en los fragmentos padre.');
                end if;
            end if;
        end case;
end;
/
