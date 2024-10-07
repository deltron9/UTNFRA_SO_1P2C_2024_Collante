#!/bin/bash

echo "Iniciando creación de estructura de directorios asimétrica"
echo
mkdir -p ~/Estructura_Asimetrica/{{correo,clientes}/cartas_{2..100},correo/carteros_{1..10}}

echo "Usando verificación brindada en el enunciado"
echo
tree  ~/Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4

echo
echo "Una beleza manito kkk"
