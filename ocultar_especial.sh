#!/bin/bash

# Ocultar icono Abrir_ESPECIAL 
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_MMDVMPLUS.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;ls'" /home/pi/Abrir_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_TRANSPARENTE.png" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c Name[es_ES]=." /home/pi/Abrir_ESPECIAL.desktop

cd /home/pi
sudo cp Abrir_ESPECIAL.desktop /home/pi/Desktop
sudo rm /home/pi/Abrir_ESPECIAL.desktop

# Ocultar icono Editar ESPECIAL
cd /home/pi/Desktop
sudo cp Editar_ESPECIAL.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;ls'" /home/pi/Editar_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_TRANSPARENTE.png" /home/pi/Editar_ESPECIAL.desktop
sed -i "11c Name[es_ES]=." /home/pi/Editar_ESPECIAL.desktop

cd /home/pi
sudo cp Editar_ESPECIAL.desktop /home/pi/Desktop
sudo rm /home/pi/Editar_ESPECIAL.desktop

# Ocultar icono Editar info ESPECIAL
cd /home/pi/Desktop
sudo cp RXF_ESPECIAL.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;ls'" /home/pi/RXF_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_TRANSPARENTE.png" /home/pi/RXF_ESPECIAL.desktop
sed -i "11c Name[es_ES]=." /home/pi/RXF_ESPECIAL.desktop

cd /home/pi
sudo cp RXF_ESPECIAL.desktop /home/pi/Desktop
sudo rm /home/pi/RXF_ESPECIAL.desktop