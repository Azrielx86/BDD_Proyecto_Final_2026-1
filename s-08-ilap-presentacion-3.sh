#!/bin/bash
#@Author:           Edgar Ulises Moreno Chalico
#@Fecha creación:   dd/mm/yyyy
#@Descripción:      Copia archivos binarios

# Si ocurre un error, el programa termina.
# set -e
# set -o pipefail

# Si no encuentra el directorio, extrae el contenido del archivo zip
if [[ ! -d "/tmp/bdd/proyecto-final/imagenes/laptops" ]]; then
  echo "Copiando imágenes - laptops de muestra"
  mkdir -p /tmp/bdd/proyecto-final/imagenes
  unzip carga-inicial/laptops.zip -d /tmp/bdd/proyecto-final/imagenes
else
  echo "=> Las imágenes - laptops de muestra ya fueron copiadas"
fi

if [[ ! -d "/tmp/bdd/proyecto-final/imagenes/facturas" ]]; then
  echo "Copiando imágenes - facturas de muestra"
  mkdir -p /tmp/bdd/proyecto-final/imagenes
  unzip carga-inicial/facturas.zip -d /tmp/bdd/proyecto-final/imagenes
else
  echo "=> Las imágenes - facturas de muestra ya fueron copiadas"
fi

chmod -R 755 /tmp/bdd/proyecto-final
