--@Author:          Edgar Ulises Moreno Chalico
--@Fecha creación:  04/12/2025
--@Descripción:     Creación de las tablas.

clear screen
whenever sqlerror exit rollback;
set serveroutput on

prompt Iniciando creación de los las tablas

prompt ===========================================================
prompt Creando las tablas en emcbdd_s1
prompt ===========================================================
connect ilap_bdd/ilap_bdd@emcbdd_s1
@s-03-ilap-emcbdd_s1-ddl.sql

prompt ===========================================================
prompt Creando las tablas en emcbdd_s2
prompt ===========================================================
connect ilap_bdd/ilap_bdd@emcbdd_s2
@s-03-ilap-emcbdd_s2-ddl.sql

prompt ===========================================================
prompt Creando las tablas en dlcbdd_s1
prompt ===========================================================
connect ilap_bdd/ilap_bdd@dlcbdd_s1
@s-03-ilap-dlcbdd_s1-ddl.sql

prompt Creando las tablas en dlcbdd_s2
prompt ===========================================================
connect ilap_bdd/ilap_bdd@dlcbdd_s2
@s-03-ilap-dlcbdd_s2-ddl.sql

prompt Listo!
