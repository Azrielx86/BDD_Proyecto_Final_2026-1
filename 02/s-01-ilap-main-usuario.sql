--@Author:          Edgar Ulises Moreno Chalico
--@Fecha creación:  04/12/2025
--@Descripción:     Creación de los usuarios en los 4 nodos.

clear screen
whenever sqlerror exit rollback;
set serveroutput on

prompt Iniciando creación/eliminación de usuarios
accept syspass char prompt 'Proportione el password de sys: ' hide

prompt ===========================================================
prompt Creando usuario en emcbdd_s1
connect sys/&&syspass@emcbdd_s1 as sysdba
@s-01-ilap-usuario.sql

prompt ===========================================================
prompt Creando usuario en emcbdd_s2
connect sys/&&syspass@emcbdd_s2 as sysdba
@s-01-ilap-usuario.sql

prompt ===========================================================
prompt Creando usuario en dlcbdd_s1
connect sys/&&syspass@dlcbdd_s1 as sysdba
@s-01-ilap-usuario.sql

prompt ===========================================================
prompt Creando usuario en dlcbdd_s2
connect sys/&&syspass@dlcbdd_s2 as sysdba
@s-01-ilap-usuario.sql

prompt Listo!
disconnect
