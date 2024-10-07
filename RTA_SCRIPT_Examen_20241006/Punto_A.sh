#!/bin/bash

echo "Punto A: estructura de directorio simetrica"

sudo mkdir -p /Examenes-UTN/{alumno_{1..3}/parcial_{1..3},{profesores}}

echo
echo "Script ejecutado exitantemente!!"
tree /Examenes-UTN

