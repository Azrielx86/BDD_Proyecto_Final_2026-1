--@Author:          Edgar Ulises Moreno Chalico
--@Fecha creación:  04/12/2025
--@Descripción:     Archivo de carga inicial para catálogos replicados

clear screen
whenever sqlerror exit rollback;

prompt ===============================================
prompt Cargando catálogos de forma manual en dlcbdd_s1
prompt ===============================================
connect ilap_bdd/ilap_bdd@dlcbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

prompt ===============================================
prompt Cargando catálogos de forma manual en dlcbdd_s2
prompt ===============================================
connect ilap_bdd/ilap_bdd@dlcbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

prompt ===============================================
prompt Cargando catálogos de forma manual en emcbdd_s1
prompt ===============================================
connect ilap_bdd/ilap_bdd@emcbdd_s1
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

prompt ===============================================
prompt Cargando catálogos de forma manual en emcbdd_s2
prompt ===============================================
connect ilap_bdd/ilap_bdd@emcbdd_s2
delete from status_laptop;
@carga-inicial/status_laptop.sql
commit;

prompt Listo!
exit