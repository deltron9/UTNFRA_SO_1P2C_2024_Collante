#!/bin/bash

Disc="/dev/sdc" #Ruta del disco de 10GB

echo "Creando la partición extendida..."
echo

#Usando un Here'sDOC redirijo al comando de fdisk las entradas y creo la partición extendida.
sudo fdisk $Disc << EOF
n
e



w
EOF

echo
echo "Iniciando el proceso de particionamiento..."

#Clavo un bucle FOR porque quiero que quede pro, el bucle crea las particiones lógicas dentro de la partición extendida.
#mediante una iteración del 1 al 10 me aseguro de que se creen 10 particiones iguales dadas las condiciones de tener 900MB de espacio cada una.
for d in {1..10}
do
    echo "Creando la partición lógica $d..."
    echo
    sudo fdisk $Disc << EOF
n
l

+900M
w
EOF
done
echo
echo '¡Increible, funcionó!'

echo
#Fuerzo al kernel leer la tabla para no reiniciar la VM.
sudo partprobe $Disc

echo
echo "Formateando las particiones"
for l in {5..14} #El bucle esta en el rango de 5 a 14 porque las primeras 4 particiones serian las 3 primarias y 1 extendida.
do
    echo '¡Formateando partición!'
    echo
    sudo mkfs.ext4 ${Disc}$l
done
echo 'Formateo de discos ejecutado exitosamente, ¿Increible, no?'
echo

echo 'Comenzando a montar de manera PERSISTENTE...si es que puedo.'
echo
#Mediante sudo lsblk -no UUID *directorio* invoco el UUID del disco creado anteriormente 

 echo "$(sudo lsblk -no UUID /dev/sdc5) /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 2" | sudo tee -a /etc/fstab
 echo "$(sudo lsblk -no UUID /dev/sdc6) /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 2" | sudo tee -a /etc/fstab
 echo "$(sudo lsblk -no UUID /dev/sdc7) /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 2" | sudo tee -a /etc/fstab
 echo "$(sudo lsblk -no UUID /dev/sdc8) /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 2" | sudo tee -a /etc/fstab
 echo "$(sudo lsblk -no UUID /dev/sdc9) /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 2" | sudo tee -a /etc/fstab
 echo "$(sudo lsblk -no UUID /dev/sdc10) /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 2" | sudo tee -a /etc/fstab
 echo "$(sudo lsblk -no UUID /dev/sdc11) /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 2" | sudo tee -a /etc/fstab
 echo "$(sudo lsblk -no UUID /dev/sdc12) /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 2" | sudo tee -a /etc/fstab
 echo "$(sudo lsblk -no UUID /dev/sdc13) /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 2" | sudo tee -a /etc/fstab
 echo "$(sudo lsblk -no UUID /dev/sdc14) /Examenes-UTN/profesores ext4 defaults 0 2" | sudo tee -a /etc/fstab

echo
echo "Muestro los montajes gloriosamente:"
sudo df -h 
lsblk -f /dev/sdb

echo
echo 'Script de creación, formateo y montado de discos de manera persistente terminado.'
