#!/bin/bash

echo "Creando el archivo de filtro avanzado con los datos de IP, usuario, Hash de usuario y URL de repositorio..."

echo
echo "Mi IP Publica es: $(curl -s ifconfig.me)" > ~/repogit/UTNFRA_SO_1P2C_2024_Collante/RTA_ARCHIVOS_Examen_20241007/Filtro_Avanzado.txt

echo "Mi usuario es: $(whoami)" >> ~/repogit/UTNFRA_SO_1P2C_2024_Collante/RTA_ARCHIVOS_Examen_20241007/Filtro_Avanzado.txt

echo "El Hash de mi usuario es: $(sudo grep $(whoami) /etc/shadow | awk -F ':' '{print $2}')" >> ~/repogit/UTNFRA_SO_1P2C_2024_Collante/RTA_ARCHIVOS_Examen_20241007/Filtro_Avanzado.txt

echo "La URL de mi repositorio es: $(git remote get-url origin)" >> ~/repogit/UTNFRA_SO_1P2C_2024_Collante/RTA_ARCHIVOS_Examen_20241007/Filtro_Avanzado.txt

cat Filtro_Avanzado.txt

echo
echo 'Script finalizado'
