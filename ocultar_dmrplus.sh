#!/bin/bash

# Ocultar icono Abrir_MMDVMPLUS
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_MMDVMPLUS.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;ls'" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_TRANSPARENTE.png" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "10c Name[es_ES]=." /home/pi/Abrir_MMDVMPLUS.desktop

cd /home/pi
sudo cp Abrir_MMDVMPLUS.desktop /home/pi/Desktop
sudo rm /home/pi/Abrir_MMDVMPLUS.desktop

# Ocultar icono Editar DMRPLUS
cd /home/pi/Desktop
sudo cp Editar_DMRPLUS.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;ls'" /home/pi/Editar_DMRPLUS.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_TRANSPARENTE.png" /home/pi/Editar_DMRPLUS.desktop
sed -i "11c Name[es_ES]=." /home/pi/Editar_DMRPLUS.desktop

cd /home/pi
sudo cp Editar_DMRPLUS.desktop /home/pi/Desktop
sudo rm /home/pi/Editar_DMRPLUS.desktop

# Ocultar icono Editar info DMRPLUS
cd /home/pi/Desktop
sudo cp RXF_DMRPLUS.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;ls'" /home/pi/RXF_DMRPLUS.desktop
sed -i "6c Icon=/home/pi/$SCRIPTS_version/ICONO_TRANSPARENTE.png" /home/pi/RXF_DMRPLUS.desktop
sed -i "11c Name[es_ES]=." /home/pi/RXF_DMRPLUS.desktop

cd /home/pi
sudo cp RXF_DMRPLUS.desktop /home/pi/Desktop
sudo rm /home/pi/RXF_DMRPLUS.desktop