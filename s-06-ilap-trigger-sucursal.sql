create or replace trigger t_dml_sucursal
    instead of insert or update or delete
    on sucursal
declare
    v_region varchar2(2);
begin
    case
        when inserting then
            v_region := substr(:new.clave, 3, 2);

            if (:new.es_venta > 1 or :new.es_taller > 1)
                   or (:new.es_venta = 0 and :new.es_taller = 0)
                or v_region not in ('NO', 'EA', 'WS', 'SO')
                then
                raise_application_error(-20010, 'Operación no permitida');
            end if;

            if v_region = 'NO' or (:new.es_venta = 1 and :new.es_taller = 1) then
                insert into sucursal_f1(sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url)
                values (:new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta, :new.nombre,
                        :new.latitud, :new.longitud, :new.url);
            elsif v_region = 'EA' then
                insert into sucursal_f2(sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url)
                values (:new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta, :new.nombre,
                        :new.latitud, :new.longitud, :new.url);
            elsif v_region = 'WS' then
                insert into sucursal_f3(sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url)
                values (:new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta, :new.nombre,
                        :new.latitud, :new.longitud, :new.url);
            elsif v_region = 'SO' then
                insert into sucursal_f4(sucursal_id, clave, es_taller, es_venta, nombre, latitud, longitud, url)
                values (:new.sucursal_id, :new.clave, :new.es_taller, :new.es_venta, :new.nombre,
                        :new.latitud, :new.longitud, :new.url);
            else
                raise_application_error(-20010, 'La región '
                    || v_region
                    || ' no está permitida.');
            end if;
        when updating then
            raise_application_error(-20030, 'Operación UPDATE no soportada.');
        when deleting then
            if (:old.es_venta = 1 and :old.es_taller = 1) or substr(:old.clave, 3, 2) = 'NO' then
                delete
                from sucursal_f1
                where :old.sucursal_id = sucursal_id;
            elsif substr(:old.clave, 3, 2) = 'EA' then
                delete
                from sucursal_f2
                where :old.sucursal_id = sucursal_id;
            elsif substr(:old.clave, 3, 2) = 'WS' then
                delete
                from sucursal_f3
                where :old.sucursal_id = sucursal_id;
            elsif substr(:old.clave, 3, 2) = 'SO' then
                delete
                from sucursal_f4
                where :old.sucursal_id = sucursal_id;
            else
                raise_application_error(-20010, 'La región '
                    || substr(:old.clave, 3, 2)
                    || ' no está permitida.');
            end if;
        end case;
end;
/
