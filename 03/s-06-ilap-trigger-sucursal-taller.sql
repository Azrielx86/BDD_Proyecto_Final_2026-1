create or replace trigger t_dml_sucursal_taller
    instead of insert or update or delete
    on sucursal_taller
declare
    v_frag_location number default -1;
begin
    case
        when inserting then
            select * into v_frag_location
            from (
            select 1 from sucursal_f1 where sucursal_id = :new.sucursal_id
            union all
            select 2 from sucursal_f2 where sucursal_id = :new.sucursal_id
            union all
            select 3 from sucursal_f3 where sucursal_id = :new.sucursal_id
            union all
            select 4 from sucursal_f4 where sucursal_id = :new.sucursal_id);

            if v_frag_location = 1 then
                insert into sucursal_taller_f1(sucursal_id, dia_descanso, telefono_atencion)
                values (:new.sucursal_id, :new.dia_descanso, :new.telefono_atencion);
            elsif v_frag_location = 2 then
                insert into sucursal_taller_f2(sucursal_id, dia_descanso, telefono_atencion)
                values (:new.sucursal_id, :new.dia_descanso, :new.telefono_atencion);
            elsif v_frag_location = 3 then
                insert into sucursal_taller_f3(sucursal_id, dia_descanso, telefono_atencion)
                values (:new.sucursal_id, :new.dia_descanso, :new.telefono_atencion);
            elsif v_frag_location = 4 then
                insert into sucursal_taller_f4(sucursal_id, dia_descanso, telefono_atencion)
                values (:new.sucursal_id, :new.dia_descanso, :new.telefono_atencion);
            else
                raise_application_error(-20020, 'La sucursal '
                    || :new.sucursal_id
                    || ' no está existe en los fragmentos padre.');
            end if;
        when updating then
            raise_application_error(-20030, 'Operación UPDATE no soportada.');
        when deleting then
            select * into v_frag_location
            from (
            select 1 from sucursal_f1 where sucursal_id = :old.sucursal_id
            union all
            select 2 from sucursal_f2 where sucursal_id = :old.sucursal_id
            union all
            select 3 from sucursal_f3 where sucursal_id = :old.sucursal_id
            union all
            select 4 from sucursal_f4 where sucursal_id = :old.sucursal_id);
            if v_frag_location = 1 then
                delete from sucursal_taller_f1 where sucursal_id = :old.sucursal_id;
            elsif v_frag_location = 2 then
                delete from sucursal_taller_f2 where sucursal_id = :old.sucursal_id;
            elsif v_frag_location = 3 then
                delete from sucursal_taller_f3 where sucursal_id = :old.sucursal_id;
            elsif v_frag_location = 4 then
                delete from sucursal_taller_f4 where sucursal_id = :old.sucursal_id;
            else
                raise_application_error(-20020, 'La sucursal '
                    || :new.sucursal_id
                    || ' no está existe en los fragmentos padre.');
            end if;
        end case;
end;
/