#!/bin/bash

echo "Crando los usuarios..."
echo
sudo useradd p1c2_2024_A1
sudo useradd p1c2_2024_A2
sudo useradd p1c2_2024_A3
sudo useradd p1c2_2024_P1

echo "Creando de los grupos..."
echo
sudo groupadd p1c2_2024_g_Alumno
sudo groupadd p1c2_2024_g_Profesores

echo "Modificación de los grupos de los usuarios"
echo
sudo usermod -aG p1c2_2024_gAlumno p1c2_2024_A1
sudo usermod -aG p1c2_2024_gAlumno p1c2_2024_A2
sudo usermod -aG p1c2_2024_gAlumno p1c2_2024_A3
sudo usermod -aG p1c2_2024_gProfesores p1c2_2024_P1


echo "Asignando la misma clave que el usuario"
echo
echo "p1c2_2024_A1:p1c2_2024_A1" | sudo chpasswd
echo "p1c2_2024_A2:p1c2_2024_A2" | sudo chpasswd
echo "p1c2_2024_A3:p1c2_2024_A3" | sudo chpasswd
echo "p1c2_2024_P1:p1c2_2024_P1" | sudo chpasswd

echo "Ajustando los permisos..."
echo
sudo chmod -R 750 /Examenes-UTN/alumno_1
sudo chmod -R 760 /Examenes-UTN/alumno_2
sudo chmod -R 700 /Examenes-UTN/alumno_3


echo "Ajustando los dueños..."
echo
sudo chown -R p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1  
sudo chown -R p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chown -R p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chown -R p1c2_2024_P1:p1c2_2024_g_Profesores /Examenes-UTN/profesores


echo "Validando los permisos y owners..."
echo

sudo ls -ld /Examenes-UTN/alumno_1  
sudo ls -l /Examenes-UTN/alumno_1 

sudo ls -ld /Examenes-UTN/alumno_2
sudo ls -l /Examenes-UTN/alumno_2 

sudo ls -ld /Examenes-UTN/alumno_3
sudo ls -l /Examenes-UTN/alumno_3 

sudo ls -ld /Examenes-UTN/profesores
sudo ls -l /Examenes-UTN/profesores  
echo

echo "Creando archivo con p1c1_2024_u1 "
echo
sudo  whoami > Examenes-UTN/alumno_1/validar1.txt p1c2_2024_A1 
sudo  whoami > Examenes-UTN/alumno_2/validar2.txt p1c2_2024_A2
sudo  whoami > Examenes-UTN/alumno_3/validar3.txt p1c2_2024_A3
sudo  whoami > /Examenes-UTN/profesores/validar4.txt p1c2_2024_P1

echo "Permisos de los archivos creados: "
echo
sudo ls -l Examenes-UTN/alumno_1/validar1.txt
sudo ls -l Examenes-UTN/alumno_2/validar2.txt
sudo ls -l Examenes-UTN/alumno_3/validar3.txt
sudo ls -l Examenes-UTN/profesores/validar4.txt


echo "Mostramos los archivos: "
echo
sudo cat Examenes-UTN/alumno_1/validar1.txt
sudo cat Examenes-UTN/alumno_2/validar2.txt
sudo cat Examenes-UTN/alumno_3/validar3.txt
sudo cat Examenes-UTN/profesores/validar4.txt

echo
echo 'Script finalizado'
