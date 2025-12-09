--@Author:          Edgar Ulises Moreno Chalico
--@Fecha creación:  04/12/2025
--@Descripción:     Eliminación y creación del usuario.

prompt Creando al usuario ialp_bdd
drop user if exists ilap_bdd;

create user ilap_bdd identified by ilap_bdd
    quota unlimited on users;
grant create session, 
        create table, 
        create procedure, 
        create sequence,
        create synonym,
        create type,
        create view,
        create trigger,
        create database link
        to ilap_bdd;
