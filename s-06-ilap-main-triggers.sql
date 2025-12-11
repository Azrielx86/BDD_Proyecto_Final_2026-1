--@Author:          Edgar Ulises Moreno Chalico
--@Fecha creación:  04/12/2025
--@Descripción:     Creación de los triggers.
clear screen
whenever sqlerror exit rollback

prompt ==================================*
prompt Creando los triggers en dlcbdd_s1 |
prompt ==================================*
connect ilap_bdd/ilap_bdd@dlcbdd_s1
@s-06-ilap-trigger-sucursal.sql
@s-06-ilap-trigger-dlcbdd-s1-sucursal-taller.sql
@s-06-ilap-trigger-dlcbdd-s1-sucursal-venta.sql
@s-06-ilap-trigger-laptop.sql
@s-06-ilap-trigger-laptop-inventario.sql
@s-06-ilap-trigger-historico-status-laptop.sql
@s-06-ilap-trigger-dlcbdd-s1-servicio-laptop.sql
@s-06-ilap-trigger-tipo-procesador.sql
@s-06-ilap-trigger-tipo-almacenamiento.sql
@s-06-ilap-trigger-tipo-monitor.sql
@s-06-ilap-trigger-tipo-tarjeta_video.sql

prompt ==================================*
prompt Creando los triggers en dlcbdd_s2 |
prompt ==================================*
connect ilap_bdd/ilap_bdd@dlcbdd_s2
@s-06-ilap-trigger-sucursal.sql
@s-06-ilap-trigger-dlcbdd-s2-sucursal-taller.sql
@s-06-ilap-trigger-dlcbdd-s2-sucursal-venta.sql
@s-06-ilap-trigger-laptop-inventario.sql
@s-06-ilap-dlc-s2-trigger-laptop.sql
@s-06-ilap-trigger-historico-status-laptop.sql
@s-06-ilap-trigger-dlcbdd-s2-servicio-laptop.sql
@s-06-ilap-trigger-tipo-procesador.sql
@s-06-ilap-trigger-tipo-almacenamiento.sql
@s-06-ilap-trigger-tipo-monitor.sql
@s-06-ilap-trigger-tipo-tarjeta_video.sql

prompt ==================================*
prompt Creando los triggers en emcbdd_s1 |
prompt ==================================*
connect ilap_bdd/ilap_bdd@emcbdd_s1
@s-06-ilap-trigger-sucursal.sql
@s-06-ilap-trigger-emcbdd-s1-sucursal-taller.sql
@s-06-ilap-trigger-emcbdd-s1-sucursal-venta.sql
@s-06-ilap-trigger-laptop.sql
@s-06-ilap-trigger-laptop-inventario.sql
@s-06-ilap-trigger-historico-status-laptop.sql
@s-06-ilap-trigger-emcbdd-s1-servicio-laptop.sql
@s-06-ilap-trigger-tipo-procesador.sql
@s-06-ilap-trigger-tipo-almacenamiento.sql
@s-06-ilap-trigger-tipo-monitor.sql
@s-06-ilap-trigger-tipo-tarjeta_video.sql

prompt ==================================*
prompt Creando los triggers en emcbdd_s2 |
prompt ==================================*
connect ilap_bdd/ilap_bdd@emcbdd_s2
@s-06-ilap-trigger-sucursal.sql
@s-06-ilap-trigger-emcbdd-s2-sucursal-taller.sql
@s-06-ilap-trigger-emcbdd-s2-sucursal-venta.sql
@s-06-ilap-trigger-laptop.sql
@s-06-ilap-trigger-laptop-inventario.sql
@s-06-ilap-trigger-historico-status-laptop.sql
@s-06-ilap-trigger-emcbdd-s2-servicio-laptop.sql
@s-06-ilap-trigger-tipo-procesador.sql
@s-06-ilap-trigger-tipo-almacenamiento.sql
@s-06-ilap-trigger-tipo-monitor.sql
@s-06-ilap-trigger-tipo-tarjeta_video.sql

prompt Listo!