create or replace trigger t_dml_status_historico_laptop
    instead of insert or update or delete
    on historico_status_laptop
declare
begin
    case
        when inserting then
            if to_number(to_char(:new.fecha_status, 'YYYY')) <= 2009 then
                insert into historico_status_laptop_f1(historico_status_laptop_id, fecha_status, status_laptop_id, laptop_id)
                values (:new.historico_status_laptop_id, :new.fecha_status,
                        :new.status_laptop_id, :new.laptop_id);
            elsif to_number(to_char(:new.fecha_status, 'YYYY')) > 2009 then
                insert into historico_status_laptop_f2(historico_status_laptop_id, fecha_status, status_laptop_id, laptop_id)
                values (:new.historico_status_laptop_id, :new.fecha_status,
                        :new.status_laptop_id, :new.laptop_id);
            else
                raise_application_error(-20010, 'La fecha '
                    || :new.fecha_status
                    || ' no está permitida.');
            end if;
        when updating then
            raise_application_error(-20030, 'Operación UPDATE no soportada.');
        when deleting then
            if to_number(to_char(:old.fecha_status, 'YYYY')) <= 2009 then
                delete
                from historico_status_laptop_f1
                where historico_status_laptop_id = :old.historico_status_laptop_id;
            elsif to_number(to_char(:old.fecha_status, 'YYYY')) > 2009 then
                delete
                from historico_status_laptop_f2
                where historico_status_laptop_id = :old.historico_status_laptop_id;
            else
                raise_application_error(-20010, 'La fecha '
                    || :old.fecha_status
                    || ' no está permitida.');
            end if;
        end case;
end;
/