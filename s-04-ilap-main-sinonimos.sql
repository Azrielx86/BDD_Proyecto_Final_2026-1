--@Author:          Edgar Ulises Moreno Chalico
--@Fecha creación:  04/12/2025
--@Descripción:     Creación de los sinónimos - main.

clear screen
whenever sqlerror exit rollback;
set serveroutput on

prompt Iniciando creación de los sinónimos

prompt ===========================================================
prompt Creando sinónimos en emcbdd_s1
prompt ===========================================================
connect ilap_bdd/ilap_bdd@emcbdd_s1
@s-04-ilap-emc-s1-sinonimos.sql
@s-04-valida-sinonimos.sql

prompt ===========================================================
prompt Creando sinónimos en emcbdd_s2
prompt ===========================================================
connect ilap_bdd/ilap_bdd@emcbdd_s2
@s-04-ilap-emc-s2-sinonimos.sql
@s-04-valida-sinonimos.sql

prompt ===========================================================
prompt Creando sinónimos en dlcbdd_s1
prompt ===========================================================
connect ilap_bdd/ilap_bdd@dlcbdd_s1
@s-04-ilap-dlc-s1-sinonimos.sql
@s-04-valida-sinonimos.sql

prompt ===========================================================
prompt Creando sinónimos en dlcbdd_s2
prompt ===========================================================
connect ilap_bdd/ilap_bdd@dlcbdd_s2
@s-04-ilap-dlc-s2-sinonimos.sql
@s-04-valida-sinonimos.sql

prompt Listo!
disconnect
