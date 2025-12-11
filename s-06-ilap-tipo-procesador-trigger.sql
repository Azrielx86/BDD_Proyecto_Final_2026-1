--@Autor: López Cantarell Diego Emir

create or replace trigger t_dml_tipo_procesador
    instead of insert or update or delete
    on tipo_procesador
declare
    v_count number;
begin
    case
        when inserting then
            v_count := 0;
--réplica local
            insert into tipo_procesador_r1(tipo_procesador_id, clave, descripcion)
            values (:new.tipo_procesador_id, :new.clave, :new.descripcion);
            v_count := v_count + sql%rowcount;
            insert into tipo_procesador_r2(tipo_procesador_id, clave, descripcion)
            values (:new.tipo_procesador_id, :new.clave, :new.descripcion);
            v_count := v_count + sql%rowcount;
--réplica 3
            insert into tipo_procesador_r3(tipo_procesador_id, clave, descripcion)
            values (:new.tipo_procesador_id, :new.clave, :new.descripcion);
            v_count := v_count + sql%rowcount;
--réplica 4
            insert into tipo_procesador_r4(tipo_procesador_id, clave, descripcion)
            values (:new.tipo_procesador_id, :new.clave, :new.descripcion);
            v_count := v_count + sql%rowcount;

            if v_count <> 4 then
                raise_application_error(-20040,
                                        'Número incorrecto de registros insertados en tabla replicada: '
                                            || v_count);
            end if;
        when deleting then
            v_count := 0;
--réplica local
            delete from tipo_procesador_r1 where tipo_procesador_id = :old.tipo_procesador_id;
            v_count := v_count + sql%rowcount;
--réplica 2
            delete from tipo_procesador_r2 where tipo_procesador_id = :old.tipo_procesador_id;
            v_count := v_count + sql%rowcount;
--réplica 3
            delete from tipo_procesador_r3 where tipo_procesador_id = :old.tipo_procesador_id;
            v_count := v_count + sql%rowcount;
--réplica 4
            delete from tipo_procesador_r4 where tipo_procesador_id = :old.tipo_procesador_id;
            v_count := v_count + sql%rowcount;
            if v_count <> 4 then
                raise_application_error(-20040,
                                        'Número incorrecto de registros eliminados en tabla replicada: '
                                            || v_count);
            end if;
        when updating then
            --réplica local
            v_count := 0;
            update tipo_procesador_r1
            set clave       = :new.clave,
                descripcion =:new.descripcion
            where tipo_procesador_id = :new.tipo_procesador_id;
            v_count := v_count + sql%rowcount;
--réplica 2
            update tipo_procesador_r2
            set clave       = :new.clave,
                descripcion =:new.descripcion
            where tipo_procesador_id = :new.tipo_procesador_id;
            v_count := v_count + sql%rowcount;
--réplica 3
            update tipo_procesador_r3
            set clave       = :new.clave,
                descripcion =:new.descripcion
            where tipo_procesador_id = :new.tipo_procesador_id;
            v_count := v_count + sql%rowcount;
--réplica 4
            update tipo_procesador_r4
            set clave       = :new.clave,
                descripcion =:new.descripcion
            where tipo_procesador_id = :new.tipo_procesador_id;
            v_count := v_count + sql%rowcount;
        end case;
    if v_count <> 4 then
        raise_application_error(-20040,
                                'Número incorrecto de registros actualizados en tabla replicada: '
                                    || v_count);
    end if;
end;
/