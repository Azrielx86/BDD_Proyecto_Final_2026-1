create or replace trigger t_dml_servicio_laptop
    for insert or update or delete
    on servicio_laptop
declare
    v_frag_location number default -1;
begin
    case
        when inserting then
            select * into v_frag_location
            from (
            select 1 from sucursal_taller_f1 where sucursal_id = :new.sucursal_id
            union all
            select 2 from sucursal_taller_f2 where sucursal_id = :new.sucursal_id
            union all
            select 3 from sucursal_taller_f3 where sucursal_id = :new.sucursal_id
            union all
            select 4 from sucursal_taller_f4 where sucursal_id = :new.sucursal_id);

            if v_frag_location = 1 then
                insert into servicio_laptop_f1(sucursal_id, dia_descanso, telefono_atencion)
                values (:new.num_servicio, :new.laptop_id, :new.importe, :new.diagnostico, :new.factura,
                        :new.sucursal_id);
            elsif v_frag_location = 2 then
                insert into servicio_laptop_f2(sucursal_id, dia_descanso, telefono_atencion)
                values (:new.num_servicio, :new.laptop_id, :new.importe, :new.diagnostico, :new.factura,
                        :new.sucursal_id);
            elsif v_frag_location = 3 then
                insert into servicio_laptop_f3(num_servicio, laptop_id, importe, diagnostico, factura, sucursal_id)
                values (:new.num_servicio, :new.laptop_id, :new.importe, :new.diagnostico, :new.factura,
                        :new.sucursal_id);
            elsif v_frag_location = 4 then
                insert into servicio_laptop_f4(sucursal_id, dia_descanso, telefono_atencion)
                values (:new.num_servicio, :new.laptop_id, :new.importe, :new.diagnostico, :new.factura,
                        :new.sucursal_id);
            else
                raise_application_error(-20020, 'La sucursal '
                    || :new.sucursal_id
                    || ' no está existe en los fragmentos padre.');
            end if;
    end case;
end;