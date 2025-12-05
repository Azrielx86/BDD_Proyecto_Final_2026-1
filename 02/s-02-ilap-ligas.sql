--@Author:          Edgar Ulises Moreno Chalico
--@Fecha creación:  04/12/2025
--@Descripción:     Creación de las ligas en los 4 nodos.

clear screen
whenever sqlerror exit rollback;
set serveroutput on

prompt ==========================
prompt Creado ligas en emcbdd_s1
prompt ==========================
connect ilap_bdd/ilap_bdd@emcbdd_s1
create database link emcbdd_s2.fi.unam using 'EMCBDD_S2';
create database link dlcbdd_s1.fi.unam using 'DLCBDD_S1';
create database link dlcbdd_s2.fi.unam using 'DLCBDD_S2';

prompt ==========================
prompt Creado ligas en emcbdd_s2
prompt ==========================
connect ilap_bdd/ilap_bdd@emcbdd_s2
create database link emcbdd_s1.fi.unam using 'EMCBDD_S1';
create database link dlcbdd_s1.fi.unam using 'DLCBDD_S1';
create database link dlcbdd_s2.fi.unam using 'DLCBDD_S2';

prompt ==========================
prompt Creado ligas en dlcbdd_s1
prompt ==========================
connect ilap_bdd/ilap_bdd@dlcbdd_s1
create database link emcbdd_s1.fi.unam using 'EMCBDD_S1';
create database link emcbdd_s2.fi.unam using 'EMCBDD_S2';
create database link dlcbdd_s2.fi.unam using 'DLCBDD_S2';

prompt ==========================
prompt Creado ligas en dlcbdd_s2
prompt ==========================
connect ilap_bdd/ilap_bdd@dlcbdd_s2
create database link emcbdd_s1.fi.unam using 'EMCBDD_S1';
create database link emcbdd_s2.fi.unam using 'EMCBDD_S2';
create database link dlcbdd_s1.fi.unam using 'DLCBDD_S1';

prompt Listo.
exit

