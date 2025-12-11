--@Author:          Edgar Ulises Moreno Chalico
--@Fecha creación:  04/12/2025
--@Descripción:     Creación de las vistas - main.

clear screen
whenever sqlerror exit rollback;
set serveroutput on

prompt Iniciando creación de los vistas

prompt ===========================================================
prompt Creando vistas en emcbdd_s1
prompt ===========================================================
connect ilap_bdd/ilap_bdd@emcbdd_s1
prompt Creando las vistas que no requieren blobs
@s-05-ilap-vistas.sql
prompt Creando las tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt Creando las funciones para manejo de BLOBs
@s-05-ilap-funciones-blob.sql
prompt Creando las vistas con soporte para BLOBS
@s-05-ilap-emcbdd_s1-vistas-blob.sql

prompt ===========================================================
prompt Creando vistas en emcbdd_s2
prompt ===========================================================
connect ilap_bdd/ilap_bdd@emcbdd_s2
prompt Creando las vistas que no requieren blobs
@s-05-ilap-vistas.sql
prompt Creando las tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt Creando las funciones para manejo de BLOBs
@s-05-ilap-funciones-blob.sql
prompt Creando las vistas con soporte para BLOBS
@s-05-ilap-emcbdd_s2-vistas-blob.sql


prompt ===========================================================
prompt Creando vistas en dlcbdd_s1
prompt ===========================================================
connect ilap_bdd/ilap_bdd@dlcbdd_s1
prompt Creando las vistas que no requieren blobs
@s-05-ilap-vistas.sql
prompt Creando las tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt Creando las funciones para manejo de BLOBs
@s-05-ilap-funciones-blob.sql
prompt Creando las vistas con soporte para BLOBS
@s-05-ilap-dlcbdd_s1-vistas-blob.sql


prompt ===========================================================
prompt Creando vistas en dlcbdd_s2
prompt ===========================================================
connect ilap_bdd/ilap_bdd@dlcbdd_s2
prompt Creando las vistas que no requieren blobs
@s-05-ilap-vistas.sql
prompt Creando las tablas temporales
@s-05-ilap-tablas-temporales.sql
prompt Creando las funciones para manejo de BLOBs
@s-05-ilap-funciones-blob.sql
prompt Creando las vistas con soporte para BLOBS
@s-05-ilap-dlcbdd_s2-vistas-blob.sql

prompt Listo!
