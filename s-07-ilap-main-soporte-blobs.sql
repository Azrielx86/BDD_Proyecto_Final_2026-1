--@Author:          Edgar Ulises Moreno Chalico
--@Fecha creación:  11/12/2025
--@Descripción:     Script empleado para configurar el soporte de BLOBS en los 4 nodos

Prompt configurando directorios y otorgando registros.
Prompt configurando soporte BLOB para dlcbdd_s1
connect ilap_bdd/ilap_bdd@dlcbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql

Prompt configurando directorios y otorgando registros.
Prompt configurando soporte BLOB para dlcbdd_s2
connect ilap_bdd/ilap_bdd@dlcbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql

Prompt configurando directorios y otorgando registros.
Prompt configurando soporte BLOB para emcbdd_s1
connect ilap_bdd/ilap_bdd@emcbdd_s1
@s-07-ilap-configuracion-soporte-blobs.sql

Prompt configurando directorios y otorgando registros.
Prompt configurando soporte BLOB para emcbdd_s2
connect ilap_bdd/ilap_bdd@emcbdd_s2
@s-07-ilap-configuracion-soporte-blobs.sql