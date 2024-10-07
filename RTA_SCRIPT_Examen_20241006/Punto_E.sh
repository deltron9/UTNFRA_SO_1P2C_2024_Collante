#!/bin/bash

echo "Filtrando la info de la memoria RAM para crear un .txt que contenga su información..."
grep MemTotal /proc/meminfo > ~/repogit/UTNFRA_SO_1P2C_2024_Collante/RTA_ARCHIVOS_Examen_20241006/Filtro_Basico.txt

echo "Filtrando la info de chasis para añadirla al .txt creado anteriormente..."
echo
sudo dmidecode -t chassis | grep Manufacturer >> Filtro_Basico.txt 

echo 'Script de filtro ejecutado exitosamente (?'
